package com.kalaazu.cms;

import com.kalaazu.KalaazuConfig;
import com.kalaazu.cms.config.WebConfig;
import com.kalaazu.event.StartServer;
import com.kalaazu.event.StopServer;
import com.kalaazu.util.Logger;
import com.kalaazu.util.LoggingCategory;
import jakarta.annotation.PreDestroy;
import jakarta.servlet.ServletContext;
import lombok.Getter;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

/**
 * CMS class.
 * ==========
 * <p>
 * Configures the CMS server.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Configuration
@Component
public class CMS implements Logger {
    private ConfigurableApplicationContext ctx;

    private final KalaazuConfig config;
    private final ConfigurableApplicationContext parent;

    @Getter
    private final LoggingCategory category = LoggingCategory.CMS;

    private final ExecutorService npmLogExecutor =
            Executors.newSingleThreadExecutor(r -> {
                var t = new Thread(r, "cms-npm-serve");
                t.setDaemon(true);
                return t;
            });

    private volatile Process npmServeProcess;

    public CMS(KalaazuConfig config, ConfigurableApplicationContext parent) {
        this.config = config;
        this.parent = parent;
    }

    /**
     * Handle an application event.
     *
     * @param event the event to respond to
     */
    @EventListener
    public void start(StartServer event) {
        var port = config.getPort().getCms();
        info("Starting CMS server on port " + port);

        var env = parent.getEnvironment();

        ctx = new SpringApplicationBuilder(CmsServer.class)
                .sources(WebConfig.class)
                .bannerMode(Banner.Mode.OFF)
                .web(WebApplicationType.SERVLET)
                .build()
                .run(
                        "--spring.main.lazy-initialization=" + env.getProperty("spring.main.lazy-initialization", "false"),
                        "--spring.threads.virtual.enabled=" + env.getProperty("spring.threads.virtual.enabled", "false"),
                        "--spring.datasource.url=" + env.getProperty("spring.datasource.url"),
                        "--spring.datasource.username=" + env.getProperty("spring.datasource.username"),
                        "--spring.datasource.password=" + env.getProperty("spring.datasource.password"),
                        "--spring.datasource.hikari.pool-name=cms-hikari-pool",
                        "--spring.datasource.hikari.register-mbeans=false",
                        "--spring.jpa.database-platform=" + env.getProperty("spring.jpa.database-platform"),
                        "--spring.jpa.hibernate.ddl-auto=" + env.getProperty("spring.jpa.hibernate.ddl-auto", "update"),
                        "--spring.jpa.open-in-view=false",
                        "--spring.profiles.active=" + env.getProperty("spring.profiles.active", "default"),
                        "--spring.jmx.enabled=false",
                        "--spring.application.admin.enabled=false",
                        "--spring.main.web-application-type=servlet",
                        "--spring.mvc.dispatch-options-request=true",
                        "--server.port=" + port
                );

        startNpmServeIfEnabled();
    }

    @PreDestroy
    public void destroy() {
        info("Stopping UI dev server...");
        stopNpmServe(Duration.ofSeconds(10));
        npmLogExecutor.shutdownNow();
        info("UI dev server stopped.");
    }

    /**
     * Handle an application event.
     *
     * @param event the event to respond to
     */
    @EventListener
    public void stop(StopServer event) {
        info("Stopping CMS server...");

        stopNpmServe(Duration.ofSeconds(10));

        if (ctx != null) {
            SpringApplication.exit(ctx, () -> 0);
            ctx.close();
            ctx = null;
        }

        info("CMS server stopped.");
    }

    private void startNpmServeIfEnabled() {
        // Gate it so you can disable in prod/CI: set CMS_RUN_NPM_SERVE=false
        var enabled = Boolean.parseBoolean(System.getenv().getOrDefault("CMS_RUN_NPM_SERVE", "true"));
        if (!enabled) return;

        // Don’t start twice
        var existing = npmServeProcess;
        if (existing != null && existing.isAlive()) return;

        try {
            var webDir = resolveWebDir();

            List<String> cmd = new ArrayList<>(npmBaseCommand());
            cmd.add("run");
            cmd.add("serve");

            // Optional: allow custom dev-server port (Vue CLI supports `-- --port <n>`)
            var uiPort = System.getenv("CMS_UI_PORT");
            if (uiPort != null && !uiPort.isBlank()) {
                cmd.add("--");
                cmd.add("--port");
                cmd.add(uiPort.trim());
            }

            var pb = new ProcessBuilder(cmd);
            pb.directory(webDir.toFile());
            pb.redirectErrorStream(true);

            npmServeProcess = pb.start();

            // Consume output asynchronously so buffers don’t fill and block the process
            npmLogExecutor.submit(() -> streamProcessOutput(npmServeProcess));

            info("CMS UI dev server started: " + String.join(" ", cmd));
        } catch (Exception e) {
            error("Failed to start 'npm run serve' for CMS UI", e);
            throw new RuntimeException("Failed to start 'npm run serve' for CMS UI", e);
        }
    }

    private void stopNpmServe(Duration timeout) {
        var p = npmServeProcess;
        if (p == null) return;

        try {
            if (!p.isAlive()) {
                npmServeProcess = null;
                return;
            }

            var handle = p.toHandle();

            // Try graceful stop for process tree
            handle.descendants().forEach(ph -> {
                try { ph.destroy(); } catch (Exception ignored) {}
            });
            handle.destroy();

            var exited = p.waitFor(timeout.toMillis(), TimeUnit.MILLISECONDS);
            if (!exited) {
                // Force kill process tree
                handle.descendants().forEach(ph -> {
                    try { ph.destroyForcibly(); } catch (Exception ignored) {}
                });
                handle.destroyForcibly();
                p.waitFor(5, TimeUnit.SECONDS);
            }
        } catch (InterruptedException ie) {
            warn("Interrupted while stopping npm serve process", ie);
            Thread.currentThread().interrupt();
        } finally {
            npmServeProcess = null;
        }
    }

    private void streamProcessOutput(Process p) {
        try (var r = new BufferedReader(
                new InputStreamReader(p.getInputStream(), StandardCharsets.UTF_8))) {
            String line;
            while ((line = r.readLine()) != null) {
                System.out.println("[CMS:UI] " + line);
            }
        } catch (Exception exception) {
            warn("Error while reading npm serve output", exception);
            // no-op
        }
    }

    /**
     * Mirrors your Gradle approach:
     * - NPM_EXE (default: "npm")
     * - NPM_ARGS (default: "")
     * <p>
     * On Windows+nvm-windows you can point NPM_EXE to pwsh.exe (or powershell.exe)
     * and NPM_ARGS to "-NoProfile ... -File ...\\npm.ps1".
     */
    private List<String> npmBaseCommand() {
        var npmExe = firstNonBlank(
                System.getenv("npmExe"),
                System.getenv("NPM_EXE"),
                System.getProperty("npm.exe"),
                "npm"
        );

        var npmArgs = firstNonBlank(
                System.getenv("npmArgs"),
                System.getenv("NPM_ARGS"),
                System.getProperty("npm.args"),
                ""
        ).trim();

        List<String> cmd = new ArrayList<>();
        cmd.add(npmExe);

        if (!npmArgs.isEmpty()) {
            Collections.addAll(cmd, npmArgs.split("\\s+"));
        }
        return cmd;
    }

    private static String firstNonBlank(String... values) {
        for (var v : values) {
            if (v != null && !v.isBlank()) return v;
        }
        return "";
    }

    /**
     * Resolve the frontend working directory.
     * Use an env var so IntelliJ/CLI can be consistent regardless of working directory.
     */
    private Path resolveWebDir() {
        var override = System.getenv("CMS_WEB_DIR");
        if (override != null && !override.isBlank()) {
            var p = Path.of(override.trim()).toAbsolutePath().normalize();
            if (!p.toFile().isDirectory()) {
                error("CMS_WEB_DIR points to a non-directory: " + p);
                throw new IllegalStateException("CMS_WEB_DIR points to a non-directory: " + p);
            }
            return p;
        }

        // Multi-module repo default (from repo root)
        var p1 = Path.of("CMS", "src", "main", "www").toAbsolutePath().normalize();
        if (p1.toFile().isDirectory()) return p1;

        // Single-module fallback
        var p2 = Path.of("src", "main", "www").toAbsolutePath().normalize();
        if (p2.toFile().isDirectory()) return p2;

        error("Could not locate CMS web dir. Set CMS_WEB_DIR explicitly.");
        throw new IllegalStateException("Could not locate CMS web dir. Set CMS_WEB_DIR explicitly.");
    }

}
