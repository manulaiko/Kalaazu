/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.records;


import com.kalaazu.persistence.database.tables.ClansApplications;
import org.jooq.Field;
import org.jooq.Record1;
import org.jooq.Record5;
import org.jooq.Row5;
import org.jooq.impl.UpdatableRecordImpl;

import javax.annotation.processing.Generated;
import java.sql.Timestamp;


/**
 * Account applications to a clan.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class ClansApplicationsRecord extends UpdatableRecordImpl<ClansApplicationsRecord> implements Record5<Integer, Integer, Integer, Timestamp, String> {

    private static final long serialVersionUID = 1897903806;

    /**
     * Create a detached ClansApplicationsRecord
     */
    public ClansApplicationsRecord() {
        super(ClansApplications.CLANS_APPLICATIONS);
    }

    /**
     * Create a detached, initialised ClansApplicationsRecord
     */
    public ClansApplicationsRecord(Integer id, Integer clansId, Integer accountsId, Timestamp date, String text) {
        super(ClansApplications.CLANS_APPLICATIONS);

        set(0, id);
        set(1, clansId);
        set(2, accountsId);
        set(3, date);
        set(4, text);
    }

    /**
     * Getter for <code>kalaazu.clans_applications.id</code>. Primary Key.
     */
    public Integer getId() {
        return (Integer) get(0);
    }

    /**
     * Setter for <code>kalaazu.clans_applications.id</code>. Primary Key.
     */
    public void setId(Integer value) {
        set(0, value);
    }

    /**
     * Getter for <code>kalaazu.clans_applications.clans_id</code>. Clan ID.
     */
    public Integer getClansId() {
        return (Integer) get(1);
    }

    /**
     * Setter for <code>kalaazu.clans_applications.clans_id</code>. Clan ID.
     */
    public void setClansId(Integer value) {
        set(1, value);
    }

    /**
     * Getter for <code>kalaazu.clans_applications.accounts_id</code>. Account ID.
     */
    public Integer getAccountsId() {
        return (Integer) get(2);
    }

    /**
     * Setter for <code>kalaazu.clans_applications.accounts_id</code>. Account ID.
     */
    public void setAccountsId(Integer value) {
        set(2, value);
    }

    /**
     * Getter for <code>kalaazu.clans_applications.date</code>.
     */
    public Timestamp getDate() {
        return (Timestamp) get(3);
    }

    /**
     * Setter for <code>kalaazu.clans_applications.date</code>.
     */
    public void setDate(Timestamp value) {
        set(3, value);
    }

    // -------------------------------------------------------------------------
    // Primary key information
    // -------------------------------------------------------------------------

    /**
     * Getter for <code>kalaazu.clans_applications.text</code>.
     */
    public String getText() {
        return (String) get(4);
    }

    // -------------------------------------------------------------------------
    // Record5 type implementation
    // -------------------------------------------------------------------------

    /**
     * Setter for <code>kalaazu.clans_applications.text</code>.
     */
    public void setText(String value) {
        set(4, value);
    }

    @Override
    public Record1<Integer> key() {
        return (Record1) super.key();
    }

    @Override
    public Row5<Integer, Integer, Integer, Timestamp, String> fieldsRow() {
        return (Row5) super.fieldsRow();
    }

    @Override
    public Row5<Integer, Integer, Integer, Timestamp, String> valuesRow() {
        return (Row5) super.valuesRow();
    }

    @Override
    public Field<Integer> field1() {
        return ClansApplications.CLANS_APPLICATIONS.ID;
    }

    @Override
    public Field<Integer> field2() {
        return ClansApplications.CLANS_APPLICATIONS.CLANS_ID;
    }

    @Override
    public Field<Integer> field3() {
        return ClansApplications.CLANS_APPLICATIONS.ACCOUNTS_ID;
    }

    @Override
    public Field<Timestamp> field4() {
        return ClansApplications.CLANS_APPLICATIONS.DATE;
    }

    @Override
    public Field<String> field5() {
        return ClansApplications.CLANS_APPLICATIONS.TEXT;
    }

    @Override
    public Integer component1() {
        return getId();
    }

    @Override
    public Integer component2() {
        return getClansId();
    }

    @Override
    public Integer component3() {
        return getAccountsId();
    }

    @Override
    public Timestamp component4() {
        return getDate();
    }

    @Override
    public String component5() {
        return getText();
    }

    @Override
    public Integer value1() {
        return getId();
    }

    @Override
    public Integer value2() {
        return getClansId();
    }

    @Override
    public Integer value3() {
        return getAccountsId();
    }

    @Override
    public Timestamp value4() {
        return getDate();
    }

    @Override
    public String value5() {
        return getText();
    }

    @Override
    public ClansApplicationsRecord value1(Integer value) {
        setId(value);
        return this;
    }

    @Override
    public ClansApplicationsRecord value2(Integer value) {
        setClansId(value);
        return this;
    }

    @Override
    public ClansApplicationsRecord value3(Integer value) {
        setAccountsId(value);
        return this;
    }

    @Override
    public ClansApplicationsRecord value4(Timestamp value) {
        setDate(value);
        return this;
    }

    // -------------------------------------------------------------------------
    // Constructors
    // -------------------------------------------------------------------------

    @Override
    public ClansApplicationsRecord value5(String value) {
        setText(value);
        return this;
    }

    @Override
    public ClansApplicationsRecord values(
            Integer value1, Integer value2, Integer value3, Timestamp value4, String value5
    ) {
        value1(value1);
        value2(value2);
        value3(value3);
        value4(value4);
        value5(value5);
        return this;
    }
}
