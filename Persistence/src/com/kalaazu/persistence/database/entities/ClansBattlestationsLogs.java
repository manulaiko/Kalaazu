package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.clans_battlestations_logs.generated.GeneratedClansBattlestationsLogs;

/**
 * The main interface for entities of the {@code
 * clans_battlestations_logs}-table in the database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
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