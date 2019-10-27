/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.tables;


import com.kalaazu.persistence.database.Indexes;
import com.kalaazu.persistence.database.Kalaazu;
import com.kalaazu.persistence.database.Keys;
import com.kalaazu.persistence.database.records.SkylabModulesRecord;
import org.jooq.*;
import org.jooq.impl.DSL;
import org.jooq.impl.TableImpl;

import javax.annotation.processing.Generated;
import java.util.Arrays;
import java.util.List;


/**
 * Different skylab modules.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class SkylabModules extends TableImpl<SkylabModulesRecord> {

    /**
     * The reference instance of <code>kalaazu.skylab_modules</code>
     */
    public static final SkylabModules SKYLAB_MODULES = new SkylabModules();
    private static final long serialVersionUID = -599197314;
    /**
     * The column <code>kalaazu.skylab_modules.id</code>. Primary Key.
     */
    public final TableField<SkylabModulesRecord, Byte> ID = createField(
            DSL.name("id"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false)
                                             .identity(true),
            this,
            "Primary Key."
    );
    /**
     * The column <code>kalaazu.skylab_modules.name</code>. Module name.
     */
    public final TableField<SkylabModulesRecord, String> NAME = createField(
            DSL.name("name"),
            org.jooq.impl.SQLDataType.VARCHAR(255)
                                     .nullable(false)
                                     .defaultValue(org.jooq.impl.DSL.field(
                                             "",
                                             org.jooq.impl.SQLDataType.VARCHAR
                                     )),
            this,
            "Module name."
    );
    /**
     * The column <code>kalaazu.skylab_modules.production_factor</code>. Production factor.
     */
    public final TableField<SkylabModulesRecord, Byte> PRODUCTION_FACTOR = createField(
            DSL.name("production_factor"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "20",
                                                     org.jooq.impl.SQLDataType.TINYINT
                                             )),
            this,
            "Production factor."
    );
    /**
     * The column <code>kalaazu.skylab_modules.production_base</code>. Production base.
     */
    public final TableField<SkylabModulesRecord, Short> PRODUCTION_BASE = createField(
            DSL.name("production_base"),
            org.jooq.impl.SQLDataType.SMALLINT.nullable(false)
                                              .defaultValue(org.jooq.impl.DSL.field(
                                                      "1000",
                                                      org.jooq.impl.SQLDataType.SMALLINT
                                              )),
            this,
            "Production base."
    );
    /**
     * The column <code>kalaazu.skylab_modules.storage_factor</code>. Storage factor.
     */
    public final TableField<SkylabModulesRecord, Short> STORAGE_FACTOR = createField(
            DSL.name("storage_factor"),
            org.jooq.impl.SQLDataType.SMALLINT.nullable(false)
                                              .defaultValue(org.jooq.impl.DSL.field(
                                                      "50",
                                                      org.jooq.impl.SQLDataType.SMALLINT
                                              )),
            this,
            "Storage factor."
    );
    /**
     * The column <code>kalaazu.skylab_modules.storage_base</code>. Storage base.
     */
    public final TableField<SkylabModulesRecord, Short> STORAGE_BASE = createField(
            DSL.name("storage_base"),
            org.jooq.impl.SQLDataType.SMALLINT.nullable(false)
                                              .defaultValue(org.jooq.impl.DSL.field(
                                                      "20000",
                                                      org.jooq.impl.SQLDataType.SMALLINT
                                              )),
            this,
            "Storage base."
    );
    /**
     * The column <code>kalaazu.skylab_modules.upgrade_factor</code>. Upgrade costs factor.
     */
    public final TableField<SkylabModulesRecord, Byte> UPGRADE_FACTOR = createField(
            DSL.name("upgrade_factor"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "35",
                                                     org.jooq.impl.SQLDataType.TINYINT
                                             )),
            this,
            "Upgrade costs factor."
    );
    /**
     * The column <code>kalaazu.skylab_modules.upgrade_base</code>. Upgrade costs base.
     */
    public final TableField<SkylabModulesRecord, Short> UPGRADE_BASE = createField(
            DSL.name("upgrade_base"),
            org.jooq.impl.SQLDataType.SMALLINT.nullable(false)
                                              .defaultValue(org.jooq.impl.DSL.field(
                                                      "5000",
                                                      org.jooq.impl.SQLDataType.SMALLINT
                                              )),
            this,
            "Upgrade costs base."
    );
    /**
     * The column <code>kalaazu.skylab_modules.energy_factor</code>. Energy consumption factor.
     */
    public final TableField<SkylabModulesRecord, Byte> ENERGY_FACTOR = createField(
            DSL.name("energy_factor"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "10",
                                                     org.jooq.impl.SQLDataType.TINYINT
                                             )),
            this,
            "Energy consumption factor."
    );
    /**
     * The column <code>kalaazu.skylab_modules.energy_base</code>. Energy consumption base.
     */
    public final TableField<SkylabModulesRecord, Byte> ENERGY_BASE = createField(
            DSL.name("energy_base"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "10",
                                                     org.jooq.impl.SQLDataType.TINYINT
                                             )),
            this,
            "Energy consumption base."
    );

    /**
     * Create a <code>kalaazu.skylab_modules</code> table reference
     */
    public SkylabModules() {
        this(DSL.name("skylab_modules"), null);
    }

    /**
     * Create an aliased <code>kalaazu.skylab_modules</code> table reference
     */
    public SkylabModules(String alias) {
        this(DSL.name(alias), SKYLAB_MODULES);
    }

    /**
     * Create an aliased <code>kalaazu.skylab_modules</code> table reference
     */
    public SkylabModules(Name alias) {
        this(alias, SKYLAB_MODULES);
    }

    private SkylabModules(Name alias, Table<SkylabModulesRecord> aliased) {
        this(alias, aliased, null);
    }

    private SkylabModules(Name alias, Table<SkylabModulesRecord> aliased, Field<?>[] parameters) {
        super(alias, null, aliased, parameters, DSL.comment("Different skylab modules."));
    }

    public <O extends Record> SkylabModules(Table<O> child, ForeignKey<O, SkylabModulesRecord> key) {
        super(child, key, SKYLAB_MODULES);
    }

    /**
     * The class holding records for this type
     */
    @Override
    public Class<SkylabModulesRecord> getRecordType() {
        return SkylabModulesRecord.class;
    }

    @Override
    public Schema getSchema() {
        return Kalaazu.KALAAZU;
    }

    @Override
    public List<Index> getIndexes() {
        return Arrays.<Index>asList(Indexes.SKYLAB_MODULES_PRIMARY, Indexes.SKYLAB_MODULES_SKYLAB_MODULES_NAME_IDX);
    }

    @Override
    public Identity<SkylabModulesRecord, Byte> getIdentity() {
        return Keys.IDENTITY_SKYLAB_MODULES;
    }

    @Override
    public UniqueKey<SkylabModulesRecord> getPrimaryKey() {
        return Keys.KEY_SKYLAB_MODULES_PRIMARY;
    }

    @Override
    public List<UniqueKey<SkylabModulesRecord>> getKeys() {
        return Arrays.<UniqueKey<SkylabModulesRecord>>asList(Keys.KEY_SKYLAB_MODULES_PRIMARY);
    }

    @Override
    public SkylabModules as(String alias) {
        return new SkylabModules(DSL.name(alias), this);
    }

    @Override
    public SkylabModules as(Name alias) {
        return new SkylabModules(alias, this);
    }

    /**
     * Rename this table
     */
    @Override
    public SkylabModules rename(String name) {
        return new SkylabModules(DSL.name(name), null);
    }

    /**
     * Rename this table
     */
    @Override
    public SkylabModules rename(Name name) {
        return new SkylabModules(name, null);
    }

    // -------------------------------------------------------------------------
    // Row10 type methods
    // -------------------------------------------------------------------------

    @Override
    public Row10<Byte, String, Byte, Short, Short, Short, Byte, Short, Byte, Byte> fieldsRow() {
        return (Row10) super.fieldsRow();
    }
}