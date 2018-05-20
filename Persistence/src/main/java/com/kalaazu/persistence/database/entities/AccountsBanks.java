package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_banks.generated.GeneratedAccountsBanks;

import java.util.List;

/**
 * Accounts' banks table.
 * ======================
 *
 * Contains the banks of the accounts.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsBanks extends GeneratedAccountsBanks, Entity<Integer> {
    /**
     * Returns the account.
     *
     * @return The account.
     */
    Accounts getAccount();

    /**
     * Returns the transaction logs.
     *
     * @return The logs.
     */
    List<AccountsBanksLogs> getLogs();
}