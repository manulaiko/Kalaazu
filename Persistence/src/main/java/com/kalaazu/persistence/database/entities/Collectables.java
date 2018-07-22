package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.collectables.generated.GeneratedCollectables;

import java.util.List;

/**
 * Collectables table.
 * ===================
 *
 * Contains all the collectables in the server.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Collectables extends GeneratedCollectables, Entity<Byte> {
    /**
     * Returns the rewards of this collectable.
     *
     * @return Collectable rewards.
     */
    List<Rewards> rewards();
}