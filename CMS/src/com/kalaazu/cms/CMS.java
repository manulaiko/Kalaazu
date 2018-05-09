package com.kalaazu.cms;

import com.kalaazu.cms.server.Server;
import com.kalaazu.eventsystem.EventManager;
import com.kalaazu.persistence.Persistence;

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
 *     cms.stop();
 * }
 *
 * cms.start();
 * ```
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class CMS {
    /**
     * The event manager.
     */
    private EventManager eventManager;

    /**
     * The persistence instance.
     */
    private Persistence persistence;

    /**
     * The server.
     */
    private Server server;

    /**
     * Constructor.
     *
     * @param eventManager The event manager.
     * @param persistence  The persistence instance.
     */
    public CMS(EventManager eventManager, Persistence persistence) {
        this.eventManager = eventManager;
        this.persistence  = persistence;
    }

    /**
     * Initializes the CMS.
     *
     * @param port       Port to listen for HTTP requests.
     * @param viewsPath  Path to the views.
     * @param assetsPath Path to the static assets.
     */
    public void initialize(int port, String viewsPath, String assetsPath) {
        this.server = new Server(port, viewsPath, assetsPath);

        this.server.initialize();
    }

    /**
     * Stops the server.
     */
    public void stop() {
        this.server.stop();
    }

    /**
     * Starts the server.
     */
    public void start() {
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
