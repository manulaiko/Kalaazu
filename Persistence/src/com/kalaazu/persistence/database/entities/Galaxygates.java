package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.galaxygates.generated.GeneratedGalaxygates;

import java.util.List;
import java.util.Optional;

/**
 * The main interface for entities of the {@code galaxygates}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Galaxygates extends GeneratedGalaxygates, Entity<Byte> {
    /**
     * Returns the starting wave.
     *
     * @return Starting wave.
     */
    Optional<GalaxygatesWaves> getWave();

    /**
     * Returns the waves.
     *
     * @return The waves.
     */
    List<GalaxygatesWaves> getWaves();

    /**
     * Returns the spins.
     *
     * @return The spins.
     */
    List<GalaxygatesSpins> getSpins();

    /**
     * Returns the spin probabilities.
     *
     * @return Spin probabilities.
     */
    List<GalaxygatesProbabilities> getProbabilities();
}