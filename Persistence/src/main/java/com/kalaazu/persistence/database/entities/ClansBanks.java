package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.clans_banks.generated.GeneratedClansBanks;

import java.util.List;

/**
 * Clans' banks table.
 * ===================
 *
 * Contains the clans' banks.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface ClansBanks extends GeneratedClansBanks, Entity<Integer> {
    /**
     * Returns the clan.
     *
     * @return The clan.
     */
    Clans clan();

    /**
     * Returns the transaction logs.
     *
     * @return Transaction logs.
     */
    List<ClansBanksLogs> logs();
}