package com.kalaazu.persistence.database.entities.clans_battlestations;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Clans;
import com.kalaazu.persistence.database.entities.ClansBattlestations;
import com.kalaazu.persistence.database.entities.ClansBattlestationsLogs;
import com.kalaazu.persistence.database.entities.Maps;
import com.kalaazu.persistence.database.entities.clans_battlestations.generated.GeneratedClansBattlestationsImpl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * The default implementation of the {@link
 * ClansBattlestations}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class ClansBattlestationsImpl
        extends GeneratedClansBattlestationsImpl
        implements ClansBattlestations {
    /**
     * The clan.
     */
    private Optional<Clans> clan;

    /**
     * The map.
     */
    private Maps map;

    /**
     * Logs.
     */
    private List<ClansBattlestationsLogs> logs;

    @Override
    public Optional<Clans> clan() {
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
    public Maps map() {
        if (this.map != null) {
            return this.map;
        }

        this.map = super.findMapsId(
                Database.getInstance()
                        .db()
                        .manager(Maps.class)
        );

        return this.map;
    }

    @Override
    public List<ClansBattlestationsLogs> logs() {
        if (this.logs != null) {
            return this.logs;
        }

        this.logs = Database.getInstance()
                            .all(ClansBattlestationsLogs.class)
                            .filter(ClansBattlestationsLogs.CLANS_BATTLESTATIONS_ID.equal(super.getId()))
                            .collect(Collectors.toList());

        return this.logs;
    }
}