package com.kalaazu.cms.server;

import io.vertx.core.Vertx;
import io.vertx.ext.bridge.PermittedOptions;
import io.vertx.ext.web.handler.sockjs.BridgeOptions;
import io.vertx.ext.web.handler.sockjs.SockJSHandler;

/**
 * Bridge class.
 * =============
 *
 * Bridge between the browser and the event bus.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Bridge {
    /**
     * Creates and returns a bridge.
     *
     * @param vertx Vertx instance.
     *
     * @return Bridge instance.
     */
    public static SockJSHandler create(Vertx vertx) {
        var handler = SockJSHandler.create(vertx);
        handler.bridge(Bridge.options());

        return handler;
    }

    /**
     * Builds and returns the bridge options.
     *
     * @return Bridge options.
     */
    private static BridgeOptions options() {
        var options = new BridgeOptions();

        options.addInboundPermitted(new PermittedOptions().setAddress("persistence.register"))
               .addInboundPermitted(new PermittedOptions().setAddress("persistence.login"))
               .addInboundPermitted(new PermittedOptions().setAddress("persistence.create_account"));

        return options;
    }
}
