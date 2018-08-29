package com.kalaazu.persistence.database.entities.clans_banks;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Clans;
import com.kalaazu.persistence.database.entities.ClansBanks;
import com.kalaazu.persistence.database.entities.ClansBanksLogs;
import com.kalaazu.persistence.database.entities.clans_banks.generated.GeneratedClansBanksImpl;

import java.util.List;
import java.util.stream.Collectors;

/**
 * The default implementation of the {@link
 * ClansBanks}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class ClansBanksImpl
        extends GeneratedClansBanksImpl
        implements ClansBanks {
    /**
     * The clan.
     */
    private Clans clan;

    /**
     * The logs.
     */
    private List<ClansBanksLogs> logs;

    @Override
    public Clans clan() {
        if (this.clan != null) {
            return this.clan;
        }

        this.clan = super.findClansId(
                Database.instance()
                        .db()
                        .manager(Clans.class)
        );

        return this.clan;
    }

    @Override
    public List<ClansBanksLogs> logs() {
        if (this.logs != null) {
            return this.logs;
        }

        this.logs = Database.instance()
                            .all(ClansBanksLogs.class)
                            .filter(ClansBanksLogs.CLANS_BANKS_ID.equal(super.id()))
                            .collect(Collectors.toList());

        return this.logs;
    }
}