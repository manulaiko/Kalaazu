package com.kalaazu.cms.server;

import com.fizzed.rocker.Rocker;
import io.vertx.core.Handler;
import io.vertx.ext.web.RoutingContext;

import java.nio.file.Path;
import java.util.HashMap;
import java.util.Map;

/**
 * PHP handler.
 * ============
 *
 * Handles request to PHP scripts.
 *
 * Will load the different file handlers and call the appropriated one.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class DynamicHandler implements Handler<RoutingContext> {
    /**
     * Path to the web root.
     */
    private Path webRoot;

    /**
     * Server host.
     */
    private String host;

    /**
     * The different file handlers.
     */
    private Map<String, Handler<RoutingContext>> handlers;

    /**
     * Constructor.
     *
     * @param webRoot Path to the web root.
     * @param host    Server host.
     */
    public DynamicHandler(Path webRoot, String host) {
        this.webRoot = webRoot;
        this.host = host;
        this.handlers = new HashMap<>();

        this.registerHandlers();
    }

    /**
     * Registers the file handlers.
     */
    private void registerHandlers() {
        this.handlers.put("/spacemap/xml/maps.php", h -> {
            var r = h.response();
            var t = this.webRoot.resolve("/spacemap/xml/maps.php")
                                .toAbsolutePath()
                                .toString();
            r.putHeader("Content-Type", "application/xml");
            r.end(
                    Rocker.template(t)
                          .bind("server", this.host)
                          .render()
                          .toString()
            );
        });
    }

    @Override
    public void handle(RoutingContext event) {
        var h = this.handlers.getOrDefault(
                event.request()
                     .path(),
                null
        );

        if (h != null) {
            h.handle(event);
        } else {
            event.next();
        }
    }
}
