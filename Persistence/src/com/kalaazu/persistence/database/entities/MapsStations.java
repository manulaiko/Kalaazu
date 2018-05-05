package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.maps_stations.generated.GeneratedMapsStations;

import java.util.Optional;

/**
 * The main interface for entities of the {@code maps_stations}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface MapsStations extends GeneratedMapsStations, Entity<Byte> {
    /**
     * Returns the faction that owns the station.
     *
     * @return The faction.
     */
    Optional<Factions> getFaction();

    /**
     * Returns the map in which the station is located.
     *
     * @return The map.
     */
    Optional<Maps> getMap();
}