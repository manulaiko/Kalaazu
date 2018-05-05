package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.maps_npcs.generated.GeneratedMapsNpcs;

/**
 * The main interface for entities of the {@code maps_npcs}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface MapsNpcs extends GeneratedMapsNpcs, Entity<Byte> {
    /**
     * Returns the map.
     *
     * @return The map.
     */
    Maps getMap();

    /**
     * Returns the NPC type.
     *
     * @return The NPC.
     */
    Npcs getNpc();
}