package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.ranks.generated.GeneratedRanks;

/**
 * Ranks table.
 * ============
 *
 * Contains the ranks an account can reach.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Ranks extends GeneratedRanks, Entity<Byte> {
}