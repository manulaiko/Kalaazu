package com.kalaazu.persistence;

import io.vertx.core.DeploymentOptions;
import io.vertx.core.Vertx;
import io.vertx.core.json.JsonObject;
import io.vertx.core.logging.LoggerFactory;

import java.util.Scanner;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class RegisterTest {
    public static void main(String[] args) {
        var logger = LoggerFactory.getLogger(RegisterTest.class);

        var vertx = Vertx.vertx();
        vertx.deployVerticle(new Persistence(), new DeploymentOptions().setWorker(true));

        Scanner in = new Scanner(System.in);
        while (true) {
            var username = in.nextLine();
            if (username.equals("e")) {
                break;
            }
            var password       = in.nextLine();
            var email          = in.nextLine();
            var ip             = in.nextLine();
            var factionID      = Byte.parseByte(in.nextLine());
            var invitationCode = in.nextLine();

            var json = new JsonObject().put("username", username)
                                       .put("password", password)
                                       .put("email", email)
                                       .put("ip", ip)
                                       .put("factionsId", factionID)
                                       .put("invitationCode", invitationCode);

            logger.info(json);
/*
            vertx.eventBus()
                 .send("persistence.register", json, h -> logger.info(h.result()
                                                                       .body()));*/
        }
    }
}
