/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.tables;


import com.kalaazu.persistence.database.Indexes;
import com.kalaazu.persistence.database.Kalaazu;
import com.kalaazu.persistence.database.Keys;
import com.kalaazu.persistence.database.records.AccountsQuestsRecord;
import org.jooq.*;
import org.jooq.impl.DSL;
import org.jooq.impl.TableImpl;

import javax.annotation.processing.Generated;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;


/**
 * Quest status of the account.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class AccountsQuests extends TableImpl<AccountsQuestsRecord> {

    /**
     * The reference instance of <code>kalaazu.accounts_quests</code>
     */
    public static final AccountsQuests ACCOUNTS_QUESTS = new AccountsQuests();
    private static final long serialVersionUID = 1333634235;
    /**
     * The column <code>kalaazu.accounts_quests.id</code>. Primary Key.
     */
    public final TableField<AccountsQuestsRecord, Integer> ID = createField(
            DSL.name("id"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false).identity(true),
            this,
            "Primary Key."
    );
    /**
     * The column <code>kalaazu.accounts_quests.quests_id</code>.
     */
    public final TableField<AccountsQuestsRecord, Short> QUESTS_ID = createField(
            DSL.name("quests_id"),
            org.jooq.impl.SQLDataType.SMALLINT.nullable(false),
            this,
            ""
    );
    /**
     * The column <code>kalaazu.accounts_quests.accounts_id</code>.
     */
    public final TableField<AccountsQuestsRecord, Integer> ACCOUNTS_ID = createField(
            DSL.name("accounts_id"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false),
            this,
            ""
    );
    /**
     * The column <code>kalaazu.accounts_quests.is_completed</code>. Whether the quest has been completed or not.
     */
    public final TableField<AccountsQuestsRecord, Byte> IS_COMPLETED = createField(
            DSL.name("is_completed"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "0",
                                                     org.jooq.impl.SQLDataType.TINYINT
                                             )),
            this,
            "Whether the quest has been completed or not."
    );
    /**
     * The column <code>kalaazu.accounts_quests.date</code>. Date when the quest was accepted/completed.
     */
    public final TableField<AccountsQuestsRecord, Timestamp> DATE = createField(
            DSL.name("date"),
            org.jooq.impl.SQLDataType.TIMESTAMP.nullable(false)
                                               .defaultValue(org.jooq.impl.DSL.field(
                                                       "CURRENT_TIMESTAMP",
                                                       org.jooq.impl.SQLDataType.TIMESTAMP
                                               )),
            this,
            "Date when the quest was accepted/completed."
    );

    /**
     * Create a <code>kalaazu.accounts_quests</code> table reference
     */
    public AccountsQuests() {
        this(DSL.name("accounts_quests"), null);
    }

    /**
     * Create an aliased <code>kalaazu.accounts_quests</code> table reference
     */
    public AccountsQuests(String alias) {
        this(DSL.name(alias), ACCOUNTS_QUESTS);
    }

    /**
     * Create an aliased <code>kalaazu.accounts_quests</code> table reference
     */
    public AccountsQuests(Name alias) {
        this(alias, ACCOUNTS_QUESTS);
    }

    private AccountsQuests(Name alias, Table<AccountsQuestsRecord> aliased) {
        this(alias, aliased, null);
    }

    private AccountsQuests(Name alias, Table<AccountsQuestsRecord> aliased, Field<?>[] parameters) {
        super(alias, null, aliased, parameters, DSL.comment("Quest status of the account."));
    }

    public <O extends Record> AccountsQuests(Table<O> child, ForeignKey<O, AccountsQuestsRecord> key) {
        super(child, key, ACCOUNTS_QUESTS);
    }

    /**
     * The class holding records for this type
     */
    @Override
    public Class<AccountsQuestsRecord> getRecordType() {
        return AccountsQuestsRecord.class;
    }

    @Override
    public Schema getSchema() {
        return Kalaazu.KALAAZU;
    }

    @Override
    public List<Index> getIndexes() {
        return Arrays.<Index>asList(
                Indexes.ACCOUNTS_QUESTS_ACCOUNTS_QUESTS_ACCOUNTS_ID_IDX,
                Indexes.ACCOUNTS_QUESTS_ACCOUNTS_QUESTS_QUESTS_ID_IDX,
                Indexes.ACCOUNTS_QUESTS_PRIMARY
        );
    }

    @Override
    public Identity<AccountsQuestsRecord, Integer> getIdentity() {
        return Keys.IDENTITY_ACCOUNTS_QUESTS;
    }

    @Override
    public UniqueKey<AccountsQuestsRecord> getPrimaryKey() {
        return Keys.KEY_ACCOUNTS_QUESTS_PRIMARY;
    }

    @Override
    public List<UniqueKey<AccountsQuestsRecord>> getKeys() {
        return Arrays.<UniqueKey<AccountsQuestsRecord>>asList(Keys.KEY_ACCOUNTS_QUESTS_PRIMARY);
    }

    @Override
    public List<ForeignKey<AccountsQuestsRecord, ?>> getReferences() {
        return Arrays.<ForeignKey<AccountsQuestsRecord, ?>>asList(
                Keys.ACCOUNTS_QUESTS_QUESTS,
                Keys.ACCOUNTS_QUESTS_ACCOUNTS
        );
    }

    public Quests quests() {
        return new Quests(this, Keys.ACCOUNTS_QUESTS_QUESTS);
    }

    public Accounts accounts() {
        return new Accounts(this, Keys.ACCOUNTS_QUESTS_ACCOUNTS);
    }

    @Override
    public AccountsQuests as(String alias) {
        return new AccountsQuests(DSL.name(alias), this);
    }

    @Override
    public AccountsQuests as(Name alias) {
        return new AccountsQuests(alias, this);
    }

    /**
     * Rename this table
     */
    @Override
    public AccountsQuests rename(String name) {
        return new AccountsQuests(DSL.name(name), null);
    }

    /**
     * Rename this table
     */
    @Override
    public AccountsQuests rename(Name name) {
        return new AccountsQuests(name, null);
    }

    // -------------------------------------------------------------------------
    // Row5 type methods
    // -------------------------------------------------------------------------

    @Override
    public Row5<Integer, Short, Integer, Byte, Timestamp> fieldsRow() {
        return (Row5) super.fieldsRow();
    }
}
