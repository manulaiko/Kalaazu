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
    public Optional<Clans> getClan() {
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
    public Maps getMap() {
        if (this.map != null) {
            return this.map;
        }

        this.map = super.findMapsId(
                Database.getInstance()
                        .getDb()
                        .manager(Maps.class)
        );

        return this.map;
    }

    @Override
    public List<ClansBattlestationsLogs> getLogs() {
        if (this.logs != null) {
            return this.logs;
        }

        this.logs = Database.getInstance()
                            .all(ClansBattlestationsLogs.class)
                            .filter(l -> l.getClansBattlestationsId() == super.getId())
                            .collect(Collectors.toList());

        return this.logs;
    }
}