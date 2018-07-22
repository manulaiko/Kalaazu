package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.galaxygates_probabilities.generated.GeneratedGalaxygatesProbabilities;

/**
 * Galaxygates' probabilities table.
 * =================================
 *
 * Contains the probabilities for each spin.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface GalaxygatesProbabilities extends GeneratedGalaxygatesProbabilities, Entity<Byte> {
    /**
     * Returns the galaxygate.
     *
     * @return The galaxygate.
     */
    Galaxygates galaxygate();
}