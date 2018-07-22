package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.maps.generated.GeneratedMaps;

import java.util.List;
import java.util.Optional;

/**
 * Maps table.
 * ===========
 *
 * Contains the maps of the server.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Maps extends GeneratedMaps, Entity<Byte> {
    /**
     * Returns the owner of the map.
     *
     * @return Map faction.
     */
    Optional<Factions> getFaction();

    /**
     * Returns the npcs on map.
     *
     * @return Npcs.
     */
    List<MapsNpcs> npcs();

    /**
     * Returns the portals on map.
     *
     * @return Portals.
     */
    List<MapsPortals> portals();

    /**
     * Returns the stations on map.
     *
     * @return Stations.
     */
    List<MapsStations> stations();
}