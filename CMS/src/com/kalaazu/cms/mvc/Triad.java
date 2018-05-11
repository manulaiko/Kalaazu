package com.kalaazu.cms.mvc;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

/**
 * Triad class.
 * ============
 *
 * Main component of the HMV(VM)C pattern.
 * It links the MV(VM)C components and implements a hierarchical tree.
 *
 * Each triad is associated with an endpoint which will be used
 * to handle the incoming requests.
 *
 * The triad will check if the request matches any of their child
 * triads endpoints, if it does, it will delegate the request to it.
 * If not it will check if the controller can handle the request
 * or call its `index` method.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public abstract class Triad<M extends Model, P extends Presenter, C extends Controller> {
    /**
     * Parent triad.
     */
    private Optional<Triad> parent;

    /**
     * Children triads.
     */
    private Map<String, Triad> children = new HashMap<>();

    /**
     * The model.
     */
    private M model;

    /**
     * The presenter.
     */
    private P presenter;

    /**
     * The controller.
     */
    private C controller;

    /**
     * Constructor.
     */
    public Triad() {
        this(null, null, null, null);
    }

    /**
     * Constructor.
     *
     * @param parent Parent triad.
     */
    public Triad(Triad parent) {
        this(parent, null, null, null);
    }

    /**
     * Constructor.
     *
     * @param model Model instance.
     * @param presenter Presenter instance.
     * @param controller Controller instance.
     */
    public Triad(M model, P presenter, C controller) {
        this(null, model, presenter, controller);
    }

    /**
     * Constructor.
     *
     * @param parent Parent triad.
     * @param model  Model instance.
     * @param presenter Presenter instance.
     * @param controller Controller instance.
     */
    public Triad(Triad parent, M model, P presenter, C controller) {
        this.setParent(parent);
        this.initialize(model, presenter, controller);
    }

    /**
     * Initializes the triad.
     *
     * @param model      The model instance.
     * @param presenter  The presenter instance.
     * @param controller The controller instance.
     */
    public void initialize(M model, P presenter, C controller) {
        if (model == null || presenter == null || controller == null) {
            return;
        }

        this.setModel(model);
        this.setPresenter(presenter);
        this.setController(controller);
    }

    /**
     * Returns the endpoint associated to this triad.
     *
     * @return URL endpoint.
     */
    public abstract String getEndpoint();

    /**
     * Adds a child triad.
     *
     * @param name  Child name.
     * @param triad The triad.
     */
    public void addChildren(String name, Triad triad) {
        triad.setParent(this);

        this.children.put(name, triad);
    }

    /**
     * Sets the parent triad.
     *
     * @param parent Parent triad.
     */
    private void setParent(Triad parent) {
        if (parent == null) {
            this.parent = Optional.empty();

            return;
        }

        this.parent = Optional.of(parent);
    }

    /**
     * Returns the full endpoint containing parent's.
     *
     * @return The full endpoint path.
     */
    public String getFullEndpoint() {
        var endpoint = new StringBuilder();

        this.parent.ifPresent(p -> {
            var e = p.getFullEndpoint();
            endpoint.append(e, 0, e.length() - 1);
        });

        var e = this.getEndpoint();
        if (!e.startsWith("/")) {
            endpoint.append("/");
        }

        return endpoint.append(e)
                       .toString();
    }

    //<editor-fold desc="Getters and Setters">
    public M getModel() {
        return model;
    }

    public void setModel(M model) {
        this.model = model;
    }

    public P getPresenter() {
        return presenter;
    }

    public void setPresenter(P presenter) {
        this.presenter = presenter;
    }

    public C getController() {
        return controller;
    }

    public void setController(C controller) {
        this.controller = controller;
    }

    public Triad getChild(String name) {
        return this.children.getOrDefault(name, null);
    }
    //</editor-fold>
}
