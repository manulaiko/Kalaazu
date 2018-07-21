package com.kalaazu.persistence.database.entities.clans_messages;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.Clans;
import com.kalaazu.persistence.database.entities.ClansMessages;
import com.kalaazu.persistence.database.entities.clans_messages.generated.GeneratedClansMessagesImpl;

import java.util.Optional;

/**
 * The default implementation of the {@link
 * ClansMessages}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class ClansMessagesImpl
        extends GeneratedClansMessagesImpl
        implements ClansMessages {
    /**
     * The clan.
     */
    private Clans clan;

    /**
     * The author.
     */
    private Accounts author;

    /**
     * The destination.
     */
    private Optional<Accounts> destination;

    @Override
    public Clans getClan() {
        if (this.clan != null) {
            return this.clan;
        }

        this.clan = super.findClansId(
                Database.getInstance()
                        .db()
                        .manager(Clans.class)
        );

        return this.clan;
    }

    @Override
    public Accounts getAuthor() {
        if (this.author != null) {
            return this.author;
        }

        this.author = super.findFromAccountsId(
                Database.getInstance()
                        .db()
                        .manager(Accounts.class)
        );

        return this.author;
    }

    @Override
    public Optional<Accounts> getDestination() {
        if (this.destination != null) {
            return this.destination;
        }

        this.destination = super.findToAccountsId(
                Database.getInstance()
                        .db()
                        .manager(Accounts.class)
        );

        return this.destination;
    }
}