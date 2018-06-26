package com.kalaazu.cms.server;

import io.vertx.core.AsyncResult;
import io.vertx.core.Handler;
import io.vertx.core.Vertx;
import io.vertx.core.http.HttpServer;
import io.vertx.core.logging.Logger;
import io.vertx.core.logging.LoggerFactory;
import io.vertx.ext.web.Router;
import io.vertx.ext.web.handler.BodyHandler;
import io.vertx.ext.web.handler.StaticHandler;

/**
 * Server class.
 * =============
 *
 * Manages the HTTP server and dispatches the incoming requests.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Server {
    /**
     * Console logger.
     */
    public static final Logger logger = LoggerFactory.getLogger(Server.class);

    /**
     * Server host.
     */
    private final String host;

    /**
     * The path to the static assets.
     */
    private String assetsPath;

    /**
     * The port to listen.
     */
    private int port;

    /**
     * The router instance.
     */
    private Router router;

    /**
     * The HTTP server instance.
     */
    private HttpServer server;

    /**
     * The Vertx instance.
     */
    private Vertx vertx;

    /**
     * Constructor.
     *
     * @param port       Port to listen for HTTP requests.
     * @param host       Server host.
     * @param assetsPath Path to the static assets.
     * @param vertx      Vertx instance.
     */
    public Server(int port, String host, String assetsPath, Vertx vertx) {
        this.port = port;
        this.host = host;
        this.assetsPath = assetsPath;
        this.vertx = vertx;
    }

    /**
     * Initializes the HTTP server.
     */
    public void initialize() {
        this.router = Router.router(this.vertx);
        this.server = this.vertx.createHttpServer();

        this.registerRoutes();

        this.server.requestHandler(router::accept);

        this.server.listen(this.port, this.host);
        Server.logger.info("Listening on port " + this.server.actualPort());
    }

    /**
     * Registers the route handlers in the router.
     */
    private void registerRoutes() {
        this.router.route("/*")
                   .handler(BodyHandler.create());

        this.router.route("/eventbus/*")
                   .handler(Bridge.create((this.vertx)));
        this.router.route("/*")
                   .handler(StaticHandler.create(this.assetsPath));
    }

    /**
     * Starts the HTTP server.
     */
    public void start() {
        if (this.isRunning()) {
            return;
        }

        this.server.listen(this.port);
    }

    /**
     * Stops the HTTP server.
     *
     * @param onClose Handler to call when the server is closed.
     */
    public void stop(Handler<AsyncResult<Void>> onClose) {
        if (!this.isRunning()) {
            return;
        }

        this.server.close(onClose);
    }

    /**
     * Stops the HTTP server.
     */
    public void stop() {
        this.stop(h -> {
            if (h.failed()) {
                throw new RuntimeException("Couldn't close HTTP server!", h.cause());
            }
        });
    }

    /**
     * Restarts the server.
     */
    public void restart() {
        if (!this.isRunning()) {
            this.start();
        }

        this.stop(h -> {
            if (h.succeeded()) {
                this.start();
            }
        });
    }

    /**
     * Checks if the server is running.
     */
    public boolean isRunning() {
        return this.server.actualPort() != 0;
    }
}
