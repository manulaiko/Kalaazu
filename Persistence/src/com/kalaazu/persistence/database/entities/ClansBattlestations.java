package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.clans_battlestations.generated.GeneratedClansBattlestations;

import java.util.List;
import java.util.Optional;

/**
 * Clans' battlestations table.
 * ============================
 *
 * Contains the battlestations.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface ClansBattlestations extends GeneratedClansBattlestations, Entity<Byte> {
    /**
     * Returns the owner of the cbs.
     *
     * @return The clan.
     */
    Optional<Clans> getClan();

    /**
     * Returns the map.
     *
     * @return The map.
     */
    Maps getMap();

    /**
     * Returns the logs for this cbs.
     *
     * @return The logs.
     */
    List<ClansBattlestationsLogs> getLogs();
}