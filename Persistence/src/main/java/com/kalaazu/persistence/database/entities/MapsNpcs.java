package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.maps_npcs.generated.GeneratedMapsNpcs;

/**
 * Maps' npcs table.
 * =================
 *
 * Contains the npcs that are spawned in each map.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface MapsNpcs extends GeneratedMapsNpcs, Entity<Byte> {
    /**
     * Returns the map.
     *
     * @return The map.
     */
    Maps map();

    /**
     * Returns the NPC type.
     *
     * @return The NPC.
     */
    Npcs npc();
}