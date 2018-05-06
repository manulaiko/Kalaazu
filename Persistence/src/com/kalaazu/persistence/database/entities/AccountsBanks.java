package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_banks.generated.GeneratedAccountsBanks;

import java.util.List;

/**
 * The main interface for entities of the {@code accounts_banks}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
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