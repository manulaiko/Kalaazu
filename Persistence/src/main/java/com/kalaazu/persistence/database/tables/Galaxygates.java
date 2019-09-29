/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.tables;


import com.kalaazu.persistence.database.Indexes;
import com.kalaazu.persistence.database.Kalaazu;
import com.kalaazu.persistence.database.Keys;
import com.kalaazu.persistence.database.records.GalaxygatesRecord;
import org.jooq.*;
import org.jooq.impl.DSL;
import org.jooq.impl.TableImpl;

import javax.annotation.processing.Generated;
import java.util.Arrays;
import java.util.List;


/**
 * Galaxy gates from the server.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class Galaxygates extends TableImpl<GalaxygatesRecord> {

    /**
     * The reference instance of <code>kalaazu.galaxygates</code>
     */
    public static final Galaxygates GALAXYGATES = new Galaxygates();
    private static final long serialVersionUID = -676644209;
    /**
     * The column <code>kalaazu.galaxygates.id</code>. Primary Key.
     */
    public final TableField<GalaxygatesRecord, Byte> ID = createField(
            DSL.name("id"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false)
                                             .identity(true),
            this,
            "Primary Key."
    );
    /**
     * The column <code>kalaazu.galaxygates.name</code>.
     */
    public final TableField<GalaxygatesRecord, String> NAME = createField(
            DSL.name("name"),
            org.jooq.impl.SQLDataType.VARCHAR(255)
                                     .nullable(false)
                                     .defaultValue(org.jooq.impl.DSL.field(
                                             "GG-A",
                                             org.jooq.impl.SQLDataType.VARCHAR
                                     )),
            this,
            ""
    );
    /**
     * The column <code>kalaazu.galaxygates.galaxygates_waves_id</code>. Starting wave.
     */
    public final TableField<GalaxygatesRecord, Byte> GALAXYGATES_WAVES_ID = createField(
            DSL.name("galaxygates_waves_id"),
            org.jooq.impl.SQLDataType.TINYINT,
            this,
            "Starting wave."
    );
    /**
     * The column <code>kalaazu.galaxygates.parts</code>. Necessary parts to build the gate.
     */
    public final TableField<GalaxygatesRecord, Byte> PARTS = createField(
            DSL.name("parts"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "0",
                                                     org.jooq.impl.SQLDataType.TINYINT
                                             )),
            this,
            "Necessary parts to build the gate."
    );

    /**
     * Create a <code>kalaazu.galaxygates</code> table reference
     */
    public Galaxygates() {
        this(DSL.name("galaxygates"), null);
    }

    /**
     * Create an aliased <code>kalaazu.galaxygates</code> table reference
     */
    public Galaxygates(String alias) {
        this(DSL.name(alias), GALAXYGATES);
    }

    /**
     * Create an aliased <code>kalaazu.galaxygates</code> table reference
     */
    public Galaxygates(Name alias) {
        this(alias, GALAXYGATES);
    }

    private Galaxygates(Name alias, Table<GalaxygatesRecord> aliased) {
        this(alias, aliased, null);
    }

    private Galaxygates(Name alias, Table<GalaxygatesRecord> aliased, Field<?>[] parameters) {
        super(alias, null, aliased, parameters, DSL.comment("Galaxy gates from the server."));
    }

    public <O extends Record> Galaxygates(Table<O> child, ForeignKey<O, GalaxygatesRecord> key) {
        super(child, key, GALAXYGATES);
    }

    /**
     * The class holding records for this type
     */
    @Override
    public Class<GalaxygatesRecord> getRecordType() {
        return GalaxygatesRecord.class;
    }

    @Override
    public Schema getSchema() {
        return Kalaazu.KALAAZU;
    }

    @Override
    public List<Index> getIndexes() {
        return Arrays.<Index>asList(Indexes.GALAXYGATES_GALAXYGATES_GALAXYGATES_WAVES, Indexes.GALAXYGATES_PRIMARY);
    }

    @Override
    public Identity<GalaxygatesRecord, Byte> getIdentity() {
        return Keys.IDENTITY_GALAXYGATES;
    }

    @Override
    public UniqueKey<GalaxygatesRecord> getPrimaryKey() {
        return Keys.KEY_GALAXYGATES_PRIMARY;
    }

    @Override
    public List<UniqueKey<GalaxygatesRecord>> getKeys() {
        return Arrays.<UniqueKey<GalaxygatesRecord>>asList(Keys.KEY_GALAXYGATES_PRIMARY);
    }

    @Override
    public List<ForeignKey<GalaxygatesRecord, ?>> getReferences() {
        return Arrays.<ForeignKey<GalaxygatesRecord, ?>>asList(Keys.GALAXYGATES_GALAXYGATES_WAVES);
    }

    public GalaxygatesWaves galaxygatesWaves() {
        return new GalaxygatesWaves(this, Keys.GALAXYGATES_GALAXYGATES_WAVES);
    }

    @Override
    public Galaxygates as(String alias) {
        return new Galaxygates(DSL.name(alias), this);
    }

    @Override
    public Galaxygates as(Name alias) {
        return new Galaxygates(alias, this);
    }

    /**
     * Rename this table
     */
    @Override
    public Galaxygates rename(String name) {
        return new Galaxygates(DSL.name(name), null);
    }

    /**
     * Rename this table
     */
    @Override
    public Galaxygates rename(Name name) {
        return new Galaxygates(name, null);
    }

    // -------------------------------------------------------------------------
    // Row4 type methods
    // -------------------------------------------------------------------------

    @Override
    public Row4<Byte, String, Byte, Byte> fieldsRow() {
        return (Row4) super.fieldsRow();
    }
}
