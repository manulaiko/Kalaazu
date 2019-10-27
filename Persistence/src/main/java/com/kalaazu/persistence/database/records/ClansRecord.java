/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.records;


import com.kalaazu.persistence.database.tables.Clans;
import org.jooq.Field;
import org.jooq.Record1;
import org.jooq.Record8;
import org.jooq.Row8;
import org.jooq.impl.UpdatableRecordImpl;

import javax.annotation.processing.Generated;


/**
 * Server clans.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class ClansRecord extends UpdatableRecordImpl<ClansRecord> implements Record8<Integer, Integer, Byte, String, String, String, String, Byte> {

    private static final long serialVersionUID = -1186263672;

    /**
     * Create a detached ClansRecord
     */
    public ClansRecord() {
        super(Clans.CLANS);
    }

    /**
     * Create a detached, initialised ClansRecord
     */
    public ClansRecord(
            Integer id, Integer accountsId, Byte factionsId, String tag, String name, String description, String logo,
            Byte status
    ) {
        super(Clans.CLANS);

        set(0, id);
        set(1, accountsId);
        set(2, factionsId);
        set(3, tag);
        set(4, name);
        set(5, description);
        set(6, logo);
        set(7, status);
    }

    /**
     * Getter for <code>kalaazu.clans.id</code>. Primary Key.
     */
    public Integer getId() {
        return (Integer) get(0);
    }

    /**
     * Setter for <code>kalaazu.clans.id</code>. Primary Key.
     */
    public void setId(Integer value) {
        set(0, value);
    }

    /**
     * Getter for <code>kalaazu.clans.accounts_id</code>. Owner ID
     */
    public Integer getAccountsId() {
        return (Integer) get(1);
    }

    /**
     * Setter for <code>kalaazu.clans.accounts_id</code>. Owner ID
     */
    public void setAccountsId(Integer value) {
        set(1, value);
    }

    /**
     * Getter for <code>kalaazu.clans.factions_id</code>. Clan affiliation faction.
     */
    public Byte getFactionsId() {
        return (Byte) get(2);
    }

    /**
     * Setter for <code>kalaazu.clans.factions_id</code>. Clan affiliation faction.
     */
    public void setFactionsId(Byte value) {
        set(2, value);
    }

    /**
     * Getter for <code>kalaazu.clans.tag</code>. Name abbreviation.
     */
    public String getTag() {
        return (String) get(3);
    }

    /**
     * Setter for <code>kalaazu.clans.tag</code>. Name abbreviation.
     */
    public void setTag(String value) {
        set(3, value);
    }

    /**
     * Getter for <code>kalaazu.clans.name</code>.
     */
    public String getName() {
        return (String) get(4);
    }

    /**
     * Setter for <code>kalaazu.clans.name</code>.
     */
    public void setName(String value) {
        set(4, value);
    }

    /**
     * Getter for <code>kalaazu.clans.description</code>.
     */
    public String getDescription() {
        return (String) get(5);
    }

    /**
     * Setter for <code>kalaazu.clans.description</code>.
     */
    public void setDescription(String value) {
        set(5, value);
    }

    /**
     * Getter for <code>kalaazu.clans.logo</code>.
     */
    public String getLogo() {
        return (String) get(6);
    }

    /**
     * Setter for <code>kalaazu.clans.logo</code>.
     */
    public void setLogo(String value) {
        set(6, value);
    }

    // -------------------------------------------------------------------------
    // Primary key information
    // -------------------------------------------------------------------------

    /**
     * Getter for <code>kalaazu.clans.status</code>. 0 = closed, 1 = recruiting, 2 = lvl10+, 3 = lvl16+, 4 = FE.
     */
    public Byte getStatus() {
        return (Byte) get(7);
    }

    // -------------------------------------------------------------------------
    // Record8 type implementation
    // -------------------------------------------------------------------------

    /**
     * Setter for <code>kalaazu.clans.status</code>. 0 = closed, 1 = recruiting, 2 = lvl10+, 3 = lvl16+, 4 = FE.
     */
    public void setStatus(Byte value) {
        set(7, value);
    }

    @Override
    public Record1<Integer> key() {
        return (Record1) super.key();
    }

    @Override
    public Row8<Integer, Integer, Byte, String, String, String, String, Byte> fieldsRow() {
        return (Row8) super.fieldsRow();
    }

    @Override
    public Row8<Integer, Integer, Byte, String, String, String, String, Byte> valuesRow() {
        return (Row8) super.valuesRow();
    }

    @Override
    public Field<Integer> field1() {
        return Clans.CLANS.ID;
    }

    @Override
    public Field<Integer> field2() {
        return Clans.CLANS.ACCOUNTS_ID;
    }

    @Override
    public Field<Byte> field3() {
        return Clans.CLANS.FACTIONS_ID;
    }

    @Override
    public Field<String> field4() {
        return Clans.CLANS.TAG;
    }

    @Override
    public Field<String> field5() {
        return Clans.CLANS.NAME;
    }

    @Override
    public Field<String> field6() {
        return Clans.CLANS.DESCRIPTION;
    }

    @Override
    public Field<String> field7() {
        return Clans.CLANS.LOGO;
    }

    @Override
    public Field<Byte> field8() {
        return Clans.CLANS.STATUS;
    }

    @Override
    public Integer component1() {
        return getId();
    }

    @Override
    public Integer component2() {
        return getAccountsId();
    }

    @Override
    public Byte component3() {
        return getFactionsId();
    }

    @Override
    public String component4() {
        return getTag();
    }

    @Override
    public String component5() {
        return getName();
    }

    @Override
    public String component6() {
        return getDescription();
    }

    @Override
    public String component7() {
        return getLogo();
    }

    @Override
    public Byte component8() {
        return getStatus();
    }

    @Override
    public Integer value1() {
        return getId();
    }

    @Override
    public Integer value2() {
        return getAccountsId();
    }

    @Override
    public Byte value3() {
        return getFactionsId();
    }

    @Override
    public String value4() {
        return getTag();
    }

    @Override
    public String value5() {
        return getName();
    }

    @Override
    public String value6() {
        return getDescription();
    }

    @Override
    public String value7() {
        return getLogo();
    }

    @Override
    public Byte value8() {
        return getStatus();
    }

    @Override
    public ClansRecord value1(Integer value) {
        setId(value);
        return this;
    }

    @Override
    public ClansRecord value2(Integer value) {
        setAccountsId(value);
        return this;
    }

    @Override
    public ClansRecord value3(Byte value) {
        setFactionsId(value);
        return this;
    }

    @Override
    public ClansRecord value4(String value) {
        setTag(value);
        return this;
    }

    @Override
    public ClansRecord value5(String value) {
        setName(value);
        return this;
    }

    @Override
    public ClansRecord value6(String value) {
        setDescription(value);
        return this;
    }

    @Override
    public ClansRecord value7(String value) {
        setLogo(value);
        return this;
    }

    // -------------------------------------------------------------------------
    // Constructors
    // -------------------------------------------------------------------------

    @Override
    public ClansRecord value8(Byte value) {
        setStatus(value);
        return this;
    }

    @Override
    public ClansRecord values(
            Integer value1, Integer value2, Byte value3, String value4, String value5, String value6, String value7,
            Byte value8
    ) {
        value1(value1);
        value2(value2);
        value3(value3);
        value4(value4);
        value5(value5);
        value6(value6);
        value7(value7);
        value8(value8);
        return this;
    }
}