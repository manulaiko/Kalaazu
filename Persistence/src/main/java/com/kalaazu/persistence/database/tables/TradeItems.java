/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.tables;


import com.kalaazu.persistence.database.Indexes;
import com.kalaazu.persistence.database.Kalaazu;
import com.kalaazu.persistence.database.Keys;
import com.kalaazu.persistence.database.records.TradeItemsRecord;
import org.jooq.*;
import org.jooq.impl.DSL;
import org.jooq.impl.TableImpl;

import javax.annotation.processing.Generated;
import java.util.Arrays;
import java.util.List;


/**
 * Trade items.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class TradeItems extends TableImpl<TradeItemsRecord> {

    /**
     * The reference instance of <code>kalaazu.trade_items</code>
     */
    public static final TradeItems TRADE_ITEMS = new TradeItems();
    private static final long serialVersionUID = -856986453;
    /**
     * The column <code>kalaazu.trade_items.id</code>. Primary Key.
     */
    public final TableField<TradeItemsRecord, Short> ID = createField(
            DSL.name("id"),
            org.jooq.impl.SQLDataType.SMALLINT.nullable(false)
                                              .identity(true),
            this,
            "Primary Key."
    );
    /**
     * The column <code>kalaazu.trade_items.items_id</code>.
     */
    public final TableField<TradeItemsRecord, Short> ITEMS_ID = createField(
            DSL.name("items_id"),
            org.jooq.impl.SQLDataType.SMALLINT.nullable(false),
            this,
            ""
    );
    /**
     * The column <code>kalaazu.trade_items.accounts_id</code>.
     */
    public final TableField<TradeItemsRecord, Integer> ACCOUNTS_ID = createField(
            DSL.name("accounts_id"),
            org.jooq.impl.SQLDataType.INTEGER,
            this,
            ""
    );
    /**
     * The column <code>kalaazu.trade_items.price</code>.
     */
    public final TableField<TradeItemsRecord, Integer> PRICE = createField(
            DSL.name("price"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "0",
                                                     org.jooq.impl.SQLDataType.INTEGER
                                             )),
            this,
            ""
    );
    /**
     * The column <code>kalaazu.trade_items.type</code>. 0 = hourly, 1 = daily, 3 = weekly
     */
    public final TableField<TradeItemsRecord, Byte> TYPE = createField(
            DSL.name("type"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "0",
                                                     org.jooq.impl.SQLDataType.TINYINT
                                             )),
            this,
            "0 = hourly, 1 = daily, 3 = weekly"
    );

    /**
     * Create a <code>kalaazu.trade_items</code> table reference
     */
    public TradeItems() {
        this(DSL.name("trade_items"), null);
    }

    /**
     * Create an aliased <code>kalaazu.trade_items</code> table reference
     */
    public TradeItems(String alias) {
        this(DSL.name(alias), TRADE_ITEMS);
    }

    /**
     * Create an aliased <code>kalaazu.trade_items</code> table reference
     */
    public TradeItems(Name alias) {
        this(alias, TRADE_ITEMS);
    }

    private TradeItems(Name alias, Table<TradeItemsRecord> aliased) {
        this(alias, aliased, null);
    }

    private TradeItems(Name alias, Table<TradeItemsRecord> aliased, Field<?>[] parameters) {
        super(alias, null, aliased, parameters, DSL.comment("Trade items."));
    }

    public <O extends Record> TradeItems(Table<O> child, ForeignKey<O, TradeItemsRecord> key) {
        super(child, key, TRADE_ITEMS);
    }

    /**
     * The class holding records for this type
     */
    @Override
    public Class<TradeItemsRecord> getRecordType() {
        return TradeItemsRecord.class;
    }

    @Override
    public Schema getSchema() {
        return Kalaazu.KALAAZU;
    }

    @Override
    public List<Index> getIndexes() {
        return Arrays.<Index>asList(
                Indexes.TRADE_ITEMS_PRIMARY,
                Indexes.TRADE_ITEMS_TRADE_ITEMS_ACCOUNTS_ID_IDX,
                Indexes.TRADE_ITEMS_TRADE_ITEMS_ITEMS_ID_IDX,
                Indexes.TRADE_ITEMS_TRADE_ITEMS_TYPE_IDX
        );
    }

    @Override
    public Identity<TradeItemsRecord, Short> getIdentity() {
        return Keys.IDENTITY_TRADE_ITEMS;
    }

    @Override
    public UniqueKey<TradeItemsRecord> getPrimaryKey() {
        return Keys.KEY_TRADE_ITEMS_PRIMARY;
    }

    @Override
    public List<UniqueKey<TradeItemsRecord>> getKeys() {
        return Arrays.<UniqueKey<TradeItemsRecord>>asList(Keys.KEY_TRADE_ITEMS_PRIMARY);
    }

    @Override
    public List<ForeignKey<TradeItemsRecord, ?>> getReferences() {
        return Arrays.<ForeignKey<TradeItemsRecord, ?>>asList(Keys.TRADE_ITEMS_ITEMS, Keys.TRADE_ITEMS_ACCOUNTS);
    }

    public Items items() {
        return new Items(this, Keys.TRADE_ITEMS_ITEMS);
    }

    public Accounts accounts() {
        return new Accounts(this, Keys.TRADE_ITEMS_ACCOUNTS);
    }

    @Override
    public TradeItems as(String alias) {
        return new TradeItems(DSL.name(alias), this);
    }

    @Override
    public TradeItems as(Name alias) {
        return new TradeItems(alias, this);
    }

    /**
     * Rename this table
     */
    @Override
    public TradeItems rename(String name) {
        return new TradeItems(DSL.name(name), null);
    }

    /**
     * Rename this table
     */
    @Override
    public TradeItems rename(Name name) {
        return new TradeItems(name, null);
    }

    // -------------------------------------------------------------------------
    // Row5 type methods
    // -------------------------------------------------------------------------

    @Override
    public Row5<Short, Short, Integer, Integer, Byte> fieldsRow() {
        return (Row5) super.fieldsRow();
    }
}
