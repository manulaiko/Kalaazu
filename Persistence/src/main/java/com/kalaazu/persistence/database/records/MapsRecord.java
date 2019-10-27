/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.records;


import com.kalaazu.persistence.database.tables.Maps;
import org.jooq.Field;
import org.jooq.Record1;
import org.jooq.Record6;
import org.jooq.Row6;
import org.jooq.impl.UpdatableRecordImpl;

import javax.annotation.processing.Generated;


/**
 * In game maps.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class MapsRecord extends UpdatableRecordImpl<MapsRecord> implements Record6<Byte, String, Byte, Byte, Byte, Long> {

    private static final long serialVersionUID = -889827681;

    /**
     * Create a detached MapsRecord
     */
    public MapsRecord() {
        super(Maps.MAPS);
    }

    /**
     * Create a detached, initialised MapsRecord
     */
    public MapsRecord(Byte id, String name, Byte factionsId, Byte isPvp, Byte isStarter, Long limits) {
        super(Maps.MAPS);

        set(0, id);
        set(1, name);
        set(2, factionsId);
        set(3, isPvp);
        set(4, isStarter);
        set(5, limits);
    }

    /**
     * Getter for <code>kalaazu.maps.id</code>. Primary Key.
     */
    public Byte getId() {
        return (Byte) get(0);
    }

    /**
     * Setter for <code>kalaazu.maps.id</code>. Primary Key.
     */
    public void setId(Byte value) {
        set(0, value);
    }

    /**
     * Getter for <code>kalaazu.maps.name</code>. Map name.
     */
    public String getName() {
        return (String) get(1);
    }

    /**
     * Setter for <code>kalaazu.maps.name</code>. Map name.
     */
    public void setName(String value) {
        set(1, value);
    }

    /**
     * Getter for <code>kalaazu.maps.factions_id</code>.
     */
    public Byte getFactionsId() {
        return (Byte) get(2);
    }

    /**
     * Setter for <code>kalaazu.maps.factions_id</code>.
     */
    public void setFactionsId(Byte value) {
        set(2, value);
    }

    /**
     * Getter for <code>kalaazu.maps.is_pvp</code>.
     */
    public Byte getIsPvp() {
        return (Byte) get(3);
    }

    /**
     * Setter for <code>kalaazu.maps.is_pvp</code>.
     */
    public void setIsPvp(Byte value) {
        set(3, value);
    }

    /**
     * Getter for <code>kalaazu.maps.is_starter</code>.
     */
    public Byte getIsStarter() {
        return (Byte) get(4);
    }

    /**
     * Setter for <code>kalaazu.maps.is_starter</code>.
     */
    public void setIsStarter(Byte value) {
        set(4, value);
    }

    // -------------------------------------------------------------------------
    // Primary key information
    // -------------------------------------------------------------------------

    /**
     * Getter for <code>kalaazu.maps.limits</code>.
     */
    public Long getLimits() {
        return (Long) get(5);
    }

    // -------------------------------------------------------------------------
    // Record6 type implementation
    // -------------------------------------------------------------------------

    /**
     * Setter for <code>kalaazu.maps.limits</code>.
     */
    public void setLimits(Long value) {
        set(5, value);
    }

    @Override
    public Record1<Byte> key() {
        return (Record1) super.key();
    }

    @Override
    public Row6<Byte, String, Byte, Byte, Byte, Long> fieldsRow() {
        return (Row6) super.fieldsRow();
    }

    @Override
    public Row6<Byte, String, Byte, Byte, Byte, Long> valuesRow() {
        return (Row6) super.valuesRow();
    }

    @Override
    public Field<Byte> field1() {
        return Maps.MAPS.ID;
    }

    @Override
    public Field<String> field2() {
        return Maps.MAPS.NAME;
    }

    @Override
    public Field<Byte> field3() {
        return Maps.MAPS.FACTIONS_ID;
    }

    @Override
    public Field<Byte> field4() {
        return Maps.MAPS.IS_PVP;
    }

    @Override
    public Field<Byte> field5() {
        return Maps.MAPS.IS_STARTER;
    }

    @Override
    public Field<Long> field6() {
        return Maps.MAPS.LIMITS;
    }

    @Override
    public Byte component1() {
        return getId();
    }

    @Override
    public String component2() {
        return getName();
    }

    @Override
    public Byte component3() {
        return getFactionsId();
    }

    @Override
    public Byte component4() {
        return getIsPvp();
    }

    @Override
    public Byte component5() {
        return getIsStarter();
    }

    @Override
    public Long component6() {
        return getLimits();
    }

    @Override
    public Byte value1() {
        return getId();
    }

    @Override
    public String value2() {
        return getName();
    }

    @Override
    public Byte value3() {
        return getFactionsId();
    }

    @Override
    public Byte value4() {
        return getIsPvp();
    }

    @Override
    public Byte value5() {
        return getIsStarter();
    }

    @Override
    public Long value6() {
        return getLimits();
    }

    @Override
    public MapsRecord value1(Byte value) {
        setId(value);
        return this;
    }

    @Override
    public MapsRecord value2(String value) {
        setName(value);
        return this;
    }

    @Override
    public MapsRecord value3(Byte value) {
        setFactionsId(value);
        return this;
    }

    @Override
    public MapsRecord value4(Byte value) {
        setIsPvp(value);
        return this;
    }

    @Override
    public MapsRecord value5(Byte value) {
        setIsStarter(value);
        return this;
    }

    // -------------------------------------------------------------------------
    // Constructors
    // -------------------------------------------------------------------------

    @Override
    public MapsRecord value6(Long value) {
        setLimits(value);
        return this;
    }

    @Override
    public MapsRecord values(Byte value1, String value2, Byte value3, Byte value4, Byte value5, Long value6) {
        value1(value1);
        value2(value2);
        value3(value3);
        value4(value4);
        value5(value5);
        value6(value6);
        return this;
    }
}