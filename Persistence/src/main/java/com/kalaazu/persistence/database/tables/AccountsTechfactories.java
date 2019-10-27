/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.tables;


import com.kalaazu.persistence.database.Indexes;
import com.kalaazu.persistence.database.Kalaazu;
import com.kalaazu.persistence.database.Keys;
import com.kalaazu.persistence.database.records.AccountsTechfactoriesRecord;
import org.jooq.*;
import org.jooq.impl.DSL;
import org.jooq.impl.TableImpl;

import javax.annotation.processing.Generated;
import java.util.Arrays;
import java.util.List;


/**
 * Nanotech factory items.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class AccountsTechfactories extends TableImpl<AccountsTechfactoriesRecord> {

    /**
     * The reference instance of <code>kalaazu.accounts_techfactories</code>
     */
    public static final AccountsTechfactories ACCOUNTS_TECHFACTORIES = new AccountsTechfactories();
    private static final long serialVersionUID = 1070957437;
    /**
     * The column <code>kalaazu.accounts_techfactories.id</code>. Primary Key.
     */
    public final TableField<AccountsTechfactoriesRecord, Integer> ID = createField(
            DSL.name("id"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false).identity(true),
            this,
            "Primary Key."
    );
    /**
     * The column <code>kalaazu.accounts_techfactories.accounts_id</code>. Account ID.
     */
    public final TableField<AccountsTechfactoriesRecord, Integer> ACCOUNTS_ID = createField(
            DSL.name("accounts_id"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false),
            this,
            "Account ID."
    );
    /**
     * The column <code>kalaazu.accounts_techfactories.slot_unlock_price</code>. Price for unlocking a slot.
     */
    public final TableField<AccountsTechfactoriesRecord, Integer> SLOT_UNLOCK_PRICE = createField(
            DSL.name("slot_unlock_price"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "50000",
                                                     org.jooq.impl.SQLDataType.INTEGER
                                             )),
            this,
            "Price for unlocking a slot."
    );
    /**
     * The column <code>kalaazu.accounts_techfactories.slot_unlock_factor</code>. Factor for unlocking a slot.
     */
    public final TableField<AccountsTechfactoriesRecord, Byte> SLOT_UNLOCK_FACTOR = createField(
            DSL.name("slot_unlock_factor"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "2",
                                                     org.jooq.impl.SQLDataType.TINYINT
                                             )),
            this,
            "Factor for unlocking a slot."
    );
    /**
     * The column <code>kalaazu.accounts_techfactories.slots</code>. Unlocked slots.
     */
    public final TableField<AccountsTechfactoriesRecord, Byte> SLOTS = createField(
            DSL.name("slots"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "1",
                                                     org.jooq.impl.SQLDataType.TINYINT
                                             )),
            this,
            "Unlocked slots."
    );

    /**
     * Create a <code>kalaazu.accounts_techfactories</code> table reference
     */
    public AccountsTechfactories() {
        this(DSL.name("accounts_techfactories"), null);
    }

    /**
     * Create an aliased <code>kalaazu.accounts_techfactories</code> table reference
     */
    public AccountsTechfactories(String alias) {
        this(DSL.name(alias), ACCOUNTS_TECHFACTORIES);
    }

    /**
     * Create an aliased <code>kalaazu.accounts_techfactories</code> table reference
     */
    public AccountsTechfactories(Name alias) {
        this(alias, ACCOUNTS_TECHFACTORIES);
    }

    private AccountsTechfactories(Name alias, Table<AccountsTechfactoriesRecord> aliased) {
        this(alias, aliased, null);
    }

    private AccountsTechfactories(Name alias, Table<AccountsTechfactoriesRecord> aliased, Field<?>[] parameters) {
        super(alias, null, aliased, parameters, DSL.comment("Nanotech factory items."));
    }

    public <O extends Record> AccountsTechfactories(Table<O> child, ForeignKey<O, AccountsTechfactoriesRecord> key) {
        super(child, key, ACCOUNTS_TECHFACTORIES);
    }

    /**
     * The class holding records for this type
     */
    @Override
    public Class<AccountsTechfactoriesRecord> getRecordType() {
        return AccountsTechfactoriesRecord.class;
    }

    @Override
    public Schema getSchema() {
        return Kalaazu.KALAAZU;
    }

    @Override
    public List<Index> getIndexes() {
        return Arrays.<Index>asList(
                Indexes.ACCOUNTS_TECHFACTORIES_ACCOUNTS_TECHFACTORIES_ACCOUNTS,
                Indexes.ACCOUNTS_TECHFACTORIES_PRIMARY
        );
    }

    @Override
    public Identity<AccountsTechfactoriesRecord, Integer> getIdentity() {
        return Keys.IDENTITY_ACCOUNTS_TECHFACTORIES;
    }

    @Override
    public UniqueKey<AccountsTechfactoriesRecord> getPrimaryKey() {
        return Keys.KEY_ACCOUNTS_TECHFACTORIES_PRIMARY;
    }

    @Override
    public List<UniqueKey<AccountsTechfactoriesRecord>> getKeys() {
        return Arrays.<UniqueKey<AccountsTechfactoriesRecord>>asList(Keys.KEY_ACCOUNTS_TECHFACTORIES_PRIMARY);
    }

    @Override
    public List<ForeignKey<AccountsTechfactoriesRecord, ?>> getReferences() {
        return Arrays.<ForeignKey<AccountsTechfactoriesRecord, ?>>asList(Keys.ACCOUNTS_TECHFACTORIES_ACCOUNTS);
    }

    public Accounts accounts() {
        return new Accounts(this, Keys.ACCOUNTS_TECHFACTORIES_ACCOUNTS);
    }

    @Override
    public AccountsTechfactories as(String alias) {
        return new AccountsTechfactories(DSL.name(alias), this);
    }

    @Override
    public AccountsTechfactories as(Name alias) {
        return new AccountsTechfactories(alias, this);
    }

    /**
     * Rename this table
     */
    @Override
    public AccountsTechfactories rename(String name) {
        return new AccountsTechfactories(DSL.name(name), null);
    }

    /**
     * Rename this table
     */
    @Override
    public AccountsTechfactories rename(Name name) {
        return new AccountsTechfactories(name, null);
    }

    // -------------------------------------------------------------------------
    // Row5 type methods
    // -------------------------------------------------------------------------

    @Override
    public Row5<Integer, Integer, Integer, Byte, Byte> fieldsRow() {
        return (Row5) super.fieldsRow();
    }
}