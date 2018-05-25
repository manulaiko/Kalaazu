package com.kalaazu.persistence.database.entities.galaxygates_probabilities;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Galaxygates;
import com.kalaazu.persistence.database.entities.GalaxygatesProbabilities;
import com.kalaazu.persistence.database.entities.galaxygates_probabilities.generated.GeneratedGalaxygatesProbabilitiesImpl;

/**
 * The default implementation of the {@link
 * GalaxygatesProbabilities}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class GalaxygatesProbabilitiesImpl
        extends GeneratedGalaxygatesProbabilitiesImpl
        implements GalaxygatesProbabilities {
    /**
     * The galaxygate.
     */
    private Galaxygates galaxygate;

    @Override
    public Galaxygates getGalaxygate() {
        if (this.galaxygate != null) {
            return this.galaxygate;
        }

        this.galaxygate = super.findGalaxygatesId(
                Database.getInstance()
                        .getDb()
                        .manager(Galaxygates.class)
        );

        return this.galaxygate;
    }
}