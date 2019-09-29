/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.tables;


import com.kalaazu.persistence.database.Indexes;
import com.kalaazu.persistence.database.Kalaazu;
import com.kalaazu.persistence.database.Keys;
import com.kalaazu.persistence.database.records.GalaxygatesStagesRecord;
import org.jooq.*;
import org.jooq.impl.DSL;
import org.jooq.impl.TableImpl;

import javax.annotation.processing.Generated;
import java.util.Arrays;
import java.util.List;


/**
 * Spawn stage for each wave.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class GalaxygatesStages extends TableImpl<GalaxygatesStagesRecord> {

    /**
     * The reference instance of <code>kalaazu.galaxygates_stages</code>
     */
    public static final GalaxygatesStages GALAXYGATES_STAGES = new GalaxygatesStages();
    private static final long serialVersionUID = 985400805;
    /**
     * The column <code>kalaazu.galaxygates_stages.id</code>. Primary Key.
     */
    public final TableField<GalaxygatesStagesRecord, Integer> ID = createField(
            DSL.name("id"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false).identity(true),
            this,
            "Primary Key."
    );
    /**
     * The column <code>kalaazu.galaxygates_stages.galaxygates_waves_id</code>. Wave this stage belongs to
     */
    public final TableField<GalaxygatesStagesRecord, Byte> GALAXYGATES_WAVES_ID = createField(
            DSL.name("galaxygates_waves_id"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false),
            this,
            "Wave this stage belongs to"
    );
    /**
     * The column <code>kalaazu.galaxygates_stages.comment</code>. Just so this isn't that empty
     */
    public final TableField<GalaxygatesStagesRecord, String> COMMENT = createField(
            DSL.name("comment"),
            org.jooq.impl.SQLDataType.CLOB,
            this,
            "Just so this isn't that empty"
    );

    /**
     * Create a <code>kalaazu.galaxygates_stages</code> table reference
     */
    public GalaxygatesStages() {
        this(DSL.name("galaxygates_stages"), null);
    }

    /**
     * Create an aliased <code>kalaazu.galaxygates_stages</code> table reference
     */
    public GalaxygatesStages(String alias) {
        this(DSL.name(alias), GALAXYGATES_STAGES);
    }

    /**
     * Create an aliased <code>kalaazu.galaxygates_stages</code> table reference
     */
    public GalaxygatesStages(Name alias) {
        this(alias, GALAXYGATES_STAGES);
    }

    private GalaxygatesStages(Name alias, Table<GalaxygatesStagesRecord> aliased) {
        this(alias, aliased, null);
    }

    private GalaxygatesStages(Name alias, Table<GalaxygatesStagesRecord> aliased, Field<?>[] parameters) {
        super(alias, null, aliased, parameters, DSL.comment("Spawn stage for each wave."));
    }

    public <O extends Record> GalaxygatesStages(Table<O> child, ForeignKey<O, GalaxygatesStagesRecord> key) {
        super(child, key, GALAXYGATES_STAGES);
    }

    /**
     * The class holding records for this type
     */
    @Override
    public Class<GalaxygatesStagesRecord> getRecordType() {
        return GalaxygatesStagesRecord.class;
    }

    @Override
    public Schema getSchema() {
        return Kalaazu.KALAAZU;
    }

    @Override
    public List<Index> getIndexes() {
        return Arrays.<Index>asList(
                Indexes.GALAXYGATES_STAGES_GALAXYGATES_STAGES_GALAXYGATES_WAVES_ID_IDX,
                Indexes.GALAXYGATES_STAGES_PRIMARY
        );
    }

    @Override
    public Identity<GalaxygatesStagesRecord, Integer> getIdentity() {
        return Keys.IDENTITY_GALAXYGATES_STAGES;
    }

    @Override
    public UniqueKey<GalaxygatesStagesRecord> getPrimaryKey() {
        return Keys.KEY_GALAXYGATES_STAGES_PRIMARY;
    }

    @Override
    public List<UniqueKey<GalaxygatesStagesRecord>> getKeys() {
        return Arrays.<UniqueKey<GalaxygatesStagesRecord>>asList(Keys.KEY_GALAXYGATES_STAGES_PRIMARY);
    }

    @Override
    public List<ForeignKey<GalaxygatesStagesRecord, ?>> getReferences() {
        return Arrays.<ForeignKey<GalaxygatesStagesRecord, ?>>asList(Keys.GALAXYGATES_STAGES_GALAXYGATES_WAVES);
    }

    public GalaxygatesWaves galaxygatesWaves() {
        return new GalaxygatesWaves(this, Keys.GALAXYGATES_STAGES_GALAXYGATES_WAVES);
    }

    @Override
    public GalaxygatesStages as(String alias) {
        return new GalaxygatesStages(DSL.name(alias), this);
    }

    @Override
    public GalaxygatesStages as(Name alias) {
        return new GalaxygatesStages(alias, this);
    }

    /**
     * Rename this table
     */
    @Override
    public GalaxygatesStages rename(String name) {
        return new GalaxygatesStages(DSL.name(name), null);
    }

    /**
     * Rename this table
     */
    @Override
    public GalaxygatesStages rename(Name name) {
        return new GalaxygatesStages(name, null);
    }

    // -------------------------------------------------------------------------
    // Row3 type methods
    // -------------------------------------------------------------------------

    @Override
    public Row3<Integer, Byte, String> fieldsRow() {
        return (Row3) super.fieldsRow();
    }
}
