package com.kalaazu.cms.mvc;

/**
 * Component class.
 * ================
 *
 * Base class for all MV(VM)C components.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Component {
    /**
     * The parent triad.
     */
    private Triad triad;

    /**
     * Constructor.
     *
     * @param triad Parent triad.
     */
    public Component(Triad triad) {
        this.triad = triad;
    }

    public Triad getTriad() {
        return triad;
    }
}
