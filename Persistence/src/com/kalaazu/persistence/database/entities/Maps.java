package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.maps.generated.GeneratedMaps;

import java.util.List;
import java.util.Optional;

/**
 * The main interface for entities of the {@code maps}-table in the database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
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
    List<MapsNpcs> getNpcs();

    /**
     * Returns the portals on map.
     *
     * @return Portals.
     */
    List<MapsPortals> getPortals();

    /**
     * Returns the stations on map.
     *
     * @return Stations.
     */
    List<MapsStations> getStations();
}