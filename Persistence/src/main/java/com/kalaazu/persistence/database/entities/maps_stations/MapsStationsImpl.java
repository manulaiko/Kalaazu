package com.kalaazu.persistence.database.entities.maps_stations;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Factions;
import com.kalaazu.persistence.database.entities.Maps;
import com.kalaazu.persistence.database.entities.MapsStations;
import com.kalaazu.persistence.database.entities.maps_stations.generated.GeneratedMapsStationsImpl;

import java.util.Optional;

/**
 * The default implementation of the {@link
 * MapsStations}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class MapsStationsImpl
        extends GeneratedMapsStationsImpl
        implements MapsStations {
    /**
     * The faction.
     */
    private Optional<Factions> faction;

    /**
     * The map.
     */
    private Optional<Maps> map;

    @Override
    public Optional<Factions> getFaction() {
        if (this.faction != null) {
            return this.faction;
        }

        this.faction = super.findFactionsId(
                Database.getInstance()
                        .db()
                        .manager(Factions.class)
        );

        return this.faction;
    }

    @Override
    public Optional<Maps> getMap() {
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
}