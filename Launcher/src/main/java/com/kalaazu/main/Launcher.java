package com.kalaazu.main;

import com.kalaazu.persistence.Persistence;
import io.vertx.core.AbstractVerticle;
import io.vertx.core.logging.Logger;
import io.vertx.core.logging.LoggerFactory;

/**
 * Launcher class.
 * ===============
 *
 * The starting point of the application.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Launcher extends AbstractVerticle {
    /**
     * Console logger.
     */
    public static Logger logger;

    @Override
    public void start() {
        this.setLogger();

        Launcher.logger.info("Starting Kalaazu...");
        vertx.deployVerticle(new Persistence());
    }

    /**
     * Configures the loggers.
     */
    public void setLogger() {
        System.setProperty("vertx.logger-delegate-factory-class-name", "io.vertx.core.logging.SLF4JLogDelegateFactory");
        System.setProperty("org.slf4j.simpleLogger.defaultLogLevel", config().getString("logLevel", "DEBUG"));
        Launcher.logger  = LoggerFactory.getLogger(Launcher.class);
    }
}
