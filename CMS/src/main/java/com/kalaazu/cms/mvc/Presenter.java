package com.kalaazu.cms.mvc;

import java.util.Map;

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
public class Presenter<M extends Model, P extends Presenter, C extends Controller> extends Component<M, P, C> {
    /**
     * The view associated to this presenter.
     */
    private View view;

    /**
     * Constructor.
     *
     * @param triad Parent triad.
     */
    public Presenter(Triad<M, P, C> triad) {
        super(triad);
    }

    /**
     * Renders and returns the view.
     *
     * @param view View to render.
     *
     * @return Rendered view.
     */
    public String render(String view) {
        Map<String, Object> variables = super.getTriad()
                                             .getModel()
                                             .getAll();
        variables.putAll(super.getTriad()
                              .getChildren());

        super.getTriad()
             .getParent()
             .ifPresent(p -> variables.put("parent", p));

        return this.getView()
                   .render(view);
    }

    //<editor-fold desc="Getters and Setters">
    public View getView() {
        return view;
    }

    public void setView(View view) {
        this.view = view;
    }
    //</editor-fold>
}
