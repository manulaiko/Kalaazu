package com.kalaazu.cms.mvc.pages.controllers;

import com.kalaazu.persistence.eventsystem.events.RegisterEvent;
import com.kalaazu.cms.mvc.Controller;
import com.kalaazu.cms.mvc.Triad;
import com.kalaazu.cms.mvc.pages.models.ExternalModel;
import com.kalaazu.cms.mvc.pages.presenters.ExternalPresenter;
import com.kalaazu.cms.server.Post;
import com.kalaazu.cms.server.Request;
import io.vertx.core.Vertx;
import io.vertx.core.json.JsonObject;
import io.vertx.core.logging.Logger;
import io.vertx.core.logging.LoggerFactory;
import io.vertx.ext.web.RoutingContext;

/**
 * External page controller.
 * =========================
 *
 * Controller of the external page.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class ExternalController extends Controller<ExternalModel, ExternalPresenter, ExternalController> {
    /**
     * Console logger.
     */
    public static final Logger logger = LoggerFactory.getLogger(ExternalController.class);

    /**
     * Constructor.
     *
     * @param triad Parent triad.
     */
    public ExternalController(
            Triad<ExternalModel, ExternalPresenter, ExternalController> triad
    ) {
        super(triad);
    }

    @Override
    @Request
    public String index(RoutingContext request) {
        return super.getTriad()
                    .getPresenter()
                    .render("index");
    }

    /**
     * Performs the login request.
     *
     * @param request HTTP request.
     */
    @Post
    public String login(RoutingContext request) {
        var r      = request.request();
        var result = new ResultResponse(true, "Couldn't perform login!");

        var username = r.getParam("username");
        var password = r.getParam("password");

        if (username.isEmpty() || password.isEmpty()) {
            return super.endError(request, "Username/password can't be empty!");
        }

        request.response()
               .putHeader("Content-Type", "application/json")
               .end(result.toString());

        return null;
    }

    /**
     * Performs the register request.
     *
     * @param request HTTP request.
     */
    @Post
    public String register(RoutingContext request) {
        var r      = request.request();
        var result = new ResultResponse(true, "Couldn't perform register!");

        var username = r.getParam("username");
        var password = r.getParam("password");

        if (username.isEmpty() || password.isEmpty()) {
            return super.endError(request, "Username/password can't be empty!");
        }

        ExternalController.logger.info("Sending event...");
        var event = new JsonObject();
        event.put("username", username);
        event.put("password", password);

        Vertx.currentContext()
             .owner()
             .eventBus()
             .send("persistence.register", event, h -> {
                 ExternalController.logger.info("Response received!");
                 super.end(request, h.result()
                                     .body());
             });

        return null;
    }
}
