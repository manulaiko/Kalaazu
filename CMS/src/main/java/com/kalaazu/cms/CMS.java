package com.kalaazu.cms;

import com.kalaazu.cms.eventsystem.EventListener;
import com.kalaazu.cms.server.Server;
import io.vertx.core.AbstractVerticle;
import io.vertx.core.Promise;
import io.vertx.core.logging.Logger;
import io.vertx.core.logging.LoggerFactory;

/**
 * CMS class.
 * ==========
 *
 * Serves as the module's facade.
 *
 * Use `CMSBuilder` to instantiate this class.
 *
 * Once instantiated you can use the `start`, `stop` or `restart`
 * methods to manage the HTTP server.
 *
 * Example:
 *
 * ```java
 * if (cms.isRunning()) {
 * cms.stop();
 * }
 *
 * cms.start();
 * ```
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class CMS extends AbstractVerticle {
    /**
     * Console logger.
     */
    public static final Logger logger = LoggerFactory.getLogger(CMS.class);

    /**
     * The server.
     */
    private Server server;

    @Override
    public void start(Promise<Void> startFuture) {
        CMS.logger.info("Starting web server...");

        var port    = config().getInteger("cms.port", 80);
        var host    = config().getString("cms.host", "localhost");
        var webRoot = config().getString("cms.webRoot", "src/main/www/dist");

        this.server = Server.builder()
                            .host(host)
                            .port(port)
                            .webRoot(webRoot)
                            .vertx(vertx)
                            .build();

        try {
            this.server.initialize();

            CMS.logger.info("Starting event listener...");
            var listener = new EventListener();
            listener.initialize();

            CMS.logger.info("CMS started!");

            startFuture.complete();
        } catch (Exception e) {
            startFuture.fail(e);
        }
    }

    /**
     * Stops the server.
     */
    public void stopServer() {
        CMS.logger.info("Stopping web server...");
        this.server.stop();
    }

    /**
     * Starts the server.
     */
    public void startServer() {
        CMS.logger.info("Starting web server...");
        this.server.start();
    }

    /**
     * Restarts the server.
     */
    public void restartServer() {
        this.server.restart();
    }

    /**
     * Checks whether the server is running or not.
     *
     * @return Whether the server is running or not.
     */
    public boolean isRunning() {
        return this.server.isRunning();
    }
}
