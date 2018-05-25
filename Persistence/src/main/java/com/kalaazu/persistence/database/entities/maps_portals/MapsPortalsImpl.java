package com.kalaazu.persistence.database.entities.maps_portals;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Levels;
import com.kalaazu.persistence.database.entities.Maps;
import com.kalaazu.persistence.database.entities.MapsPortals;
import com.kalaazu.persistence.database.entities.maps_portals.generated.GeneratedMapsPortalsImpl;

/**
 * The default implementation of the {@link
 * MapsPortals}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class MapsPortalsImpl
        extends GeneratedMapsPortalsImpl
        implements MapsPortals {
    /**
     * Required level.
     */
    private Levels level;

    /**
     * Current map.
     */
    private Maps map;

    /**
     * Target map.
     */
    private Maps targetMap;

    @Override
    public Levels getLevel() {
        if (this.level != null) {
            return this.level;
        }

        this.level = Database.getInstance()
                             .find(super.getLevelsId(), Levels.class)
                             .orElse(null);

        return this.level;
    }

    @Override
    public Maps getMap() {
        if (this.map != null) {
            return this.map;
        }

        this.map = super.findMapsId(
                Database.getInstance()
                        .getDb()
                        .manager(Maps.class)
        );

        return this.map;
    }

    @Override
    public Maps getTargetMap() {
        if (this.targetMap != null) {
            return this.targetMap;
        }

        this.targetMap = super.findTargetMapsId(
                Database.getInstance()
                        .getDb()
                        .manager(Maps.class)
        );

        return this.targetMap;
    }
}