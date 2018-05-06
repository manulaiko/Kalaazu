package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.clans_banks_logs.generated.GeneratedClansBanksLogs;

/**
 * The main interface for entities of the {@code clans_banks_logs}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
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