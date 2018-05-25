package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.clans_ranking.generated.GeneratedClansRanking;

/**
 * Clans' ranking table.
 * =====================
 *
 * Contains the ranking system of each clan.
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