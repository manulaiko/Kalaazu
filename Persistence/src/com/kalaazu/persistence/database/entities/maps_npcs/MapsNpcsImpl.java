package com.kalaazu.persistence.database.entities.maps_npcs;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Maps;
import com.kalaazu.persistence.database.entities.MapsNpcs;
import com.kalaazu.persistence.database.entities.Npcs;
import com.kalaazu.persistence.database.entities.maps_npcs.generated.GeneratedMapsNpcsImpl;

/**
 * The default implementation of the {@link
 * MapsNpcs}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class MapsNpcsImpl
        extends GeneratedMapsNpcsImpl
        implements MapsNpcs {
    /**
     * The map.
     */
    private Maps map;

    /**
     * The npc.
     */
    private Npcs npc;

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
    public Npcs getNpc() {
        if (this.npc != null) {
            return this.npc;
        }

        this.npc = super.findNpcsId(
                Database.getInstance()
                        .getDb()
                        .manager(Npcs.class)
        );

        return this.npc;
    }
}