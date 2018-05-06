package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_banks_logs.generated.GeneratedAccountsBanksLogs;

import java.util.Optional;

/**
 * The main interface for entities of the {@code accounts_banks_logs}-table in
 * the database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsBanksLogs extends GeneratedAccountsBanksLogs, Entity<Integer> {
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

    /**
     * Returns the bank.
     *
     * @return The bank.
     */
    Optional<AccountsBanks> getBank();
}