/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.tables;


import com.kalaazu.persistence.database.Indexes;
import com.kalaazu.persistence.database.Kalaazu;
import com.kalaazu.persistence.database.Keys;
import com.kalaazu.persistence.database.records.AccountsRankingsRecord;
import org.jooq.*;
import org.jooq.impl.DSL;
import org.jooq.impl.TableImpl;

import javax.annotation.processing.Generated;
import java.util.Arrays;
import java.util.List;


/**
 * Account ranking.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class AccountsRankings extends TableImpl<AccountsRankingsRecord> {

    /**
     * The reference instance of <code>kalaazu.accounts_rankings</code>
     */
    public static final AccountsRankings ACCOUNTS_RANKINGS = new AccountsRankings();
    private static final long serialVersionUID = 733476277;
    /**
     * The column <code>kalaazu.accounts_rankings.id</code>. Primary Key.
     */
    public final TableField<AccountsRankingsRecord, Integer> ID = createField(
            DSL.name("id"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false).identity(true),
            this,
            "Primary Key."
    );
    /**
     * The column <code>kalaazu.accounts_rankings.accounts_id</code>. Account ID.
     */
    public final TableField<AccountsRankingsRecord, Integer> ACCOUNTS_ID = createField(
            DSL.name("accounts_id"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false),
            this,
            "Account ID."
    );
    /**
     * The column <code>kalaazu.accounts_rankings.points</code>. Points in the ranking.
     */
    public final TableField<AccountsRankingsRecord, Integer> POINTS = createField(
            DSL.name("points"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "0",
                                                     org.jooq.impl.SQLDataType.INTEGER
                                             )),
            this,
            "Points in the ranking."
    );
    /**
     * The column <code>kalaazu.accounts_rankings.best_points</code>. Biggest amount of rank points ever achieved.
     */
    public final TableField<AccountsRankingsRecord, Integer> BEST_POINTS = createField(
            DSL.name("best_points"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "0",
                                                     org.jooq.impl.SQLDataType.INTEGER
                                             )),
            this,
            "Biggest amount of rank points ever achieved."
    );
    /**
     * The column <code>kalaazu.accounts_rankings.destroyed_allies</code>. Destroyed allies.
     */
    public final TableField<AccountsRankingsRecord, Short> DESTROYED_ALLIES = createField(
            DSL.name("destroyed_allies"),
            org.jooq.impl.SQLDataType.SMALLINT.nullable(false)
                                              .defaultValue(org.jooq.impl.DSL.field(
                                                      "0",
                                                      org.jooq.impl.SQLDataType.SMALLINT
                                              )),
            this,
            "Destroyed allies."
    );
    /**
     * The column <code>kalaazu.accounts_rankings.destroyed_phoenix</code>. Destroyed phoenix.
     */
    public final TableField<AccountsRankingsRecord, Short> DESTROYED_PHOENIX = createField(
            DSL.name("destroyed_phoenix"),
            org.jooq.impl.SQLDataType.SMALLINT.nullable(false)
                                              .defaultValue(org.jooq.impl.DSL.field(
                                                      "0",
                                                      org.jooq.impl.SQLDataType.SMALLINT
                                              )),
            this,
            "Destroyed phoenix."
    );
    /**
     * The column <code>kalaazu.accounts_rankings.destroyed_times</code>. Amount of times the account has been destroyed.
     */
    public final TableField<AccountsRankingsRecord, Short> DESTROYED_TIMES = createField(
            DSL.name("destroyed_times"),
            org.jooq.impl.SQLDataType.SMALLINT.nullable(false)
                                              .defaultValue(org.jooq.impl.DSL.field(
                                                      "0",
                                                      org.jooq.impl.SQLDataType.SMALLINT
                                              )),
            this,
            "Amount of times the account has been destroyed."
    );
    /**
     * The column <code>kalaazu.accounts_rankings.destroyed_radiation</code>. Amount of times the account has been destroyed by the radiation zone.
     */
    public final TableField<AccountsRankingsRecord, Short> DESTROYED_RADIATION = createField(
            DSL.name("destroyed_radiation"),
            org.jooq.impl.SQLDataType.SMALLINT.nullable(false)
                                              .defaultValue(org.jooq.impl.DSL.field(
                                                      "0",
                                                      org.jooq.impl.SQLDataType.SMALLINT
                                              )),
            this,
            "Amount of times the account has been destroyed by the radiation zone."
    );

    /**
     * Create a <code>kalaazu.accounts_rankings</code> table reference
     */
    public AccountsRankings() {
        this(DSL.name("accounts_rankings"), null);
    }

    /**
     * Create an aliased <code>kalaazu.accounts_rankings</code> table reference
     */
    public AccountsRankings(String alias) {
        this(DSL.name(alias), ACCOUNTS_RANKINGS);
    }

    /**
     * Create an aliased <code>kalaazu.accounts_rankings</code> table reference
     */
    public AccountsRankings(Name alias) {
        this(alias, ACCOUNTS_RANKINGS);
    }

    private AccountsRankings(Name alias, Table<AccountsRankingsRecord> aliased) {
        this(alias, aliased, null);
    }

    private AccountsRankings(Name alias, Table<AccountsRankingsRecord> aliased, Field<?>[] parameters) {
        super(alias, null, aliased, parameters, DSL.comment("Account ranking."));
    }

    public <O extends Record> AccountsRankings(Table<O> child, ForeignKey<O, AccountsRankingsRecord> key) {
        super(child, key, ACCOUNTS_RANKINGS);
    }

    /**
     * The class holding records for this type
     */
    @Override
    public Class<AccountsRankingsRecord> getRecordType() {
        return AccountsRankingsRecord.class;
    }

    @Override
    public Schema getSchema() {
        return Kalaazu.KALAAZU;
    }

    @Override
    public List<Index> getIndexes() {
        return Arrays.<Index>asList(
                Indexes.ACCOUNTS_RANKINGS_ACCOUNTS_RANKING_ACCOUNTS_ID_IDX,
                Indexes.ACCOUNTS_RANKINGS_PRIMARY
        );
    }

    @Override
    public Identity<AccountsRankingsRecord, Integer> getIdentity() {
        return Keys.IDENTITY_ACCOUNTS_RANKINGS;
    }

    @Override
    public UniqueKey<AccountsRankingsRecord> getPrimaryKey() {
        return Keys.KEY_ACCOUNTS_RANKINGS_PRIMARY;
    }

    @Override
    public List<UniqueKey<AccountsRankingsRecord>> getKeys() {
        return Arrays.<UniqueKey<AccountsRankingsRecord>>asList(
                Keys.KEY_ACCOUNTS_RANKINGS_PRIMARY,
                Keys.KEY_ACCOUNTS_RANKINGS_ACCOUNTS_RANKING_ACCOUNTS_ID_IDX
        );
    }

    @Override
    public List<ForeignKey<AccountsRankingsRecord, ?>> getReferences() {
        return Arrays.<ForeignKey<AccountsRankingsRecord, ?>>asList(Keys.ACCOUNTS_RANKINGS_ACCOUNTS);
    }

    public Accounts accounts() {
        return new Accounts(this, Keys.ACCOUNTS_RANKINGS_ACCOUNTS);
    }

    @Override
    public AccountsRankings as(String alias) {
        return new AccountsRankings(DSL.name(alias), this);
    }

    @Override
    public AccountsRankings as(Name alias) {
        return new AccountsRankings(alias, this);
    }

    /**
     * Rename this table
     */
    @Override
    public AccountsRankings rename(String name) {
        return new AccountsRankings(DSL.name(name), null);
    }

    /**
     * Rename this table
     */
    @Override
    public AccountsRankings rename(Name name) {
        return new AccountsRankings(name, null);
    }

    // -------------------------------------------------------------------------
    // Row8 type methods
    // -------------------------------------------------------------------------

    @Override
    public Row8<Integer, Integer, Integer, Integer, Short, Short, Short, Short> fieldsRow() {
        return (Row8) super.fieldsRow();
    }
}
