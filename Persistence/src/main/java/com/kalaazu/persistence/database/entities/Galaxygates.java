package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.galaxygates.generated.GeneratedGalaxygates;

import java.util.List;
import java.util.Optional;

/**
 * Galaxygates table.
 * ==================
 *
 * Contains the different galaxygates.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Galaxygates extends GeneratedGalaxygates, Entity<Byte> {
    /**
     * Returns the starting wave.
     *
     * @return Starting wave.
     */
    Optional<GalaxygatesWaves> wave();

    /**
     * Returns the waves.
     *
     * @return The waves.
     */
    List<GalaxygatesWaves> waves();

    /**
     * Returns the spins.
     *
     * @return The spins.
     */
    List<GalaxygatesSpins> spins();

    /**
     * Returns the spin probabilities.
     *
     * @return Spin probabilities.
     */
    List<GalaxygatesProbabilities> probabilities();
}