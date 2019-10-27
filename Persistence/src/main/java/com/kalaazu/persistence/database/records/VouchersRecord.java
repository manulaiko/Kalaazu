/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.records;


import com.kalaazu.persistence.database.tables.Vouchers;
import org.jooq.Field;
import org.jooq.Record1;
import org.jooq.Record3;
import org.jooq.Row3;
import org.jooq.impl.UpdatableRecordImpl;

import javax.annotation.processing.Generated;


/**
 * Voucher codes.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class VouchersRecord extends UpdatableRecordImpl<VouchersRecord> implements Record3<Short, String, Byte> {

    private static final long serialVersionUID = 784427242;

    /**
     * Create a detached VouchersRecord
     */
    public VouchersRecord() {
        super(Vouchers.VOUCHERS);
    }

    /**
     * Create a detached, initialised VouchersRecord
     */
    public VouchersRecord(Short id, String code, Byte limit) {
        super(Vouchers.VOUCHERS);

        set(0, id);
        set(1, code);
        set(2, limit);
    }

    /**
     * Getter for <code>kalaazu.vouchers.id</code>. Primary Key.
     */
    public Short getId() {
        return (Short) get(0);
    }

    /**
     * Setter for <code>kalaazu.vouchers.id</code>. Primary Key.
     */
    public void setId(Short value) {
        set(0, value);
    }

    /**
     * Getter for <code>kalaazu.vouchers.code</code>.
     */
    public String getCode() {
        return (String) get(1);
    }

    /**
     * Setter for <code>kalaazu.vouchers.code</code>.
     */
    public void setCode(String value) {
        set(1, value);
    }

    // -------------------------------------------------------------------------
    // Primary key information
    // -------------------------------------------------------------------------

    /**
     * Getter for <code>kalaazu.vouchers.limit</code>.
     */
    public Byte getLimit() {
        return (Byte) get(2);
    }

    // -------------------------------------------------------------------------
    // Record3 type implementation
    // -------------------------------------------------------------------------

    /**
     * Setter for <code>kalaazu.vouchers.limit</code>.
     */
    public void setLimit(Byte value) {
        set(2, value);
    }

    @Override
    public Record1<Short> key() {
        return (Record1) super.key();
    }

    @Override
    public Row3<Short, String, Byte> fieldsRow() {
        return (Row3) super.fieldsRow();
    }

    @Override
    public Row3<Short, String, Byte> valuesRow() {
        return (Row3) super.valuesRow();
    }

    @Override
    public Field<Short> field1() {
        return Vouchers.VOUCHERS.ID;
    }

    @Override
    public Field<String> field2() {
        return Vouchers.VOUCHERS.CODE;
    }

    @Override
    public Field<Byte> field3() {
        return Vouchers.VOUCHERS.LIMIT;
    }

    @Override
    public Short component1() {
        return getId();
    }

    @Override
    public String component2() {
        return getCode();
    }

    @Override
    public Byte component3() {
        return getLimit();
    }

    @Override
    public Short value1() {
        return getId();
    }

    @Override
    public String value2() {
        return getCode();
    }

    @Override
    public Byte value3() {
        return getLimit();
    }

    @Override
    public VouchersRecord value1(Short value) {
        setId(value);
        return this;
    }

    @Override
    public VouchersRecord value2(String value) {
        setCode(value);
        return this;
    }

    // -------------------------------------------------------------------------
    // Constructors
    // -------------------------------------------------------------------------

    @Override
    public VouchersRecord value3(Byte value) {
        setLimit(value);
        return this;
    }

    @Override
    public VouchersRecord values(Short value1, String value2, Byte value3) {
        value1(value1);
        value2(value2);
        value3(value3);
        return this;
    }
}