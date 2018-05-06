package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.clans_battlestations_logs.generated.GeneratedClansBattlestationsLogs;

/**
 * Clans' battlestation logs table.
 * ================================
 *
 * Contains the logs produced by a battlestation.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface ClansBattlestationsLogs extends GeneratedClansBattlestationsLogs, Entity<Integer> {
    /**
     * Returns the clan.
     *
     * @return The clan.
     */
    Clans getClan();

    /**
     * Returns the battlestation.
     *
     * @return The battlestation.
     */
    ClansBattlestations getBattlestation();
}