/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.records;


import com.kalaazu.persistence.database.tables.GalaxygatesStagesSpawns;
import org.jooq.Field;
import org.jooq.Record1;
import org.jooq.Record3;
import org.jooq.Row3;
import org.jooq.impl.UpdatableRecordImpl;

import javax.annotation.processing.Generated;


/**
 * Many to many relations for galaxygates_stages and galaxygates_spawns.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class GalaxygatesStagesSpawnsRecord extends UpdatableRecordImpl<GalaxygatesStagesSpawnsRecord> implements Record3<Integer, Integer, Integer> {

    private static final long serialVersionUID = 644454847;

    /**
     * Create a detached GalaxygatesStagesSpawnsRecord
     */
    public GalaxygatesStagesSpawnsRecord() {
        super(GalaxygatesStagesSpawns.GALAXYGATES_STAGES_SPAWNS);
    }

    /**
     * Create a detached, initialised GalaxygatesStagesSpawnsRecord
     */
    public GalaxygatesStagesSpawnsRecord(Integer id, Integer galaxygatesStagesId, Integer galaxygatesSpawnsId) {
        super(GalaxygatesStagesSpawns.GALAXYGATES_STAGES_SPAWNS);

        set(0, id);
        set(1, galaxygatesStagesId);
        set(2, galaxygatesSpawnsId);
    }

    /**
     * Getter for <code>kalaazu.galaxygates_stages_spawns.id</code>. Primary Key.
     */
    public Integer getId() {
        return (Integer) get(0);
    }

    /**
     * Setter for <code>kalaazu.galaxygates_stages_spawns.id</code>. Primary Key.
     */
    public void setId(Integer value) {
        set(0, value);
    }

    /**
     * Getter for <code>kalaazu.galaxygates_stages_spawns.galaxygates_stages_id</code>.
     */
    public Integer getGalaxygatesStagesId() {
        return (Integer) get(1);
    }

    /**
     * Setter for <code>kalaazu.galaxygates_stages_spawns.galaxygates_stages_id</code>.
     */
    public void setGalaxygatesStagesId(Integer value) {
        set(1, value);
    }

    // -------------------------------------------------------------------------
    // Primary key information
    // -------------------------------------------------------------------------

    /**
     * Getter for <code>kalaazu.galaxygates_stages_spawns.galaxygates_spawns_id</code>.
     */
    public Integer getGalaxygatesSpawnsId() {
        return (Integer) get(2);
    }

    // -------------------------------------------------------------------------
    // Record3 type implementation
    // -------------------------------------------------------------------------

    /**
     * Setter for <code>kalaazu.galaxygates_stages_spawns.galaxygates_spawns_id</code>.
     */
    public void setGalaxygatesSpawnsId(Integer value) {
        set(2, value);
    }

    @Override
    public Record1<Integer> key() {
        return (Record1) super.key();
    }

    @Override
    public Row3<Integer, Integer, Integer> fieldsRow() {
        return (Row3) super.fieldsRow();
    }

    @Override
    public Row3<Integer, Integer, Integer> valuesRow() {
        return (Row3) super.valuesRow();
    }

    @Override
    public Field<Integer> field1() {
        return GalaxygatesStagesSpawns.GALAXYGATES_STAGES_SPAWNS.ID;
    }

    @Override
    public Field<Integer> field2() {
        return GalaxygatesStagesSpawns.GALAXYGATES_STAGES_SPAWNS.GALAXYGATES_STAGES_ID;
    }

    @Override
    public Field<Integer> field3() {
        return GalaxygatesStagesSpawns.GALAXYGATES_STAGES_SPAWNS.GALAXYGATES_SPAWNS_ID;
    }

    @Override
    public Integer component1() {
        return getId();
    }

    @Override
    public Integer component2() {
        return getGalaxygatesStagesId();
    }

    @Override
    public Integer component3() {
        return getGalaxygatesSpawnsId();
    }

    @Override
    public Integer value1() {
        return getId();
    }

    @Override
    public Integer value2() {
        return getGalaxygatesStagesId();
    }

    @Override
    public Integer value3() {
        return getGalaxygatesSpawnsId();
    }

    @Override
    public GalaxygatesStagesSpawnsRecord value1(Integer value) {
        setId(value);
        return this;
    }

    @Override
    public GalaxygatesStagesSpawnsRecord value2(Integer value) {
        setGalaxygatesStagesId(value);
        return this;
    }

    // -------------------------------------------------------------------------
    // Constructors
    // -------------------------------------------------------------------------

    @Override
    public GalaxygatesStagesSpawnsRecord value3(Integer value) {
        setGalaxygatesSpawnsId(value);
        return this;
    }

    @Override
    public GalaxygatesStagesSpawnsRecord values(Integer value1, Integer value2, Integer value3) {
        value1(value1);
        value2(value2);
        value3(value3);
        return this;
    }
}