package com.kalaazu.cms.mvc.pages.models;

import com.kalaazu.cms.mvc.Model;
import com.kalaazu.cms.mvc.Triad;
import com.kalaazu.cms.mvc.pages.controllers.ExternalController;
import com.kalaazu.cms.mvc.pages.presenters.ExternalPresenter;

/**
 * External page model.
 * ====================
 *
 * Model of the external page.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class ExternalModel extends Model<ExternalModel, ExternalPresenter, ExternalController> {
    /**
     * Constructor.
     *
     * @param triad Parent triad.
     */
    public ExternalModel(
            Triad<ExternalModel, ExternalPresenter, ExternalController> triad
    ) {
        super(triad);
    }
}
