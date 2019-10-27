/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.records;


import com.kalaazu.persistence.database.tables.AccountsSkylabs;
import org.jooq.Field;
import org.jooq.Record1;
import org.jooq.Record6;
import org.jooq.Row6;
import org.jooq.impl.UpdatableRecordImpl;

import javax.annotation.processing.Generated;
import java.sql.Timestamp;


/**
 * Skylab for the accounts.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class AccountsSkylabsRecord extends UpdatableRecordImpl<AccountsSkylabsRecord> implements Record6<Integer, Integer, Byte, Byte, Integer, Timestamp> {

    private static final long serialVersionUID = -261154480;

    /**
     * Create a detached AccountsSkylabsRecord
     */
    public AccountsSkylabsRecord() {
        super(AccountsSkylabs.ACCOUNTS_SKYLABS);
    }

    /**
     * Create a detached, initialised AccountsSkylabsRecord
     */
    public AccountsSkylabsRecord(
            Integer id, Integer accountsId, Byte skylabModulesId, Byte levelsId, Integer space, Timestamp upgrade
    ) {
        super(AccountsSkylabs.ACCOUNTS_SKYLABS);

        set(0, id);
        set(1, accountsId);
        set(2, skylabModulesId);
        set(3, levelsId);
        set(4, space);
        set(5, upgrade);
    }

    /**
     * Getter for <code>kalaazu.accounts_skylabs.id</code>. Primary Key.
     */
    public Integer getId() {
        return (Integer) get(0);
    }

    /**
     * Setter for <code>kalaazu.accounts_skylabs.id</code>. Primary Key.
     */
    public void setId(Integer value) {
        set(0, value);
    }

    /**
     * Getter for <code>kalaazu.accounts_skylabs.accounts_id</code>. Account ID.
     */
    public Integer getAccountsId() {
        return (Integer) get(1);
    }

    /**
     * Setter for <code>kalaazu.accounts_skylabs.accounts_id</code>. Account ID.
     */
    public void setAccountsId(Integer value) {
        set(1, value);
    }

    /**
     * Getter for <code>kalaazu.accounts_skylabs.skylab_modules_id</code>. Module ID.
     */
    public Byte getSkylabModulesId() {
        return (Byte) get(2);
    }

    /**
     * Setter for <code>kalaazu.accounts_skylabs.skylab_modules_id</code>. Module ID.
     */
    public void setSkylabModulesId(Byte value) {
        set(2, value);
    }

    /**
     * Getter for <code>kalaazu.accounts_skylabs.levels_id</code>. Module level.
     */
    public Byte getLevelsId() {
        return (Byte) get(3);
    }

    /**
     * Setter for <code>kalaazu.accounts_skylabs.levels_id</code>. Module level.
     */
    public void setLevelsId(Byte value) {
        set(3, value);
    }

    /**
     * Getter for <code>kalaazu.accounts_skylabs.space</code>. Used space.
     */
    public Integer getSpace() {
        return (Integer) get(4);
    }

    /**
     * Setter for <code>kalaazu.accounts_skylabs.space</code>. Used space.
     */
    public void setSpace(Integer value) {
        set(4, value);
    }

    // -------------------------------------------------------------------------
    // Primary key information
    // -------------------------------------------------------------------------

    /**
     * Getter for <code>kalaazu.accounts_skylabs.upgrade</code>. Date when this module started upgrading.
     */
    public Timestamp getUpgrade() {
        return (Timestamp) get(5);
    }

    // -------------------------------------------------------------------------
    // Record6 type implementation
    // -------------------------------------------------------------------------

    /**
     * Setter for <code>kalaazu.accounts_skylabs.upgrade</code>. Date when this module started upgrading.
     */
    public void setUpgrade(Timestamp value) {
        set(5, value);
    }

    @Override
    public Record1<Integer> key() {
        return (Record1) super.key();
    }

    @Override
    public Row6<Integer, Integer, Byte, Byte, Integer, Timestamp> fieldsRow() {
        return (Row6) super.fieldsRow();
    }

    @Override
    public Row6<Integer, Integer, Byte, Byte, Integer, Timestamp> valuesRow() {
        return (Row6) super.valuesRow();
    }

    @Override
    public Field<Integer> field1() {
        return AccountsSkylabs.ACCOUNTS_SKYLABS.ID;
    }

    @Override
    public Field<Integer> field2() {
        return AccountsSkylabs.ACCOUNTS_SKYLABS.ACCOUNTS_ID;
    }

    @Override
    public Field<Byte> field3() {
        return AccountsSkylabs.ACCOUNTS_SKYLABS.SKYLAB_MODULES_ID;
    }

    @Override
    public Field<Byte> field4() {
        return AccountsSkylabs.ACCOUNTS_SKYLABS.LEVELS_ID;
    }

    @Override
    public Field<Integer> field5() {
        return AccountsSkylabs.ACCOUNTS_SKYLABS.SPACE;
    }

    @Override
    public Field<Timestamp> field6() {
        return AccountsSkylabs.ACCOUNTS_SKYLABS.UPGRADE;
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
        return getSkylabModulesId();
    }

    @Override
    public Byte component4() {
        return getLevelsId();
    }

    @Override
    public Integer component5() {
        return getSpace();
    }

    @Override
    public Timestamp component6() {
        return getUpgrade();
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
        return getSkylabModulesId();
    }

    @Override
    public Byte value4() {
        return getLevelsId();
    }

    @Override
    public Integer value5() {
        return getSpace();
    }

    @Override
    public Timestamp value6() {
        return getUpgrade();
    }

    @Override
    public AccountsSkylabsRecord value1(Integer value) {
        setId(value);
        return this;
    }

    @Override
    public AccountsSkylabsRecord value2(Integer value) {
        setAccountsId(value);
        return this;
    }

    @Override
    public AccountsSkylabsRecord value3(Byte value) {
        setSkylabModulesId(value);
        return this;
    }

    @Override
    public AccountsSkylabsRecord value4(Byte value) {
        setLevelsId(value);
        return this;
    }

    @Override
    public AccountsSkylabsRecord value5(Integer value) {
        setSpace(value);
        return this;
    }

    // -------------------------------------------------------------------------
    // Constructors
    // -------------------------------------------------------------------------

    @Override
    public AccountsSkylabsRecord value6(Timestamp value) {
        setUpgrade(value);
        return this;
    }

    @Override
    public AccountsSkylabsRecord values(
            Integer value1, Integer value2, Byte value3, Byte value4, Integer value5, Timestamp value6
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