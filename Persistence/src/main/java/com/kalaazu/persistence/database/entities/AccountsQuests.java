package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_quests.generated.GeneratedAccountsQuests;

/**
 * Accounts' quests table.
 * =======================
 *
 * Contains the quests of an account.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsQuests extends GeneratedAccountsQuests, Entity<Integer> {
    /**
     * Returns the account.
     *
     * @return The account.
     */
    Accounts getAccount();

    /**
     * Returns the quest.
     *
     * @return The quest.
     */
    Quests getQuest();
}