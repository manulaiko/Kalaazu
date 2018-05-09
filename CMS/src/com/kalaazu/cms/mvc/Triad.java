package com.kalaazu.cms.mvc;

import java.util.ArrayList;
import java.util.List;
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
    private List<Triad> children = new ArrayList<>();

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
}
