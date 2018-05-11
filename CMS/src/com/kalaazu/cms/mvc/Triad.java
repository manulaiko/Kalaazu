package com.kalaazu.cms.mvc;

import java.util.*;

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
     *
     * @param parent Parent triad.
     */
    public Triad(Triad parent) {
        this.parent = Optional.of(parent);
    }

    /**
     * Constructor.
     */
    public Triad() {
        this.parent = Optional.empty();
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
}
