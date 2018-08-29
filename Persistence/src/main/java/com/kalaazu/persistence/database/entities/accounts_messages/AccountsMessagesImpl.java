package com.kalaazu.persistence.database.entities.accounts_messages;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.AccountsMessages;
import com.kalaazu.persistence.database.entities.accounts_messages.generated.GeneratedAccountsMessagesImpl;

/**
 * The default implementation of the {@link
 * AccountsMessages}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class AccountsMessagesImpl
        extends GeneratedAccountsMessagesImpl
        implements AccountsMessages {
    /**
     * The author.
     */
    private Accounts author;

    /**
     * The destination.
     */
    private Accounts destination;

    @Override
    public Accounts from() {
        if (this.author != null) {
            return this.author;
        }

        this.author = super.findFromAccountsId(
                Database.instance()
                        .db()
                        .manager(Accounts.class)
        );

        return this.author;
    }

    @Override
    public Accounts to() {
        if (this.destination != null) {
            return this.destination;
        }

        this.destination = super.findToAccountsId(
                Database.instance()
                        .db()
                        .manager(Accounts.class)
        );

        return this.destination;
    }
}