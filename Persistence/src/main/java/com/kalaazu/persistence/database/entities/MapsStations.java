package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.maps_stations.generated.GeneratedMapsStations;

import java.util.Optional;

/**
 * Maps' stations table.
 * =====================
 *
 * Contains the stations that are placed in a map.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface MapsStations extends GeneratedMapsStations, Entity<Byte> {
    /**
     * Returns the faction that owns the station.
     *
     * @return The faction.
     */
    Optional<Factions> faction();

    /**
     * Returns the map in which the station is located.
     *
     * @return The map.
     */
    Optional<Maps> map();
}