package com.kalaazu.cms.mvc;

/**
 * Presenter component.
 * ====================
 *
 * Represents the VM in MV(VM)C.
 *
 * It parses the model data and renders the view.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Presenter extends Component {
    /**
     * Constructor.
     *
     * @param triad Parent triad.
     */
    public Presenter(Triad triad) {
        super(triad);
    }
}
