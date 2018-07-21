package com.kalaazu.persistence.database.entities.galaxygates;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.*;
import com.kalaazu.persistence.database.entities.galaxygates.generated.GeneratedGalaxygatesImpl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * The default implementation of the {@link
 * Galaxygates}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class GalaxygatesImpl
        extends GeneratedGalaxygatesImpl
        implements Galaxygates {
    /**
     * The starting wave.
     */
    private Optional<GalaxygatesWaves> wave;

    /**
     * The waves.
     */
    private List<GalaxygatesWaves> waves;

    /**
     * The spins.
     */
    private List<GalaxygatesSpins> spins;

    /**
     * The probabilities.
     */
    private List<GalaxygatesProbabilities> probabilities;

    @Override
    public Optional<GalaxygatesWaves> getWave() {
        if (this.wave != null) {
            return this.wave;
        }

        this.wave = super.findGalaxygatesWavesId(
                Database.getInstance()
                        .db()
                        .manager(GalaxygatesWaves.class)
        );

        return this.wave;
    }

    @Override
    public List<GalaxygatesWaves> getWaves() {
        if (this.waves != null) {
            return this.waves;
        }

        this.waves = Database.getInstance()
                             .all(GalaxygatesGgWaves.class)
                             .filter(GalaxygatesGgWaves.GALAXYGATES_ID.equal(super.getId()))
                             .map(GalaxygatesGgWaves::getWave)
                             .collect(Collectors.toList());

        return this.waves;
    }

    @Override
    public List<GalaxygatesSpins> getSpins() {
        if (this.spins != null) {
            return this.spins;
        }

        this.spins = Database.getInstance()
                             .all(GalaxygatesGgSpins.class)
                             .filter(GalaxygatesGgSpins.GALAXYGATES_ID.equal(super.getId()))
                             .map(GalaxygatesGgSpins::getSpin)
                             .collect(Collectors.toList());

        return this.spins;
    }

    @Override
    public List<GalaxygatesProbabilities> getProbabilities() {
        if (this.probabilities != null) {
            return this.probabilities;
        }

        this.probabilities = Database.getInstance()
                                     .all(GalaxygatesProbabilities.class)
                                     .filter(GalaxygatesProbabilities.GALAXYGATES_ID.equal(super.getId()))
                                     .collect(Collectors.toList());

        return this.probabilities;
    }
}