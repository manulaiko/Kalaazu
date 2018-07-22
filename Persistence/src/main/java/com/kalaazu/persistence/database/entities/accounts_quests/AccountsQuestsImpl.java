package com.kalaazu.persistence.database.entities.accounts_quests;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.AccountsQuests;
import com.kalaazu.persistence.database.entities.Quests;
import com.kalaazu.persistence.database.entities.accounts_quests.generated.GeneratedAccountsQuestsImpl;

/**
 * The default implementation of the {@link
 * AccountsQuests}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class AccountsQuestsImpl
        extends GeneratedAccountsQuestsImpl
        implements AccountsQuests {
    /**
     * The account.
     */
    private Accounts account;

    /**
     * The quest.
     */
    private Quests quest;

    @Override
    public Accounts account() {
        if (this.account != null) {
            return this.account;
        }

        this.account = super.findAccountsId(
                Database.getInstance()
                        .db()
                        .manager(Accounts.class)
        );

        return this.account;
    }

    @Override
    public Quests quest() {
        if (this.quest != null) {
            return this.quest;
        }

        this.quest = super.findQuestsId(
                Database.getInstance()
                        .db()
                        .manager(Quests.class)
        );

        return this.quest;
    }
}