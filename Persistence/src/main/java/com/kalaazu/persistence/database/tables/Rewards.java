/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.tables;


import com.kalaazu.persistence.database.Indexes;
import com.kalaazu.persistence.database.Kalaazu;
import com.kalaazu.persistence.database.Keys;
import com.kalaazu.persistence.database.records.RewardsRecord;
import org.jooq.*;
import org.jooq.impl.DSL;
import org.jooq.impl.TableImpl;

import javax.annotation.processing.Generated;
import java.util.Arrays;
import java.util.List;


/**
 * All rewards available so there's no need of JSON.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class Rewards extends TableImpl<RewardsRecord> {

    /**
     * The reference instance of <code>kalaazu.rewards</code>
     */
    public static final Rewards REWARDS = new Rewards();
    private static final long serialVersionUID = -103487574;
    /**
     * The column <code>kalaazu.rewards.id</code>. Primary Key.
     */
    public final TableField<RewardsRecord, Short> ID = createField(
            DSL.name("id"),
            org.jooq.impl.SQLDataType.SMALLINT.nullable(false)
                                              .identity(true),
            this,
            "Primary Key."
    );
    /**
     * The column <code>kalaazu.rewards.items_id</code>. Item to award.
     */
    public final TableField<RewardsRecord, Short> ITEMS_ID = createField(
            DSL.name("items_id"),
            org.jooq.impl.SQLDataType.SMALLINT.nullable(false),
            this,
            "Item to award."
    );
    /**
     * The column <code>kalaazu.rewards.amount</code>. Amount of items to award.
     */
    public final TableField<RewardsRecord, Integer> AMOUNT = createField(
            DSL.name("amount"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false),
            this,
            "Amount of items to award."
    );
    /**
     * The column <code>kalaazu.rewards.probability</code>. Probability of awarding this item
     */
    public final TableField<RewardsRecord, Double> PROBABILITY = createField(
            DSL.name("probability"),
            org.jooq.impl.SQLDataType.FLOAT.nullable(false)
                                           .defaultValue(org.jooq.impl.DSL.field(
                                                   "100",
                                                   org.jooq.impl.SQLDataType.FLOAT
                                           )),
            this,
            "Probability of awarding this item"
    );
    /**
     * The column <code>kalaazu.rewards.comment</code>. Comment of the reward.
     */
    public final TableField<RewardsRecord, String> COMMENT = createField(
            DSL.name("comment"),
            org.jooq.impl.SQLDataType.VARCHAR(255),
            this,
            "Comment of the reward."
    );

    /**
     * Create a <code>kalaazu.rewards</code> table reference
     */
    public Rewards() {
        this(DSL.name("rewards"), null);
    }

    /**
     * Create an aliased <code>kalaazu.rewards</code> table reference
     */
    public Rewards(String alias) {
        this(DSL.name(alias), REWARDS);
    }

    /**
     * Create an aliased <code>kalaazu.rewards</code> table reference
     */
    public Rewards(Name alias) {
        this(alias, REWARDS);
    }

    private Rewards(Name alias, Table<RewardsRecord> aliased) {
        this(alias, aliased, null);
    }

    private Rewards(Name alias, Table<RewardsRecord> aliased, Field<?>[] parameters) {
        super(alias, null, aliased, parameters, DSL.comment("All rewards available so there's no need of JSON."));
    }

    public <O extends Record> Rewards(Table<O> child, ForeignKey<O, RewardsRecord> key) {
        super(child, key, REWARDS);
    }

    /**
     * The class holding records for this type
     */
    @Override
    public Class<RewardsRecord> getRecordType() {
        return RewardsRecord.class;
    }

    @Override
    public Schema getSchema() {
        return Kalaazu.KALAAZU;
    }

    @Override
    public List<Index> getIndexes() {
        return Arrays.<Index>asList(Indexes.REWARDS_PRIMARY, Indexes.REWARDS_REWARDS_ITEMS_ID);
    }

    @Override
    public Identity<RewardsRecord, Short> getIdentity() {
        return Keys.IDENTITY_REWARDS;
    }

    @Override
    public UniqueKey<RewardsRecord> getPrimaryKey() {
        return Keys.KEY_REWARDS_PRIMARY;
    }

    @Override
    public List<UniqueKey<RewardsRecord>> getKeys() {
        return Arrays.<UniqueKey<RewardsRecord>>asList(Keys.KEY_REWARDS_PRIMARY);
    }

    @Override
    public List<ForeignKey<RewardsRecord, ?>> getReferences() {
        return Arrays.<ForeignKey<RewardsRecord, ?>>asList(Keys.REWARDS_ITEMS);
    }

    public Items items() {
        return new Items(this, Keys.REWARDS_ITEMS);
    }

    @Override
    public Rewards as(String alias) {
        return new Rewards(DSL.name(alias), this);
    }

    @Override
    public Rewards as(Name alias) {
        return new Rewards(alias, this);
    }

    /**
     * Rename this table
     */
    @Override
    public Rewards rename(String name) {
        return new Rewards(DSL.name(name), null);
    }

    /**
     * Rename this table
     */
    @Override
    public Rewards rename(Name name) {
        return new Rewards(name, null);
    }

    // -------------------------------------------------------------------------
    // Row5 type methods
    // -------------------------------------------------------------------------

    @Override
    public Row5<Short, Short, Integer, Double, String> fieldsRow() {
        return (Row5) super.fieldsRow();
    }
}
