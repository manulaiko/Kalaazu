/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.tables;


import com.kalaazu.persistence.database.Indexes;
import com.kalaazu.persistence.database.Kalaazu;
import com.kalaazu.persistence.database.Keys;
import com.kalaazu.persistence.database.records.ClansBattlestationsRecord;
import org.jooq.*;
import org.jooq.impl.DSL;
import org.jooq.impl.TableImpl;

import javax.annotation.processing.Generated;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;


/**
 * Clan CBS.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class ClansBattlestations extends TableImpl<ClansBattlestationsRecord> {

    /**
     * The reference instance of <code>kalaazu.clans_battlestations</code>
     */
    public static final ClansBattlestations CLANS_BATTLESTATIONS = new ClansBattlestations();
    private static final long serialVersionUID = -630187670;
    /**
     * The column <code>kalaazu.clans_battlestations.id</code>. Primary Key.
     */
    public final TableField<ClansBattlestationsRecord, Byte> ID = createField(
            DSL.name("id"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false).identity(true),
            this,
            "Primary Key."
    );
    /**
     * The column <code>kalaazu.clans_battlestations.clans_id</code>. Owner of the CBS.
     */
    public final TableField<ClansBattlestationsRecord, Integer> CLANS_ID = createField(
            DSL.name("clans_id"),
            org.jooq.impl.SQLDataType.INTEGER,
            this,
            "Owner of the CBS."
    );
    /**
     * The column <code>kalaazu.clans_battlestations.maps_id</code>. Map of the CBS.
     */
    public final TableField<ClansBattlestationsRecord, Byte> MAPS_ID = createField(
            DSL.name("maps_id"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false),
            this,
            "Map of the CBS."
    );
    /**
     * The column <code>kalaazu.clans_battlestations.name</code>.
     */
    public final TableField<ClansBattlestationsRecord, String> NAME = createField(
            DSL.name("name"),
            org.jooq.impl.SQLDataType.VARCHAR(255)
                                     .nullable(false)
                                     .defaultValue(org.jooq.impl.DSL.field(
                                             "",
                                             org.jooq.impl.SQLDataType.VARCHAR
                                     )),
            this,
            ""
    );
    /**
     * The column <code>kalaazu.clans_battlestations.position</code>. Position on map.
     */
    public final TableField<ClansBattlestationsRecord, Long> POSITION = createField(
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
     * The column <code>kalaazu.clans_battlestations.date</code>. Date when the CBS was build.
     */
    public final TableField<ClansBattlestationsRecord, Timestamp> DATE = createField(
            DSL.name("date"),
            org.jooq.impl.SQLDataType.TIMESTAMP,
            this,
            "Date when the CBS was build."
    );

    /**
     * Create a <code>kalaazu.clans_battlestations</code> table reference
     */
    public ClansBattlestations() {
        this(DSL.name("clans_battlestations"), null);
    }

    /**
     * Create an aliased <code>kalaazu.clans_battlestations</code> table reference
     */
    public ClansBattlestations(String alias) {
        this(DSL.name(alias), CLANS_BATTLESTATIONS);
    }

    /**
     * Create an aliased <code>kalaazu.clans_battlestations</code> table reference
     */
    public ClansBattlestations(Name alias) {
        this(alias, CLANS_BATTLESTATIONS);
    }

    private ClansBattlestations(Name alias, Table<ClansBattlestationsRecord> aliased) {
        this(alias, aliased, null);
    }

    private ClansBattlestations(Name alias, Table<ClansBattlestationsRecord> aliased, Field<?>[] parameters) {
        super(alias, null, aliased, parameters, DSL.comment("Clan CBS."));
    }

    public <O extends Record> ClansBattlestations(Table<O> child, ForeignKey<O, ClansBattlestationsRecord> key) {
        super(child, key, CLANS_BATTLESTATIONS);
    }

    /**
     * The class holding records for this type
     */
    @Override
    public Class<ClansBattlestationsRecord> getRecordType() {
        return ClansBattlestationsRecord.class;
    }

    @Override
    public Schema getSchema() {
        return Kalaazu.KALAAZU;
    }

    @Override
    public List<Index> getIndexes() {
        return Arrays.<Index>asList(
                Indexes.CLANS_BATTLESTATIONS_CLANS_BATTLESTATIONS_CLANS_ID_IDX,
                Indexes.CLANS_BATTLESTATIONS_CLANS_BATTLESTATIONS_MAPS_ID_IDX,
                Indexes.CLANS_BATTLESTATIONS_PRIMARY
        );
    }

    @Override
    public Identity<ClansBattlestationsRecord, Byte> getIdentity() {
        return Keys.IDENTITY_CLANS_BATTLESTATIONS;
    }

    @Override
    public UniqueKey<ClansBattlestationsRecord> getPrimaryKey() {
        return Keys.KEY_CLANS_BATTLESTATIONS_PRIMARY;
    }

    @Override
    public List<UniqueKey<ClansBattlestationsRecord>> getKeys() {
        return Arrays.<UniqueKey<ClansBattlestationsRecord>>asList(Keys.KEY_CLANS_BATTLESTATIONS_PRIMARY);
    }

    @Override
    public List<ForeignKey<ClansBattlestationsRecord, ?>> getReferences() {
        return Arrays.<ForeignKey<ClansBattlestationsRecord, ?>>asList(
                Keys.CLANS_BATTLESTATIONS_CLANS,
                Keys.CLANS_BATTLESTATIONS_MAPS
        );
    }

    public Clans clans() {
        return new Clans(this, Keys.CLANS_BATTLESTATIONS_CLANS);
    }

    public Maps maps() {
        return new Maps(this, Keys.CLANS_BATTLESTATIONS_MAPS);
    }

    @Override
    public ClansBattlestations as(String alias) {
        return new ClansBattlestations(DSL.name(alias), this);
    }

    @Override
    public ClansBattlestations as(Name alias) {
        return new ClansBattlestations(alias, this);
    }

    /**
     * Rename this table
     */
    @Override
    public ClansBattlestations rename(String name) {
        return new ClansBattlestations(DSL.name(name), null);
    }

    /**
     * Rename this table
     */
    @Override
    public ClansBattlestations rename(Name name) {
        return new ClansBattlestations(name, null);
    }

    // -------------------------------------------------------------------------
    // Row6 type methods
    // -------------------------------------------------------------------------

    @Override
    public Row6<Byte, Integer, Byte, String, Long, Timestamp> fieldsRow() {
        return (Row6) super.fieldsRow();
    }
}