package com.kalaazu.persistence.database.entities.accounts_pets;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.AccountsPets;
import com.kalaazu.persistence.database.entities.Levels;
import com.kalaazu.persistence.database.entities.accounts_pets.generated.GeneratedAccountsPetsImpl;

/**
 * The default implementation of the {@link
 * AccountsPets}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class AccountsPetsImpl
        extends GeneratedAccountsPetsImpl
        implements AccountsPets {
    /**
     * The account.
     */
    private Accounts account;

    /**
     * The level.
     */
    private Levels level;

    @Override
    public Accounts account() {
        if (this.account != null) {
            return this.account;
        }

        this.account = super.findAccountsId(
                Database.instance()
                        .db()
                        .manager(Accounts.class)
        );

        return this.account;
    }

    @Override
    public Levels level() {
        if (this.level != null) {
            return this.level;
        }

        this.level = super.findLevelsId(
                Database.instance()
                        .db()
                        .manager(Levels.class)
        );

        return this.level;
    }
}