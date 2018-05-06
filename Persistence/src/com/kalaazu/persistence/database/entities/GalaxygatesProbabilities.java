package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.galaxygates_probabilities.generated.GeneratedGalaxygatesProbabilities;

/**
 * The main interface for entities of the {@code
 * galaxygates_probabilities}-table in the database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface GalaxygatesProbabilities extends GeneratedGalaxygatesProbabilities, Entity<Byte> {
    /**
     * Returns the galaxygate.
     *
     * @return The galaxygate.
     */
    Galaxygates getGalaxygate();
}