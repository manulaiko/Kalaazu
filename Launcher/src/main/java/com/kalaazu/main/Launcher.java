package com.kalaazu.main;

import com.kalaazu.cms.CMS;
import com.kalaazu.persistence.Persistence;
import io.vertx.core.AbstractVerticle;
import io.vertx.core.DeploymentOptions;
import lombok.extern.slf4j.Slf4j;

/**
 * Launcher class.
 * ===============
 *
 * The starting point of the application.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Slf4j
public class Launcher extends AbstractVerticle {
    /**
     * Deployment options.
     */
    private DeploymentOptions opts;

    @Override
    public void start() {
        log.info("Starting Kalaazu...");

        this.opts = new DeploymentOptions();
        this.opts.setWorker(true)
                 .setConfig(config());

        log.info("Starting Persistence module...");
        vertx.deployVerticle(new Persistence(), this.opts, h -> {
            if (h.failed()) {
                log.error("Couldn't start persistence!");

                return;
            }

            this.startCMS();
        });
    }

    /**
     * Starts and deploys the CMS verticle.
     */
    public void startCMS() {
        log.info("Starting CMS module...");

        vertx.deployVerticle(new CMS(), this.opts, h -> {
            if (h.failed()) {
                log.warn("Couldn't start CMS!", h.cause());
            }
        });
    }
}
