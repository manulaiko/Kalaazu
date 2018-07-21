package com.kalaazu.persistence.database.entities.galaxygates_stages;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.GalaxygatesSpawns;
import com.kalaazu.persistence.database.entities.GalaxygatesStages;
import com.kalaazu.persistence.database.entities.GalaxygatesStagesSpawns;
import com.kalaazu.persistence.database.entities.GalaxygatesWaves;
import com.kalaazu.persistence.database.entities.galaxygates_stages.generated.GeneratedGalaxygatesStagesImpl;

import java.util.List;
import java.util.stream.Collectors;

/**
 * The default implementation of the {@link
 * GalaxygatesStages}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class GalaxygatesStagesImpl
        extends GeneratedGalaxygatesStagesImpl
        implements GalaxygatesStages {
    /**
     * The wave.
     */
    private GalaxygatesWaves wave;

    /**
     * The spawns.
     */
    private List<GalaxygatesSpawns> spawns;

    @Override
    public GalaxygatesWaves getWave() {
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
    public List<GalaxygatesSpawns> getSpawns() {
        if (this.spawns != null) {
            return this.spawns;
        }

        this.spawns = Database.getInstance()
                              .all(GalaxygatesStagesSpawns.class)
                              .filter(GalaxygatesStagesSpawns.GALAXYGATES_STAGES_ID.equal(super.getId()))
                              .map(GalaxygatesStagesSpawns::getSpawn)
                              .collect(Collectors.toList());

        return this.spawns;
    }
}