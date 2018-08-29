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
    public Levels level() {
        if (this.level != null) {
            return this.level;
        }

        this.level = Database.instance()
                             .find(super.levelsId(), Levels.class)
                             .orElse(null);

        return this.level;
    }

    @Override
    public Maps map() {
        if (this.map != null) {
            return this.map;
        }

        this.map = super.findMapsId(
                Database.instance()
                        .db()
                        .manager(Maps.class)
        );

        return this.map;
    }

    @Override
    public Maps targetMap() {
        if (this.targetMap != null) {
            return this.targetMap;
        }

        this.targetMap = super.findTargetMapsId(
                Database.instance()
                        .db()
                        .manager(Maps.class)
        );

        return this.targetMap;
    }
}