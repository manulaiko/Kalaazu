/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.tables;


import com.kalaazu.persistence.database.Indexes;
import com.kalaazu.persistence.database.Kalaazu;
import com.kalaazu.persistence.database.Keys;
import com.kalaazu.persistence.database.records.AccountsPetsRecord;
import org.jooq.*;
import org.jooq.impl.DSL;
import org.jooq.impl.TableImpl;

import javax.annotation.processing.Generated;
import java.util.Arrays;
import java.util.List;


/**
 * Account's PETs.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class AccountsPets extends TableImpl<AccountsPetsRecord> {

    /**
     * The reference instance of <code>kalaazu.accounts_pets</code>
     */
    public static final AccountsPets ACCOUNTS_PETS = new AccountsPets();
    private static final long serialVersionUID = 11583818;
    /**
     * The column <code>kalaazu.accounts_pets.id</code>. Primary Key.
     */
    public final TableField<AccountsPetsRecord, Integer> ID = createField(
            DSL.name("id"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false).identity(true),
            this,
            "Primary Key."
    );
    /**
     * The column <code>kalaazu.accounts_pets.accounts_id</code>.
     */
    public final TableField<AccountsPetsRecord, Integer> ACCOUNTS_ID = createField(
            DSL.name("accounts_id"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false),
            this,
            ""
    );
    /**
     * The column <code>kalaazu.accounts_pets.levels_id</code>.
     */
    public final TableField<AccountsPetsRecord, Byte> LEVELS_ID = createField(
            DSL.name("levels_id"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "1",
                                                     org.jooq.impl.SQLDataType.TINYINT
                                             )),
            this,
            ""
    );
    /**
     * The column <code>kalaazu.accounts_pets.name</code>.
     */
    public final TableField<AccountsPetsRecord, String> NAME = createField(
            DSL.name("name"),
            org.jooq.impl.SQLDataType.VARCHAR(255)
                                     .nullable(false)
                                     .defaultValue(org.jooq.impl.DSL.field(
                                             "",
                                             org.jooq.impl.SQLDataType.VARCHAR
                                     )),
            this,
            ""
    );
    /**
     * The column <code>kalaazu.accounts_pets.experience</code>.
     */
    public final TableField<AccountsPetsRecord, Integer> EXPERIENCE = createField(
            DSL.name("experience"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "0",
                                                     org.jooq.impl.SQLDataType.INTEGER
                                             )),
            this,
            ""
    );
    /**
     * The column <code>kalaazu.accounts_pets.fuel</code>.
     */
    public final TableField<AccountsPetsRecord, Integer> FUEL = createField(
            DSL.name("fuel"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "0",
                                                     org.jooq.impl.SQLDataType.INTEGER
                                             )),
            this,
            ""
    );
    /**
     * The column <code>kalaazu.accounts_pets.health</code>.
     */
    public final TableField<AccountsPetsRecord, Integer> HEALTH = createField(
            DSL.name("health"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "0",
                                                     org.jooq.impl.SQLDataType.INTEGER
                                             )),
            this,
            ""
    );
    /**
     * The column <code>kalaazu.accounts_pets.slots_lasers_total</code>.
     */
    public final TableField<AccountsPetsRecord, Byte> SLOTS_LASERS_TOTAL = createField(
            DSL.name("slots_lasers_total"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false),
            this,
            ""
    );
    /**
     * The column <code>kalaazu.accounts_pets.slots_lasers_available</code>.
     */
    public final TableField<AccountsPetsRecord, Byte> SLOTS_LASERS_AVAILABLE = createField(DSL.name(
            "slots_lasers_available"), org.jooq.impl.SQLDataType.TINYINT.nullable(false), this, "");
    /**
     * The column <code>kalaazu.accounts_pets.slots_generators_total</code>.
     */
    public final TableField<AccountsPetsRecord, Byte> SLOTS_GENERATORS_TOTAL = createField(DSL.name(
            "slots_generators_total"), org.jooq.impl.SQLDataType.TINYINT.nullable(false), this, "");
    /**
     * The column <code>kalaazu.accounts_pets.slots_generators_available</code>.
     */
    public final TableField<AccountsPetsRecord, Byte> SLOTS_GENERATORS_AVAILABLE = createField(DSL.name(
            "slots_generators_available"), org.jooq.impl.SQLDataType.TINYINT.nullable(false), this, "");
    /**
     * The column <code>kalaazu.accounts_pets.slots_protocols_total</code>.
     */
    public final TableField<AccountsPetsRecord, Byte> SLOTS_PROTOCOLS_TOTAL = createField(DSL.name(
            "slots_protocols_total"), org.jooq.impl.SQLDataType.TINYINT.nullable(false), this, "");
    /**
     * The column <code>kalaazu.accounts_pets.slots_protocols_available</code>.
     */
    public final TableField<AccountsPetsRecord, Byte> SLOTS_PROTOCOLS_AVAILABLE = createField(DSL.name(
            "slots_protocols_available"), org.jooq.impl.SQLDataType.TINYINT.nullable(false), this, "");
    /**
     * The column <code>kalaazu.accounts_pets.slots_gears_total</code>.
     */
    public final TableField<AccountsPetsRecord, Byte> SLOTS_GEARS_TOTAL = createField(
            DSL.name("slots_gears_total"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false),
            this,
            ""
    );
    /**
     * The column <code>kalaazu.accounts_pets.slots_gears_available</code>.
     */
    public final TableField<AccountsPetsRecord, Byte> SLOTS_GEARS_AVAILABLE = createField(DSL.name(
            "slots_gears_available"), org.jooq.impl.SQLDataType.TINYINT.nullable(false), this, "");

    /**
     * Create a <code>kalaazu.accounts_pets</code> table reference
     */
    public AccountsPets() {
        this(DSL.name("accounts_pets"), null);
    }

    /**
     * Create an aliased <code>kalaazu.accounts_pets</code> table reference
     */
    public AccountsPets(String alias) {
        this(DSL.name(alias), ACCOUNTS_PETS);
    }

    /**
     * Create an aliased <code>kalaazu.accounts_pets</code> table reference
     */
    public AccountsPets(Name alias) {
        this(alias, ACCOUNTS_PETS);
    }

    private AccountsPets(Name alias, Table<AccountsPetsRecord> aliased) {
        this(alias, aliased, null);
    }

    private AccountsPets(Name alias, Table<AccountsPetsRecord> aliased, Field<?>[] parameters) {
        super(alias, null, aliased, parameters, DSL.comment("Account's PETs."));
    }

    public <O extends Record> AccountsPets(Table<O> child, ForeignKey<O, AccountsPetsRecord> key) {
        super(child, key, ACCOUNTS_PETS);
    }

    /**
     * The class holding records for this type
     */
    @Override
    public Class<AccountsPetsRecord> getRecordType() {
        return AccountsPetsRecord.class;
    }

    @Override
    public Schema getSchema() {
        return Kalaazu.KALAAZU;
    }

    @Override
    public List<Index> getIndexes() {
        return Arrays.<Index>asList(
                Indexes.ACCOUNTS_PETS_ACCOUNTS_PETS_ACCOUNTS_ID_IDX,
                Indexes.ACCOUNTS_PETS_ACCOUNTS_PETS_LEVELS,
                Indexes.ACCOUNTS_PETS_PRIMARY
        );
    }

    @Override
    public Identity<AccountsPetsRecord, Integer> getIdentity() {
        return Keys.IDENTITY_ACCOUNTS_PETS;
    }

    @Override
    public UniqueKey<AccountsPetsRecord> getPrimaryKey() {
        return Keys.KEY_ACCOUNTS_PETS_PRIMARY;
    }

    @Override
    public List<UniqueKey<AccountsPetsRecord>> getKeys() {
        return Arrays.<UniqueKey<AccountsPetsRecord>>asList(
                Keys.KEY_ACCOUNTS_PETS_PRIMARY,
                Keys.KEY_ACCOUNTS_PETS_ACCOUNTS_PETS_ACCOUNTS_ID_IDX
        );
    }

    @Override
    public List<ForeignKey<AccountsPetsRecord, ?>> getReferences() {
        return Arrays.<ForeignKey<AccountsPetsRecord, ?>>asList(Keys.ACCOUNTS_PETS_ACCOUNTS, Keys.ACCOUNTS_PETS_LEVELS);
    }

    public Accounts accounts() {
        return new Accounts(this, Keys.ACCOUNTS_PETS_ACCOUNTS);
    }

    public Levels levels() {
        return new Levels(this, Keys.ACCOUNTS_PETS_LEVELS);
    }

    @Override
    public AccountsPets as(String alias) {
        return new AccountsPets(DSL.name(alias), this);
    }

    @Override
    public AccountsPets as(Name alias) {
        return new AccountsPets(alias, this);
    }

    /**
     * Rename this table
     */
    @Override
    public AccountsPets rename(String name) {
        return new AccountsPets(DSL.name(name), null);
    }

    /**
     * Rename this table
     */
    @Override
    public AccountsPets rename(Name name) {
        return new AccountsPets(name, null);
    }

    // -------------------------------------------------------------------------
    // Row15 type methods
    // -------------------------------------------------------------------------

    @Override
    public Row15<Integer, Integer, Byte, String, Integer, Integer, Integer, Byte, Byte, Byte, Byte, Byte, Byte, Byte, Byte> fieldsRow() {
        return (Row15) super.fieldsRow();
    }
}
