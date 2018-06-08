package com.kalaazu.cms;

import com.kalaazu.cms.eventsystem.EventListener;
import com.kalaazu.cms.server.Server;
import io.vertx.core.AbstractVerticle;
import io.vertx.core.Future;
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
    public void start(Future<Void> startFuture) {
        CMS.logger.info("Starting web server...");

        var port       = config().getInteger("cms.port", 8080);
        var host       = config().getString("cms.host", "localhost");
        var viewsPath  = config().getString("cms.viewsPath", "www/views");
        var assetsPath = config().getString("cms.assetsPath", "www/public_html");

        this.server = new Server(port, host, viewsPath, assetsPath);

        this.server.initialize();

        CMS.logger.info("Starting event listener...");
        var listener = new EventListener();
        listener.initialize();

        CMS.logger.info("CMS started!");

        startFuture.complete();
    }

    /**
     * Stops the server.
     */
    public void stop() {
        CMS.logger.info("Stopping web server...");
        this.server.stop();
    }

    /**
     * Starts the server.
     */
    public void start() {
        CMS.logger.info("Starting web server...");
        this.server.start();
    }

    /**
     * Restarts the server.
     */
    public void restart() {
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
