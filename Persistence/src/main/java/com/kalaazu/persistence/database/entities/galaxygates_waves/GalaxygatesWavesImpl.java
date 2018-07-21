package com.kalaazu.persistence.database.entities.galaxygates_waves;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.GalaxygatesStages;
import com.kalaazu.persistence.database.entities.GalaxygatesWaves;
import com.kalaazu.persistence.database.entities.Maps;
import com.kalaazu.persistence.database.entities.galaxygates_waves.generated.GeneratedGalaxygatesWavesImpl;

import java.util.List;
import java.util.stream.Collectors;

/**
 * The default implementation of the {@link
 * GalaxygatesWaves}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class GalaxygatesWavesImpl
        extends GeneratedGalaxygatesWavesImpl
        implements GalaxygatesWaves {
    /**
     * The map.
     */
    private Maps map;

    /**
     * Wave's stages.
     */
    private List<GalaxygatesStages> stages;

    @Override
    public Maps getMap() {
        if (this.map != null) {
            return this.map;
        }

        this.map = super.findMapsId(
                Database.getInstance()
                        .db()
                        .manager(Maps.class)
        );

        return this.map;
    }

    @Override
    public List<GalaxygatesStages> getStages() {
        if (this.stages != null) {
            return this.stages;
        }

        this.stages = Database.getInstance()
                              .all(GalaxygatesStages.class)
                              .filter(GalaxygatesStages.GALAXYGATES_WAVES_ID.equal(super.getId()))
                              .collect(Collectors.toList());

        return this.stages;
    }
}