package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.npcs.generated.GeneratedNpcs;

import java.util.List;

/**
 * Npcs table.
 * ===========
 *
 * Contains all the npcs of the server.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Npcs extends GeneratedNpcs, Entity<Byte> {
    /**
     * Returns the rewards.
     *
     * @return The rewards.
     */
    List<Rewards> getRewards();
}