package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.clans_banks_logs.generated.GeneratedClansBanksLogs;

/**
 * Clans' bank logs table.
 * =======================
 *
 * Contains the transaction logs for each clan bank.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface ClansBanksLogs extends GeneratedClansBanksLogs, Entity<Integer> {
    /**
     * Returns the bank.
     *
     * @return The bank.
     */
    ClansBanks getBank();

    /**
     * Returns the author.
     *
     * @return The author.
     */
    Accounts getAuthor();

    /**
     * Returns the destination account.
     *
     * @return Destination account.
     */
    Accounts getDestination();
}