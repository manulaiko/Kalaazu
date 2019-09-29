/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.records;


import com.kalaazu.persistence.database.tables.AccountsBanks;
import org.jooq.Field;
import org.jooq.Record1;
import org.jooq.Record6;
import org.jooq.Row6;
import org.jooq.impl.UpdatableRecordImpl;

import javax.annotation.processing.Generated;


/**
 * Account's internal bank.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class AccountsBanksRecord extends UpdatableRecordImpl<AccountsBanksRecord> implements Record6<Integer, Integer, Long, Long, Byte, Byte> {

    private static final long serialVersionUID = -1160582921;

    /**
     * Create a detached AccountsBanksRecord
     */
    public AccountsBanksRecord() {
        super(AccountsBanks.ACCOUNTS_BANKS);
    }

    /**
     * Create a detached, initialised AccountsBanksRecord
     */
    public AccountsBanksRecord(
            Integer id, Integer accountsId, Long credits, Long uridium, Byte taxCredits, Byte taxUridium
    ) {
        super(AccountsBanks.ACCOUNTS_BANKS);

        set(0, id);
        set(1, accountsId);
        set(2, credits);
        set(3, uridium);
        set(4, taxCredits);
        set(5, taxUridium);
    }

    /**
     * Getter for <code>kalaazu.accounts_banks.id</code>. Primary Key.
     */
    public Integer getId() {
        return (Integer) get(0);
    }

    /**
     * Setter for <code>kalaazu.accounts_banks.id</code>. Primary Key.
     */
    public void setId(Integer value) {
        set(0, value);
    }

    /**
     * Getter for <code>kalaazu.accounts_banks.accounts_id</code>.
     */
    public Integer getAccountsId() {
        return (Integer) get(1);
    }

    /**
     * Setter for <code>kalaazu.accounts_banks.accounts_id</code>.
     */
    public void setAccountsId(Integer value) {
        set(1, value);
    }

    /**
     * Getter for <code>kalaazu.accounts_banks.credits</code>. Credits available in the bank.
     */
    public Long getCredits() {
        return (Long) get(2);
    }

    /**
     * Setter for <code>kalaazu.accounts_banks.credits</code>. Credits available in the bank.
     */
    public void setCredits(Long value) {
        set(2, value);
    }

    /**
     * Getter for <code>kalaazu.accounts_banks.uridium</code>. Uridium available in the bank.
     */
    public Long getUridium() {
        return (Long) get(3);
    }

    /**
     * Setter for <code>kalaazu.accounts_banks.uridium</code>. Uridium available in the bank.
     */
    public void setUridium(Long value) {
        set(3, value);
    }

    /**
     * Getter for <code>kalaazu.accounts_banks.tax_credits</code>. Tax rate for credits.
     */
    public Byte getTaxCredits() {
        return (Byte) get(4);
    }

    /**
     * Setter for <code>kalaazu.accounts_banks.tax_credits</code>. Tax rate for credits.
     */
    public void setTaxCredits(Byte value) {
        set(4, value);
    }

    // -------------------------------------------------------------------------
    // Primary key information
    // -------------------------------------------------------------------------

    /**
     * Getter for <code>kalaazu.accounts_banks.tax_uridium</code>. Tax rate for uridium.
     */
    public Byte getTaxUridium() {
        return (Byte) get(5);
    }

    // -------------------------------------------------------------------------
    // Record6 type implementation
    // -------------------------------------------------------------------------

    /**
     * Setter for <code>kalaazu.accounts_banks.tax_uridium</code>. Tax rate for uridium.
     */
    public void setTaxUridium(Byte value) {
        set(5, value);
    }

    @Override
    public Record1<Integer> key() {
        return (Record1) super.key();
    }

    @Override
    public Row6<Integer, Integer, Long, Long, Byte, Byte> fieldsRow() {
        return (Row6) super.fieldsRow();
    }

    @Override
    public Row6<Integer, Integer, Long, Long, Byte, Byte> valuesRow() {
        return (Row6) super.valuesRow();
    }

    @Override
    public Field<Integer> field1() {
        return AccountsBanks.ACCOUNTS_BANKS.ID;
    }

    @Override
    public Field<Integer> field2() {
        return AccountsBanks.ACCOUNTS_BANKS.ACCOUNTS_ID;
    }

    @Override
    public Field<Long> field3() {
        return AccountsBanks.ACCOUNTS_BANKS.CREDITS;
    }

    @Override
    public Field<Long> field4() {
        return AccountsBanks.ACCOUNTS_BANKS.URIDIUM;
    }

    @Override
    public Field<Byte> field5() {
        return AccountsBanks.ACCOUNTS_BANKS.TAX_CREDITS;
    }

    @Override
    public Field<Byte> field6() {
        return AccountsBanks.ACCOUNTS_BANKS.TAX_URIDIUM;
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
    public Long component3() {
        return getCredits();
    }

    @Override
    public Long component4() {
        return getUridium();
    }

    @Override
    public Byte component5() {
        return getTaxCredits();
    }

    @Override
    public Byte component6() {
        return getTaxUridium();
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
    public Long value3() {
        return getCredits();
    }

    @Override
    public Long value4() {
        return getUridium();
    }

    @Override
    public Byte value5() {
        return getTaxCredits();
    }

    @Override
    public Byte value6() {
        return getTaxUridium();
    }

    @Override
    public AccountsBanksRecord value1(Integer value) {
        setId(value);
        return this;
    }

    @Override
    public AccountsBanksRecord value2(Integer value) {
        setAccountsId(value);
        return this;
    }

    @Override
    public AccountsBanksRecord value3(Long value) {
        setCredits(value);
        return this;
    }

    @Override
    public AccountsBanksRecord value4(Long value) {
        setUridium(value);
        return this;
    }

    @Override
    public AccountsBanksRecord value5(Byte value) {
        setTaxCredits(value);
        return this;
    }

    // -------------------------------------------------------------------------
    // Constructors
    // -------------------------------------------------------------------------

    @Override
    public AccountsBanksRecord value6(Byte value) {
        setTaxUridium(value);
        return this;
    }

    @Override
    public AccountsBanksRecord values(
            Integer value1, Integer value2, Long value3, Long value4, Byte value5, Byte value6
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
