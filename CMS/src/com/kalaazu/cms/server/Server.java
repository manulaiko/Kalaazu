package com.kalaazu.cms.server;

import io.vertx.core.AsyncResult;
import io.vertx.core.Handler;
import io.vertx.core.Vertx;
import io.vertx.core.http.HttpServer;
import io.vertx.ext.web.Router;

import java.util.ArrayList;
import java.util.List;

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
     * The path to the views.
     */
    private String viewsPath;

    /**
     * The path to the static assets.
     */
    private String assetsPath;

    /**
     * The port to listen.
     */
    private int port;

    /**
     * The Vertx instance.
     */
    private Vertx vertx;

    /**
     * The router instance.
     */
    private Router router;

    /**
     * The HTTP server instance.
     */
    private HttpServer server;

    /**
     * Registered triads.
     */
    private List triads = new ArrayList<>();

    /**
     * Constructor.
     *
     * @param port       Port to listen for HTTP requests.
     * @param viewsPath  Path to the views.
     * @param assetsPath Path to the static assets.
     */
    public Server(int port, String viewsPath, String assetsPath) {
        this.port = port;
        this.viewsPath = viewsPath;
        this.assetsPath = assetsPath;
    }

    /**
     * Initializes the HTTP server.
     */
    public void initialize() {
        this.vertx  = Vertx.vertx();
        this.router = Router.router(vertx);
        this.server = vertx.createHttpServer();

        this.registerRoutes();

        this.server.requestHandler(router::accept);
    }

    /**
     * Registers the route handlers in the router.
     */
    private void registerRoutes() {
        this.registerTriads();
    }

    /**
     * Registers the Triad instances.
     */
    private void registerTriads() {

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
        // TODO there's no way to know if it's actually running.
        return this.server.actualPort() > 0;
    }
}
