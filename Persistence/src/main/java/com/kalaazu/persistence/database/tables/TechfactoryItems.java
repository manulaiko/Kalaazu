/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.tables;


import com.kalaazu.persistence.database.Indexes;
import com.kalaazu.persistence.database.Kalaazu;
import com.kalaazu.persistence.database.Keys;
import com.kalaazu.persistence.database.records.TechfactoryItemsRecord;
import org.jooq.*;
import org.jooq.impl.DSL;
import org.jooq.impl.TableImpl;

import javax.annotation.processing.Generated;
import java.util.Arrays;
import java.util.List;


/**
 * Items that can be build in the tech factory.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class TechfactoryItems extends TableImpl<TechfactoryItemsRecord> {

    /**
     * The reference instance of <code>kalaazu.techfactory_items</code>
     */
    public static final TechfactoryItems TECHFACTORY_ITEMS = new TechfactoryItems();
    private static final long serialVersionUID = -218473080;
    /**
     * The column <code>kalaazu.techfactory_items.id</code>. Primary Key.
     */
    public final TableField<TechfactoryItemsRecord, Byte> ID = createField(
            DSL.name("id"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false).identity(true),
            this,
            "Primary Key."
    );
    /**
     * The column <code>kalaazu.techfactory_items.name</code>. Item name.
     */
    public final TableField<TechfactoryItemsRecord, String> NAME = createField(
            DSL.name("name"),
            org.jooq.impl.SQLDataType.VARCHAR(255)
                                     .nullable(false),
            this,
            "Item name."
    );
    /**
     * The column <code>kalaazu.techfactory_items.description</code>. Item description.
     */
    public final TableField<TechfactoryItemsRecord, String> DESCRIPTION = createField(
            DSL.name("description"),
            org.jooq.impl.SQLDataType.CLOB.nullable(false),
            this,
            "Item description."
    );
    /**
     * The column <code>kalaazu.techfactory_items.effect</code>. Effect description.
     */
    public final TableField<TechfactoryItemsRecord, String> EFFECT = createField(
            DSL.name("effect"),
            org.jooq.impl.SQLDataType.CLOB.nullable(false),
            this,
            "Effect description."
    );
    /**
     * The column <code>kalaazu.techfactory_items.duration</code>. Seconds the effect is active.
     */
    public final TableField<TechfactoryItemsRecord, Short> DURATION = createField(
            DSL.name("duration"),
            org.jooq.impl.SQLDataType.SMALLINT.nullable(false)
                                              .defaultValue(org.jooq.impl.DSL.field(
                                                      "900",
                                                      org.jooq.impl.SQLDataType.SMALLINT
                                              )),
            this,
            "Seconds the effect is active."
    );
    /**
     * The column <code>kalaazu.techfactory_items.cooldown</code>. Seconds the effect takes to cooldown.
     */
    public final TableField<TechfactoryItemsRecord, Short> COOLDOWN = createField(
            DSL.name("cooldown"),
            org.jooq.impl.SQLDataType.SMALLINT.nullable(false)
                                              .defaultValue(org.jooq.impl.DSL.field(
                                                      "900",
                                                      org.jooq.impl.SQLDataType.SMALLINT
                                              )),
            this,
            "Seconds the effect takes to cooldown."
    );
    /**
     * The column <code>kalaazu.techfactory_items.time</code>. Seconds it takes to produce the item.
     */
    public final TableField<TechfactoryItemsRecord, Integer> TIME = createField(
            DSL.name("time"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false),
            this,
            "Seconds it takes to produce the item."
    );
    /**
     * The column <code>kalaazu.techfactory_items.free_production</code>. Free production costs.
     */
    public final TableField<TechfactoryItemsRecord, Short> FREE_PRODUCTION = createField(
            DSL.name("free_production"),
            org.jooq.impl.SQLDataType.SMALLINT.nullable(false),
            this,
            "Free production costs."
    );
    /**
     * The column <code>kalaazu.techfactory_items.instant_production</code>. Instant production costs.
     */
    public final TableField<TechfactoryItemsRecord, Short> INSTANT_PRODUCTION = createField(
            DSL.name("instant_production"),
            org.jooq.impl.SQLDataType.SMALLINT.nullable(false),
            this,
            "Instant production costs."
    );

    /**
     * Create a <code>kalaazu.techfactory_items</code> table reference
     */
    public TechfactoryItems() {
        this(DSL.name("techfactory_items"), null);
    }

    /**
     * Create an aliased <code>kalaazu.techfactory_items</code> table reference
     */
    public TechfactoryItems(String alias) {
        this(DSL.name(alias), TECHFACTORY_ITEMS);
    }

    /**
     * Create an aliased <code>kalaazu.techfactory_items</code> table reference
     */
    public TechfactoryItems(Name alias) {
        this(alias, TECHFACTORY_ITEMS);
    }

    private TechfactoryItems(Name alias, Table<TechfactoryItemsRecord> aliased) {
        this(alias, aliased, null);
    }

    private TechfactoryItems(Name alias, Table<TechfactoryItemsRecord> aliased, Field<?>[] parameters) {
        super(alias, null, aliased, parameters, DSL.comment("Items that can be build in the tech factory."));
    }

    public <O extends Record> TechfactoryItems(Table<O> child, ForeignKey<O, TechfactoryItemsRecord> key) {
        super(child, key, TECHFACTORY_ITEMS);
    }

    /**
     * The class holding records for this type
     */
    @Override
    public Class<TechfactoryItemsRecord> getRecordType() {
        return TechfactoryItemsRecord.class;
    }

    @Override
    public Schema getSchema() {
        return Kalaazu.KALAAZU;
    }

    @Override
    public List<Index> getIndexes() {
        return Arrays.<Index>asList(
                Indexes.TECHFACTORY_ITEMS_PRIMARY,
                Indexes.TECHFACTORY_ITEMS_TECHFACTORY_ITEMS_NAME_IDX
        );
    }

    @Override
    public Identity<TechfactoryItemsRecord, Byte> getIdentity() {
        return Keys.IDENTITY_TECHFACTORY_ITEMS;
    }

    @Override
    public UniqueKey<TechfactoryItemsRecord> getPrimaryKey() {
        return Keys.KEY_TECHFACTORY_ITEMS_PRIMARY;
    }

    @Override
    public List<UniqueKey<TechfactoryItemsRecord>> getKeys() {
        return Arrays.<UniqueKey<TechfactoryItemsRecord>>asList(Keys.KEY_TECHFACTORY_ITEMS_PRIMARY);
    }

    @Override
    public TechfactoryItems as(String alias) {
        return new TechfactoryItems(DSL.name(alias), this);
    }

    @Override
    public TechfactoryItems as(Name alias) {
        return new TechfactoryItems(alias, this);
    }

    /**
     * Rename this table
     */
    @Override
    public TechfactoryItems rename(String name) {
        return new TechfactoryItems(DSL.name(name), null);
    }

    /**
     * Rename this table
     */
    @Override
    public TechfactoryItems rename(Name name) {
        return new TechfactoryItems(name, null);
    }

    // -------------------------------------------------------------------------
    // Row9 type methods
    // -------------------------------------------------------------------------

    @Override
    public Row9<Byte, String, String, String, Short, Short, Integer, Short, Short> fieldsRow() {
        return (Row9) super.fieldsRow();
    }
}
