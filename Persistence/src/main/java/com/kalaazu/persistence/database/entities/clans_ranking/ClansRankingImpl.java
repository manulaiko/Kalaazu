package com.kalaazu.persistence.database.entities.clans_ranking;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Clans;
import com.kalaazu.persistence.database.entities.ClansRanking;
import com.kalaazu.persistence.database.entities.clans_ranking.generated.GeneratedClansRankingImpl;

/**
 * The default implementation of the {@link
 * ClansRanking}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class ClansRankingImpl
        extends GeneratedClansRankingImpl
        implements ClansRanking {
    /**
     * The clan.
     */
    private Clans clan;

    @Override
    public Clans clan() {
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
}