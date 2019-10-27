/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.tables;


import com.kalaazu.persistence.database.Indexes;
import com.kalaazu.persistence.database.Kalaazu;
import com.kalaazu.persistence.database.Keys;
import com.kalaazu.persistence.database.records.AccountsConfigurationsRecord;
import org.jooq.*;
import org.jooq.impl.DSL;
import org.jooq.impl.TableImpl;

import javax.annotation.processing.Generated;
import java.util.Arrays;
import java.util.List;


/**
 * Configurations of the accounts.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class AccountsConfigurations extends TableImpl<AccountsConfigurationsRecord> {

    /**
     * The reference instance of <code>kalaazu.accounts_configurations</code>
     */
    public static final AccountsConfigurations ACCOUNTS_CONFIGURATIONS = new AccountsConfigurations();
    private static final long serialVersionUID = 1370535135;
    /**
     * The column <code>kalaazu.accounts_configurations.id</code>. Primary Key.
     */
    public final TableField<AccountsConfigurationsRecord, Integer> ID = createField(
            DSL.name("id"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false).identity(true),
            this,
            "Primary Key."
    );
    /**
     * The column <code>kalaazu.accounts_configurations.accounts_hangars_id</code>.
     */
    public final TableField<AccountsConfigurationsRecord, Integer> ACCOUNTS_HANGARS_ID = createField(DSL.name(
            "accounts_hangars_id"), org.jooq.impl.SQLDataType.INTEGER.nullable(false), this, "");
    /**
     * The column <code>kalaazu.accounts_configurations.configuration_id</code>. Configuration ID (1 or 2 (or 3)).
     */
    public final TableField<AccountsConfigurationsRecord, Byte> CONFIGURATION_ID = createField(
            DSL.name("configuration_id"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "1",
                                                     org.jooq.impl.SQLDataType.TINYINT
                                             )),
            this,
            "Configuration ID (1 or 2 (or 3))."
    );
    /**
     * The column <code>kalaazu.accounts_configurations.name</code>.
     */
    public final TableField<AccountsConfigurationsRecord, String> NAME = createField(
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
     * The column <code>kalaazu.accounts_configurations.shield</code>. Shield available in the configuration.
     */
    public final TableField<AccountsConfigurationsRecord, Integer> SHIELD = createField(
            DSL.name("shield"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "0",
                                                     org.jooq.impl.SQLDataType.INTEGER
                                             )),
            this,
            "Shield available in the configuration."
    );
    /**
     * The column <code>kalaazu.accounts_configurations.speed</code>. Speed available in the configuration.
     */
    public final TableField<AccountsConfigurationsRecord, Short> SPEED = createField(
            DSL.name("speed"),
            org.jooq.impl.SQLDataType.SMALLINT.nullable(false)
                                              .defaultValue(org.jooq.impl.DSL.field(
                                                      "0",
                                                      org.jooq.impl.SQLDataType.SMALLINT
                                              )),
            this,
            "Speed available in the configuration."
    );
    /**
     * The column <code>kalaazu.accounts_configurations.damage</code>. Damage available in the configuration.
     */
    public final TableField<AccountsConfigurationsRecord, Integer> DAMAGE = createField(
            DSL.name("damage"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "0",
                                                     org.jooq.impl.SQLDataType.INTEGER
                                             )),
            this,
            "Damage available in the configuration."
    );

    /**
     * Create a <code>kalaazu.accounts_configurations</code> table reference
     */
    public AccountsConfigurations() {
        this(DSL.name("accounts_configurations"), null);
    }

    /**
     * Create an aliased <code>kalaazu.accounts_configurations</code> table reference
     */
    public AccountsConfigurations(String alias) {
        this(DSL.name(alias), ACCOUNTS_CONFIGURATIONS);
    }

    /**
     * Create an aliased <code>kalaazu.accounts_configurations</code> table reference
     */
    public AccountsConfigurations(Name alias) {
        this(alias, ACCOUNTS_CONFIGURATIONS);
    }

    private AccountsConfigurations(Name alias, Table<AccountsConfigurationsRecord> aliased) {
        this(alias, aliased, null);
    }

    private AccountsConfigurations(Name alias, Table<AccountsConfigurationsRecord> aliased, Field<?>[] parameters) {
        super(alias, null, aliased, parameters, DSL.comment("Configurations of the accounts."));
    }

    public <O extends Record> AccountsConfigurations(Table<O> child, ForeignKey<O, AccountsConfigurationsRecord> key) {
        super(child, key, ACCOUNTS_CONFIGURATIONS);
    }

    /**
     * The class holding records for this type
     */
    @Override
    public Class<AccountsConfigurationsRecord> getRecordType() {
        return AccountsConfigurationsRecord.class;
    }

    @Override
    public Schema getSchema() {
        return Kalaazu.KALAAZU;
    }

    @Override
    public List<Index> getIndexes() {
        return Arrays.<Index>asList(
                Indexes.ACCOUNTS_CONFIGURATIONS_ACCOUNTS_CONFIGURATIONS_ACCOUNTS_HANGARS_ID_IDX,
                Indexes.ACCOUNTS_CONFIGURATIONS_PRIMARY
        );
    }

    @Override
    public Identity<AccountsConfigurationsRecord, Integer> getIdentity() {
        return Keys.IDENTITY_ACCOUNTS_CONFIGURATIONS;
    }

    @Override
    public UniqueKey<AccountsConfigurationsRecord> getPrimaryKey() {
        return Keys.KEY_ACCOUNTS_CONFIGURATIONS_PRIMARY;
    }

    @Override
    public List<UniqueKey<AccountsConfigurationsRecord>> getKeys() {
        return Arrays.<UniqueKey<AccountsConfigurationsRecord>>asList(Keys.KEY_ACCOUNTS_CONFIGURATIONS_PRIMARY);
    }

    @Override
    public List<ForeignKey<AccountsConfigurationsRecord, ?>> getReferences() {
        return Arrays.<ForeignKey<AccountsConfigurationsRecord, ?>>asList(Keys.ACCOUNTS_CONFIGURATIONS_ACCOUNTS_HANGARS);
    }

    public AccountsHangars accountsHangars() {
        return new AccountsHangars(this, Keys.ACCOUNTS_CONFIGURATIONS_ACCOUNTS_HANGARS);
    }

    @Override
    public AccountsConfigurations as(String alias) {
        return new AccountsConfigurations(DSL.name(alias), this);
    }

    @Override
    public AccountsConfigurations as(Name alias) {
        return new AccountsConfigurations(alias, this);
    }

    /**
     * Rename this table
     */
    @Override
    public AccountsConfigurations rename(String name) {
        return new AccountsConfigurations(DSL.name(name), null);
    }

    /**
     * Rename this table
     */
    @Override
    public AccountsConfigurations rename(Name name) {
        return new AccountsConfigurations(name, null);
    }

    // -------------------------------------------------------------------------
    // Row7 type methods
    // -------------------------------------------------------------------------

    @Override
    public Row7<Integer, Integer, Byte, String, Integer, Short, Integer> fieldsRow() {
        return (Row7) super.fieldsRow();
    }
}