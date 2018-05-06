package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.clans_ranking.generated.GeneratedClansRanking;

/**
 * The main interface for entities of the {@code clans_ranking}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface ClansRanking extends GeneratedClansRanking, Entity<Integer> {
    /**
     * Returns the clan.
     *
     * @return The clan.
     */
    Clans getClan();
}