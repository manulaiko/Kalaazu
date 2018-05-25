package com.kalaazu.persistence.database.entities.accounts_drones;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.AccountsDrones;
import com.kalaazu.persistence.database.entities.Levels;
import com.kalaazu.persistence.database.entities.accounts_drones.generated.GeneratedAccountsDronesImpl;

/**
 * The default implementation of the {@link
 * AccountsDrones}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * TODO idk why this doesn't have a reference to `items` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class AccountsDronesImpl
        extends GeneratedAccountsDronesImpl
        implements AccountsDrones {
    /**
     * The account.
     */
    private Accounts account;

    /**
     * The level.
     */
    private Levels level;

    @Override
    public Accounts getAccount() {
        if (this.account != null) {
            return this.account;
        }

        this.account = super.findAccountsId(
                Database.getInstance()
                        .getDb()
                        .manager(Accounts.class)
        );

        return this.account;
    }

    @Override
    public Levels getLevel() {
        if (this.level != null) {
            return this.level;
        }

        this.level = super.findLevelsId(
                Database.getInstance()
                        .getDb()
                        .manager(Levels.class)
        );

        return this.level;
    }
}