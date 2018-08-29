package com.kalaazu.persistence.database.entities.galaxygates_gg_waves;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Galaxygates;
import com.kalaazu.persistence.database.entities.GalaxygatesGgWaves;
import com.kalaazu.persistence.database.entities.GalaxygatesWaves;
import com.kalaazu.persistence.database.entities.galaxygates_gg_waves.generated.GeneratedGalaxygatesGgWavesImpl;

/**
 * The default implementation of the {@link
 * GalaxygatesGgWaves}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class GalaxygatesGgWavesImpl
        extends GeneratedGalaxygatesGgWavesImpl
        implements GalaxygatesGgWaves {
    /**
     * The galaxygate.
     */
    private Galaxygates galaxygate;

    /**
     * The wave.
     */
    private GalaxygatesWaves wave;

    @Override
    public Galaxygates galaxygate() {
        if (this.galaxygate != null) {
            return this.galaxygate;
        }

        this.galaxygate = super.findGalaxygatesId(
                Database.instance()
                        .db()
                        .manager(Galaxygates.class)
        );

        return this.galaxygate;
    }

    @Override
    public GalaxygatesWaves wave() {
        if (this.wave != null) {
            return this.wave;
        }

        this.wave = super.findGalaxygatesWavesId(
                Database.instance()
                        .db()
                        .manager(GalaxygatesWaves.class)
        );

        return this.wave;
    }
}