/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.records;


import com.kalaazu.persistence.database.tables.ClansBattlestations;
import org.jooq.Field;
import org.jooq.Record1;
import org.jooq.Record6;
import org.jooq.Row6;
import org.jooq.impl.UpdatableRecordImpl;

import javax.annotation.processing.Generated;
import java.sql.Timestamp;


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
public class ClansBattlestationsRecord extends UpdatableRecordImpl<ClansBattlestationsRecord> implements Record6<Byte, Integer, Byte, String, Long, Timestamp> {

    private static final long serialVersionUID = -114628034;

    /**
     * Create a detached ClansBattlestationsRecord
     */
    public ClansBattlestationsRecord() {
        super(ClansBattlestations.CLANS_BATTLESTATIONS);
    }

    /**
     * Create a detached, initialised ClansBattlestationsRecord
     */
    public ClansBattlestationsRecord(
            Byte id, Integer clansId, Byte mapsId, String name, Long position, Timestamp date
    ) {
        super(ClansBattlestations.CLANS_BATTLESTATIONS);

        set(0, id);
        set(1, clansId);
        set(2, mapsId);
        set(3, name);
        set(4, position);
        set(5, date);
    }

    /**
     * Getter for <code>kalaazu.clans_battlestations.id</code>. Primary Key.
     */
    public Byte getId() {
        return (Byte) get(0);
    }

    /**
     * Setter for <code>kalaazu.clans_battlestations.id</code>. Primary Key.
     */
    public void setId(Byte value) {
        set(0, value);
    }

    /**
     * Getter for <code>kalaazu.clans_battlestations.clans_id</code>. Owner of the CBS.
     */
    public Integer getClansId() {
        return (Integer) get(1);
    }

    /**
     * Setter for <code>kalaazu.clans_battlestations.clans_id</code>. Owner of the CBS.
     */
    public void setClansId(Integer value) {
        set(1, value);
    }

    /**
     * Getter for <code>kalaazu.clans_battlestations.maps_id</code>. Map of the CBS.
     */
    public Byte getMapsId() {
        return (Byte) get(2);
    }

    /**
     * Setter for <code>kalaazu.clans_battlestations.maps_id</code>. Map of the CBS.
     */
    public void setMapsId(Byte value) {
        set(2, value);
    }

    /**
     * Getter for <code>kalaazu.clans_battlestations.name</code>.
     */
    public String getName() {
        return (String) get(3);
    }

    /**
     * Setter for <code>kalaazu.clans_battlestations.name</code>.
     */
    public void setName(String value) {
        set(3, value);
    }

    /**
     * Getter for <code>kalaazu.clans_battlestations.position</code>. Position on map.
     */
    public Long getPosition() {
        return (Long) get(4);
    }

    /**
     * Setter for <code>kalaazu.clans_battlestations.position</code>. Position on map.
     */
    public void setPosition(Long value) {
        set(4, value);
    }

    // -------------------------------------------------------------------------
    // Primary key information
    // -------------------------------------------------------------------------

    /**
     * Getter for <code>kalaazu.clans_battlestations.date</code>. Date when the CBS was build.
     */
    public Timestamp getDate() {
        return (Timestamp) get(5);
    }

    // -------------------------------------------------------------------------
    // Record6 type implementation
    // -------------------------------------------------------------------------

    /**
     * Setter for <code>kalaazu.clans_battlestations.date</code>. Date when the CBS was build.
     */
    public void setDate(Timestamp value) {
        set(5, value);
    }

    @Override
    public Record1<Byte> key() {
        return (Record1) super.key();
    }

    @Override
    public Row6<Byte, Integer, Byte, String, Long, Timestamp> fieldsRow() {
        return (Row6) super.fieldsRow();
    }

    @Override
    public Row6<Byte, Integer, Byte, String, Long, Timestamp> valuesRow() {
        return (Row6) super.valuesRow();
    }

    @Override
    public Field<Byte> field1() {
        return ClansBattlestations.CLANS_BATTLESTATIONS.ID;
    }

    @Override
    public Field<Integer> field2() {
        return ClansBattlestations.CLANS_BATTLESTATIONS.CLANS_ID;
    }

    @Override
    public Field<Byte> field3() {
        return ClansBattlestations.CLANS_BATTLESTATIONS.MAPS_ID;
    }

    @Override
    public Field<String> field4() {
        return ClansBattlestations.CLANS_BATTLESTATIONS.NAME;
    }

    @Override
    public Field<Long> field5() {
        return ClansBattlestations.CLANS_BATTLESTATIONS.POSITION;
    }

    @Override
    public Field<Timestamp> field6() {
        return ClansBattlestations.CLANS_BATTLESTATIONS.DATE;
    }

    @Override
    public Byte component1() {
        return getId();
    }

    @Override
    public Integer component2() {
        return getClansId();
    }

    @Override
    public Byte component3() {
        return getMapsId();
    }

    @Override
    public String component4() {
        return getName();
    }

    @Override
    public Long component5() {
        return getPosition();
    }

    @Override
    public Timestamp component6() {
        return getDate();
    }

    @Override
    public Byte value1() {
        return getId();
    }

    @Override
    public Integer value2() {
        return getClansId();
    }

    @Override
    public Byte value3() {
        return getMapsId();
    }

    @Override
    public String value4() {
        return getName();
    }

    @Override
    public Long value5() {
        return getPosition();
    }

    @Override
    public Timestamp value6() {
        return getDate();
    }

    @Override
    public ClansBattlestationsRecord value1(Byte value) {
        setId(value);
        return this;
    }

    @Override
    public ClansBattlestationsRecord value2(Integer value) {
        setClansId(value);
        return this;
    }

    @Override
    public ClansBattlestationsRecord value3(Byte value) {
        setMapsId(value);
        return this;
    }

    @Override
    public ClansBattlestationsRecord value4(String value) {
        setName(value);
        return this;
    }

    @Override
    public ClansBattlestationsRecord value5(Long value) {
        setPosition(value);
        return this;
    }

    // -------------------------------------------------------------------------
    // Constructors
    // -------------------------------------------------------------------------

    @Override
    public ClansBattlestationsRecord value6(Timestamp value) {
        setDate(value);
        return this;
    }

    @Override
    public ClansBattlestationsRecord values(
            Byte value1, Integer value2, Byte value3, String value4, Long value5, Timestamp value6
    ) {
        value1(value1);
        value2(value2);
        value3(value3);
        value4(value4);
        value5(value5);
        value6(value6);
        return this;
    }
}