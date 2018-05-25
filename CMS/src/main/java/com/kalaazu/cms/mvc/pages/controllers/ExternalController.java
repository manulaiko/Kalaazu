package com.kalaazu.cms.mvc.pages.controllers;

import com.kalaazu.cms.mvc.Controller;
import com.kalaazu.cms.mvc.Triad;
import com.kalaazu.cms.mvc.pages.models.ExternalModel;
import com.kalaazu.cms.mvc.pages.presenters.ExternalPresenter;
import com.kalaazu.cms.server.Post;
import com.kalaazu.cms.server.Request;
import io.vertx.core.http.HttpServerRequest;

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
    public String index(HttpServerRequest request) {
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
    public String login(HttpServerRequest request) {
        var result = new ResultResponse(true, "Couldn't perform login!");

        return result.toString();
    }
}
