/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.records;


import com.kalaazu.persistence.database.tables.ClansBanksLogs;
import org.jooq.Field;
import org.jooq.Record1;
import org.jooq.Record8;
import org.jooq.Row8;
import org.jooq.impl.UpdatableRecordImpl;

import javax.annotation.processing.Generated;
import java.sql.Timestamp;


/**
 * Logs from clan's bank.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class ClansBanksLogsRecord extends UpdatableRecordImpl<ClansBanksLogsRecord> implements Record8<Integer, Integer, Integer, Integer, Timestamp, Byte, Integer, Byte> {

    private static final long serialVersionUID = 1011539127;

    /**
     * Create a detached ClansBanksLogsRecord
     */
    public ClansBanksLogsRecord() {
        super(ClansBanksLogs.CLANS_BANKS_LOGS);
    }

    /**
     * Create a detached, initialised ClansBanksLogsRecord
     */
    public ClansBanksLogsRecord(
            Integer id, Integer clansBanksId, Integer fromAccountsId, Integer toAccountsId, Timestamp date, Byte type,
            Integer amount, Byte currency
    ) {
        super(ClansBanksLogs.CLANS_BANKS_LOGS);

        set(0, id);
        set(1, clansBanksId);
        set(2, fromAccountsId);
        set(3, toAccountsId);
        set(4, date);
        set(5, type);
        set(6, amount);
        set(7, currency);
    }

    /**
     * Getter for <code>kalaazu.clans_banks_logs.id</code>. Primary Key.
     */
    public Integer getId() {
        return (Integer) get(0);
    }

    /**
     * Setter for <code>kalaazu.clans_banks_logs.id</code>. Primary Key.
     */
    public void setId(Integer value) {
        set(0, value);
    }

    /**
     * Getter for <code>kalaazu.clans_banks_logs.clans_banks_id</code>.
     */
    public Integer getClansBanksId() {
        return (Integer) get(1);
    }

    /**
     * Setter for <code>kalaazu.clans_banks_logs.clans_banks_id</code>.
     */
    public void setClansBanksId(Integer value) {
        set(1, value);
    }

    /**
     * Getter for <code>kalaazu.clans_banks_logs.from_accounts_id</code>. Account that made the log.
     */
    public Integer getFromAccountsId() {
        return (Integer) get(2);
    }

    /**
     * Setter for <code>kalaazu.clans_banks_logs.from_accounts_id</code>. Account that made the log.
     */
    public void setFromAccountsId(Integer value) {
        set(2, value);
    }

    /**
     * Getter for <code>kalaazu.clans_banks_logs.to_accounts_id</code>.
     */
    public Integer getToAccountsId() {
        return (Integer) get(3);
    }

    /**
     * Setter for <code>kalaazu.clans_banks_logs.to_accounts_id</code>.
     */
    public void setToAccountsId(Integer value) {
        set(3, value);
    }

    /**
     * Getter for <code>kalaazu.clans_banks_logs.date</code>.
     */
    public Timestamp getDate() {
        return (Timestamp) get(4);
    }

    /**
     * Setter for <code>kalaazu.clans_banks_logs.date</code>.
     */
    public void setDate(Timestamp value) {
        set(4, value);
    }

    /**
     * Getter for <code>kalaazu.clans_banks_logs.type</code>. Log type. 0 = withdraw, 1 = deposit, 2 = donation.
     */
    public Byte getType() {
        return (Byte) get(5);
    }

    /**
     * Setter for <code>kalaazu.clans_banks_logs.type</code>. Log type. 0 = withdraw, 1 = deposit, 2 = donation.
     */
    public void setType(Byte value) {
        set(5, value);
    }

    /**
     * Getter for <code>kalaazu.clans_banks_logs.amount</code>. Amount of currency logged.
     */
    public Integer getAmount() {
        return (Integer) get(6);
    }

    /**
     * Setter for <code>kalaazu.clans_banks_logs.amount</code>. Amount of currency logged.
     */
    public void setAmount(Integer value) {
        set(6, value);
    }

    // -------------------------------------------------------------------------
    // Primary key information
    // -------------------------------------------------------------------------

    /**
     * Getter for <code>kalaazu.clans_banks_logs.currency</code>. Currency of the amount. 0 = credits, 1 = uridium.
     */
    public Byte getCurrency() {
        return (Byte) get(7);
    }

    // -------------------------------------------------------------------------
    // Record8 type implementation
    // -------------------------------------------------------------------------

    /**
     * Setter for <code>kalaazu.clans_banks_logs.currency</code>. Currency of the amount. 0 = credits, 1 = uridium.
     */
    public void setCurrency(Byte value) {
        set(7, value);
    }

    @Override
    public Record1<Integer> key() {
        return (Record1) super.key();
    }

    @Override
    public Row8<Integer, Integer, Integer, Integer, Timestamp, Byte, Integer, Byte> fieldsRow() {
        return (Row8) super.fieldsRow();
    }

    @Override
    public Row8<Integer, Integer, Integer, Integer, Timestamp, Byte, Integer, Byte> valuesRow() {
        return (Row8) super.valuesRow();
    }

    @Override
    public Field<Integer> field1() {
        return ClansBanksLogs.CLANS_BANKS_LOGS.ID;
    }

    @Override
    public Field<Integer> field2() {
        return ClansBanksLogs.CLANS_BANKS_LOGS.CLANS_BANKS_ID;
    }

    @Override
    public Field<Integer> field3() {
        return ClansBanksLogs.CLANS_BANKS_LOGS.FROM_ACCOUNTS_ID;
    }

    @Override
    public Field<Integer> field4() {
        return ClansBanksLogs.CLANS_BANKS_LOGS.TO_ACCOUNTS_ID;
    }

    @Override
    public Field<Timestamp> field5() {
        return ClansBanksLogs.CLANS_BANKS_LOGS.DATE;
    }

    @Override
    public Field<Byte> field6() {
        return ClansBanksLogs.CLANS_BANKS_LOGS.TYPE;
    }

    @Override
    public Field<Integer> field7() {
        return ClansBanksLogs.CLANS_BANKS_LOGS.AMOUNT;
    }

    @Override
    public Field<Byte> field8() {
        return ClansBanksLogs.CLANS_BANKS_LOGS.CURRENCY;
    }

    @Override
    public Integer component1() {
        return getId();
    }

    @Override
    public Integer component2() {
        return getClansBanksId();
    }

    @Override
    public Integer component3() {
        return getFromAccountsId();
    }

    @Override
    public Integer component4() {
        return getToAccountsId();
    }

    @Override
    public Timestamp component5() {
        return getDate();
    }

    @Override
    public Byte component6() {
        return getType();
    }

    @Override
    public Integer component7() {
        return getAmount();
    }

    @Override
    public Byte component8() {
        return getCurrency();
    }

    @Override
    public Integer value1() {
        return getId();
    }

    @Override
    public Integer value2() {
        return getClansBanksId();
    }

    @Override
    public Integer value3() {
        return getFromAccountsId();
    }

    @Override
    public Integer value4() {
        return getToAccountsId();
    }

    @Override
    public Timestamp value5() {
        return getDate();
    }

    @Override
    public Byte value6() {
        return getType();
    }

    @Override
    public Integer value7() {
        return getAmount();
    }

    @Override
    public Byte value8() {
        return getCurrency();
    }

    @Override
    public ClansBanksLogsRecord value1(Integer value) {
        setId(value);
        return this;
    }

    @Override
    public ClansBanksLogsRecord value2(Integer value) {
        setClansBanksId(value);
        return this;
    }

    @Override
    public ClansBanksLogsRecord value3(Integer value) {
        setFromAccountsId(value);
        return this;
    }

    @Override
    public ClansBanksLogsRecord value4(Integer value) {
        setToAccountsId(value);
        return this;
    }

    @Override
    public ClansBanksLogsRecord value5(Timestamp value) {
        setDate(value);
        return this;
    }

    @Override
    public ClansBanksLogsRecord value6(Byte value) {
        setType(value);
        return this;
    }

    @Override
    public ClansBanksLogsRecord value7(Integer value) {
        setAmount(value);
        return this;
    }

    // -------------------------------------------------------------------------
    // Constructors
    // -------------------------------------------------------------------------

    @Override
    public ClansBanksLogsRecord value8(Byte value) {
        setCurrency(value);
        return this;
    }

    @Override
    public ClansBanksLogsRecord values(
            Integer value1, Integer value2, Integer value3, Integer value4, Timestamp value5, Byte value6,
            Integer value7, Byte value8
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
