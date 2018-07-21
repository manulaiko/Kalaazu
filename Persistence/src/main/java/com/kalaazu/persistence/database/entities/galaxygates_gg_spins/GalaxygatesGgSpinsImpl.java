package com.kalaazu.persistence.database.entities.galaxygates_gg_spins;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Galaxygates;
import com.kalaazu.persistence.database.entities.GalaxygatesGgSpins;
import com.kalaazu.persistence.database.entities.GalaxygatesSpins;
import com.kalaazu.persistence.database.entities.galaxygates_gg_spins.generated.GeneratedGalaxygatesGgSpinsImpl;

/**
 * The default implementation of the {@link
 * GalaxygatesGgSpins}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class GalaxygatesGgSpinsImpl
        extends GeneratedGalaxygatesGgSpinsImpl
        implements GalaxygatesGgSpins {
    /**
     * The galaxygate.
     */
    private Galaxygates galaxygate;

    /**
     * The spin.
     */
    private GalaxygatesSpins spin;

    @Override
    public Galaxygates getGalaxygate() {
        if (this.galaxygate != null) {
            return this.galaxygate;
        }

        this.galaxygate = this.findGalaxygatesId(
                Database.getInstance()
                        .db()
                        .manager(Galaxygates.class)
        );

        return this.galaxygate;
    }

    @Override
    public GalaxygatesSpins getSpin() {
        if (this.spin != null) {
            return this.spin;
        }

        this.spin = super.findGalaxygatesSpinsId(
                Database.getInstance()
                        .db()
                        .manager(GalaxygatesSpins.class)
        );

        return this.spin;
    }
}