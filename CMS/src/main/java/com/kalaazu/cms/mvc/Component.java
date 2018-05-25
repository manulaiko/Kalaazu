package com.kalaazu.cms.mvc;

/**
 * Component class.
 * ================
 *
 * Base class for all MV(VM)C components.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Component<M extends Model, P extends Presenter, C extends Controller> {
    /**
     * The parent triad.
     */
    private Triad<M, P, C> triad;

    /**
     * Constructor.
     *
     * @param triad Parent triad.
     */
    public Component(Triad<M, P, C> triad) {
        this.triad = triad;
    }

    public Triad<M, P, C> getTriad() {
        return triad;
    }
}
