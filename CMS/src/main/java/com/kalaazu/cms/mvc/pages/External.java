package com.kalaazu.cms.mvc.pages;

import com.kalaazu.cms.mvc.Triad;
import com.kalaazu.cms.mvc.pages.controllers.ExternalController;
import com.kalaazu.cms.mvc.pages.models.ExternalModel;
import com.kalaazu.cms.mvc.pages.presenters.ExternalPresenter;

/**
 * External page.
 * ==============
 *
 * Represents the external page.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class External extends Triad<ExternalModel, ExternalPresenter, ExternalController> {
    @Override
    public void initialize(
            ExternalModel model, ExternalPresenter presenter, ExternalController controller
    ) {
        super.initialize(
                new ExternalModel(this),
                new ExternalPresenter(this),
                new ExternalController(this)
        );
    }

    /**
     * Returns the endpoint associated to this triad.
     *
     * @return URL endpoint.
     */
    @Override
    public String getEndpoint() {
        return "/External";
    }
}
