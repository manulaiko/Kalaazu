package com.kalaazu.cms.server;

import com.kalaazu.cms.mvc.Triad;
import com.kalaazu.cms.mvc.View;
import com.kalaazu.cms.mvc.pages.External;
import io.vertx.core.AsyncResult;
import io.vertx.core.Handler;
import io.vertx.core.Vertx;
import io.vertx.core.http.HttpServer;
import io.vertx.core.logging.Logger;
import io.vertx.core.logging.LoggerFactory;
import io.vertx.ext.web.Router;
import io.vertx.ext.web.handler.BodyHandler;
import io.vertx.ext.web.handler.StaticHandler;

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
     * Console logger.
     */
    public static final Logger logger = LoggerFactory.getLogger(Server.class);

    /**
     * Server host.
     */
    private final String host;

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
    private List<Triad> triads = new ArrayList<>();

    /**
     * Constructor.
     *
     * @param port       Port to listen for HTTP requests.
     * @param host       Server host.
     * @param viewsPath  Path to the views.
     * @param assetsPath Path to the static assets.
     */
    public Server(int port, String host, String viewsPath, String assetsPath) {
        this.port = port;
        this.host = host;
        this.viewsPath = viewsPath;
        this.assetsPath = assetsPath;
    }

    /**
     * Initializes the HTTP server.
     */
    public void initialize() {
        View.viewsPath = this.viewsPath;

        var url = "http://" + this.host;
        if (this.port != 80) {
            url += ":" + this.port;
        }
        url += "/";

        View.globalVariables.put("URL", url);

        var vertx = Vertx.currentContext()
                         .owner();

        this.router = Router.router(vertx);
        this.server = vertx.createHttpServer();

        this.registerRoutes();

        this.server.requestHandler(router::accept);

        this.server.listen(this.port, this.host);
        Server.logger.info("Listening on port " + this.server.actualPort());
    }

    /**
     * Registers the route handlers in the router.
     */
    private void registerRoutes() {
        this.registerTriads();

        this.router.route("/*")
                   .handler(BodyHandler.create());
        this.router.route("/*")
                   .handler(c -> {
                       var r = c.request();
                       Server.logger.info(r.method() + ": " + r.uri());

                       c.next();
                   });

        this.triads.forEach(t -> this.router.route(t.getEndpoint() + "/*")
                                            .handler(t::handle));
        this.router.route("/assets/*")
                   .handler(StaticHandler.create(this.assetsPath));

        this.router.route("/")
                   .handler(c -> c.reroute("/External"));
    }

    /**
     * Registers the Triad instances.
     */
    private void registerTriads() {
        this.triads.add(new External());
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
