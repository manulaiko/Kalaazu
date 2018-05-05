package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.npcs.generated.GeneratedNpcs;

import java.util.List;

/**
 * The main interface for entities of the {@code npcs}-table in the database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
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