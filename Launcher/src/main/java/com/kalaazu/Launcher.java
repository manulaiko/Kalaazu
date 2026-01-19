package com.kalaazu;

import atlantafx.base.theme.PrimerDark;
import com.kalaazu.event.StartServer;
import com.kalaazu.persistence.database.DatabaseManager;
import com.kalaazu.ui.LoadingScreen;
import com.kalaazu.ui.SceneManager;
import com.kalaazu.ui.event.ShowMainScreen;
import com.kalaazu.ui.presenter.MainLayout;
import com.kalaazu.util.Logger;
import com.kalaazu.util.LoggingCategory;
import javafx.application.Application;
import javafx.scene.image.Image;
import javafx.stage.Stage;
import javafx.stage.StageStyle;
import lombok.Getter;
import lombok.SneakyThrows;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import java.io.IOException;
import java.util.Arrays;

/**
 * Launcher class.
 * ===============
 * <p>
 * The starting point of the application.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@SpringBootApplication
@ComponentScan(
        basePackages = "com.kalaazu",
        excludeFilters = @ComponentScan.Filter(
                type = FilterType.REGEX,
                pattern = "com\\.kalaazu\\.cms\\.(?!CMS$).*"
        )
)
public class Launcher extends Application implements Logger {
    @Getter
    private final LoggingCategory category = LoggingCategory.UI;
    private static final LoadingScreen loadingScreen = new LoadingScreen();

    @Getter
    private static Launcher instance;
    private ConfigurableApplicationContext ctx;

    /**
     * Main method.
     *
     * @param args Command line arguments.
     */
    public static void main(String[] args) {
        loadingScreen.show();
        Application.launch(Launcher.class, args);
    }

    @Override
    public void init() {
        info("Init Kalaazu...");
        ctx = new SpringApplicationBuilder(Launcher.class).run();
        instance = this;

        info("Running database initialization...");
        var dbManager = ctx.getBean(DatabaseManager.class);
        dbManager.runStartupInitialization();

        loadingScreen.close();
    }

    @Override
    @SneakyThrows
    public void start(Stage stage) {
        info("Starting Kalaazu...");
        var sceneManager = ctx.getBean(SceneManager.class);
        var config = ctx.getBean(KalaazuConfig.class);

        var resolver = new PathMatchingResourcePatternResolver();
        var icons = resolver.getResources("classpath:img/icon*.*");

        Arrays.stream(icons)
                .map(i -> {
                    try {
                        return new Image(i.getInputStream());
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    }
                })
                .forEach(stage.getIcons()::add);

        stage.setTitle("Kalaazu");
        stage.initStyle(StageStyle.UNDECORATED);

        Application.setUserAgentStylesheet(new PrimerDark().getUserAgentStylesheet());

        sceneManager.setStage(stage);
        sceneManager.setRootScene(MainLayout.class);

        ctx.publishEvent(new ShowMainScreen());
        if (config.isAutoStart()) {
            ctx.publishEvent(new StartServer());
        }
    }

    /**
     * @inheritDoc
     */
    @Override
    public void stop() {
        System.exit(0);
    }
}
