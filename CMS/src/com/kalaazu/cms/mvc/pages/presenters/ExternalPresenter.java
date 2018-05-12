package com.kalaazu.cms.mvc.pages.presenters;

import com.kalaazu.cms.mvc.Presenter;
import com.kalaazu.cms.mvc.Triad;
import com.kalaazu.cms.mvc.pages.controllers.ExternalController;
import com.kalaazu.cms.mvc.pages.models.ExternalModel;

/**
 * External page presenter.
 * ========================
 *
 * Presenter of the external page.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class ExternalPresenter extends Presenter<ExternalModel, ExternalPresenter, ExternalController> {
    /**
     * Constructor.
     *
     * @param triad Parent triad.
     */
    public ExternalPresenter(
            Triad<ExternalModel, ExternalPresenter, ExternalController> triad
    ) {
        super(triad);
    }

    @Override
    public String render(String view) {
        return super.render("External/" + view);
    }
}
