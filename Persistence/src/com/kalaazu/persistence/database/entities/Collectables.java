package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.collectables.generated.GeneratedCollectables;

import java.util.List;

/**
 * The main interface for entities of the {@code collectables}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Collectables extends GeneratedCollectables, Entity<Byte> {
    /**
     * Returns the rewards of this collectable.
     *
     * @return Collectable rewards.
     */
    List<Rewards> getRewards();
}