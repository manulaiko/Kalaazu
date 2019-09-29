/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.tables;


import com.kalaazu.persistence.database.Indexes;
import com.kalaazu.persistence.database.Kalaazu;
import com.kalaazu.persistence.database.Keys;
import com.kalaazu.persistence.database.records.MapsStationsRecord;
import org.jooq.*;
import org.jooq.impl.DSL;
import org.jooq.impl.TableImpl;

import javax.annotation.processing.Generated;
import java.util.Arrays;
import java.util.List;


/**
 * Stations on map.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class MapsStations extends TableImpl<MapsStationsRecord> {

    /**
     * The reference instance of <code>kalaazu.maps_stations</code>
     */
    public static final MapsStations MAPS_STATIONS = new MapsStations();
    private static final long serialVersionUID = -1010935882;
    /**
     * The column <code>kalaazu.maps_stations.id</code>. Primary Key.
     */
    public final TableField<MapsStationsRecord, Byte> ID = createField(
            DSL.name("id"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false)
                                             .identity(true),
            this,
            "Primary Key."
    );
    /**
     * The column <code>kalaazu.maps_stations.position</code>. Position on map.
     */
    public final TableField<MapsStationsRecord, Long> POSITION = createField(
            DSL.name("position"),
            org.jooq.impl.SQLDataType.BIGINT.nullable(false)
                                            .defaultValue(org.jooq.impl.DSL.field(
                                                    "0",
                                                    org.jooq.impl.SQLDataType.BIGINT
                                            )),
            this,
            "Position on map."
    );
    /**
     * The column <code>kalaazu.maps_stations.maps_id</code>.
     */
    public final TableField<MapsStationsRecord, Byte> MAPS_ID = createField(
            DSL.name("maps_id"),
            org.jooq.impl.SQLDataType.TINYINT,
            this,
            ""
    );
    /**
     * The column <code>kalaazu.maps_stations.factions_id</code>.
     */
    public final TableField<MapsStationsRecord, Byte> FACTIONS_ID = createField(
            DSL.name("factions_id"),
            org.jooq.impl.SQLDataType.TINYINT,
            this,
            ""
    );

    /**
     * Create a <code>kalaazu.maps_stations</code> table reference
     */
    public MapsStations() {
        this(DSL.name("maps_stations"), null);
    }

    /**
     * Create an aliased <code>kalaazu.maps_stations</code> table reference
     */
    public MapsStations(String alias) {
        this(DSL.name(alias), MAPS_STATIONS);
    }

    /**
     * Create an aliased <code>kalaazu.maps_stations</code> table reference
     */
    public MapsStations(Name alias) {
        this(alias, MAPS_STATIONS);
    }

    private MapsStations(Name alias, Table<MapsStationsRecord> aliased) {
        this(alias, aliased, null);
    }

    private MapsStations(Name alias, Table<MapsStationsRecord> aliased, Field<?>[] parameters) {
        super(alias, null, aliased, parameters, DSL.comment("Stations on map."));
    }

    public <O extends Record> MapsStations(Table<O> child, ForeignKey<O, MapsStationsRecord> key) {
        super(child, key, MAPS_STATIONS);
    }

    /**
     * The class holding records for this type
     */
    @Override
    public Class<MapsStationsRecord> getRecordType() {
        return MapsStationsRecord.class;
    }

    @Override
    public Schema getSchema() {
        return Kalaazu.KALAAZU;
    }

    @Override
    public List<Index> getIndexes() {
        return Arrays.<Index>asList(
                Indexes.MAPS_STATIONS_MAPS_STATIONS_FACTIONS_ID_IDX,
                Indexes.MAPS_STATIONS_MAPS_STATIONS_MAPS_ID_IDX,
                Indexes.MAPS_STATIONS_PRIMARY
        );
    }

    @Override
    public Identity<MapsStationsRecord, Byte> getIdentity() {
        return Keys.IDENTITY_MAPS_STATIONS;
    }

    @Override
    public UniqueKey<MapsStationsRecord> getPrimaryKey() {
        return Keys.KEY_MAPS_STATIONS_PRIMARY;
    }

    @Override
    public List<UniqueKey<MapsStationsRecord>> getKeys() {
        return Arrays.<UniqueKey<MapsStationsRecord>>asList(Keys.KEY_MAPS_STATIONS_PRIMARY);
    }

    @Override
    public List<ForeignKey<MapsStationsRecord, ?>> getReferences() {
        return Arrays.<ForeignKey<MapsStationsRecord, ?>>asList(Keys.MAPS_STATIONS_MAPS, Keys.MAPS_STATIONS_FACTIONS);
    }

    public Maps maps() {
        return new Maps(this, Keys.MAPS_STATIONS_MAPS);
    }

    public Factions factions() {
        return new Factions(this, Keys.MAPS_STATIONS_FACTIONS);
    }

    @Override
    public MapsStations as(String alias) {
        return new MapsStations(DSL.name(alias), this);
    }

    @Override
    public MapsStations as(Name alias) {
        return new MapsStations(alias, this);
    }

    /**
     * Rename this table
     */
    @Override
    public MapsStations rename(String name) {
        return new MapsStations(DSL.name(name), null);
    }

    /**
     * Rename this table
     */
    @Override
    public MapsStations rename(Name name) {
        return new MapsStations(name, null);
    }

    // -------------------------------------------------------------------------
    // Row4 type methods
    // -------------------------------------------------------------------------

    @Override
    public Row4<Byte, Long, Byte, Byte> fieldsRow() {
        return (Row4) super.fieldsRow();
    }
}
