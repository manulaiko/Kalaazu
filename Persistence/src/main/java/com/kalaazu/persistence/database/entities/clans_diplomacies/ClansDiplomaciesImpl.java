package com.kalaazu.persistence.database.entities.clans_diplomacies;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Clans;
import com.kalaazu.persistence.database.entities.ClansDiplomacies;
import com.kalaazu.persistence.database.entities.clans_diplomacies.generated.GeneratedClansDiplomaciesImpl;

/**
 * The default implementation of the {@link
 * ClansDiplomacies}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class ClansDiplomaciesImpl
        extends GeneratedClansDiplomaciesImpl
        implements ClansDiplomacies {
    /**
     * The author.
     */
    private Clans author;

    /**
     * The destination.
     */
    private Clans destination;

    @Override
    public Clans getAuthor() {
        if (this.author != null) {
            return this.author;
        }

        this.author = super.findFromClansId(
                Database.getInstance()
                        .getDb()
                        .manager(Clans.class)
        );

        return this.author;
    }

    @Override
    public Clans getDestination() {
        if (this.destination != null) {
            return this.destination;
        }

        this.destination = super.findToClansId(
                Database.getInstance()
                        .getDb()
                        .manager(Clans.class)
        );

        return this.destination;
    }
}