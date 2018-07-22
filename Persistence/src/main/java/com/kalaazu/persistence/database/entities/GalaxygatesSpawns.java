package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.galaxygates_spawns.generated.GeneratedGalaxygatesSpawns;

/**
 * Galaxygates' spawns table.
 * ==========================
 *
 * Contains all npc spawns for each stage.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface GalaxygatesSpawns extends GeneratedGalaxygatesSpawns, Entity<Integer> {
    /**
     * Returns the npc.
     *
     * @return The npc.
     */
    Npcs npc();
}