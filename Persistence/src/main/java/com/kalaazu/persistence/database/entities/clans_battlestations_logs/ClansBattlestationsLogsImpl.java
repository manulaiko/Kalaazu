package com.kalaazu.persistence.database.entities.clans_battlestations_logs;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Clans;
import com.kalaazu.persistence.database.entities.ClansBattlestations;
import com.kalaazu.persistence.database.entities.ClansBattlestationsLogs;
import com.kalaazu.persistence.database.entities.clans_battlestations_logs.generated.GeneratedClansBattlestationsLogsImpl;

/**
 * The default implementation of the {@link
 * ClansBattlestationsLogs}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class ClansBattlestationsLogsImpl
        extends GeneratedClansBattlestationsLogsImpl
        implements ClansBattlestationsLogs {
    /**
     * The clan.
     */
    private Clans clan;

    /**
     * The battlestation.
     */
    private ClansBattlestations battlestation;

    @Override
    public Clans getClan() {
        if (this.clan != null) {
            return this.clan;
        }

        this.clan = super.findClansId(
                Database.getInstance()
                        .getDb()
                        .manager(Clans.class)
        );

        return this.clan;
    }

    @Override
    public ClansBattlestations getBattlestation() {
        if (this.battlestation != null) {
            return this.battlestation;
        }

        this.battlestation = super.findClansBattlestationsId(
                Database.getInstance()
                        .getDb()
                        .manager(ClansBattlestations.class)
        );

        return this.battlestation;
    }
}