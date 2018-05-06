package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_banks_logs.generated.GeneratedAccountsBanksLogs;

import java.util.Optional;

/**
 * Accounts' bank logs table.
 * ==========================
 *
 * Contains the transaction logs of the account banks.
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