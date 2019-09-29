/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.tables;


import com.kalaazu.persistence.database.Indexes;
import com.kalaazu.persistence.database.Kalaazu;
import com.kalaazu.persistence.database.Keys;
import com.kalaazu.persistence.database.records.AccountsMessagesRecord;
import org.jooq.*;
import org.jooq.impl.DSL;
import org.jooq.impl.TableImpl;

import javax.annotation.processing.Generated;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;


/**
 * Messaging system.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class AccountsMessages extends TableImpl<AccountsMessagesRecord> {

    /**
     * The reference instance of <code>kalaazu.accounts_messages</code>
     */
    public static final AccountsMessages ACCOUNTS_MESSAGES = new AccountsMessages();
    private static final long serialVersionUID = -589169984;
    /**
     * The column <code>kalaazu.accounts_messages.id</code>. Primary Key.
     */
    public final TableField<AccountsMessagesRecord, Integer> ID = createField(
            DSL.name("id"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false).identity(true),
            this,
            "Primary Key."
    );
    /**
     * The column <code>kalaazu.accounts_messages.from_accounts_id</code>.
     */
    public final TableField<AccountsMessagesRecord, Integer> FROM_ACCOUNTS_ID = createField(
            DSL.name("from_accounts_id"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "1",
                                                     org.jooq.impl.SQLDataType.INTEGER
                                             )),
            this,
            ""
    );
    /**
     * The column <code>kalaazu.accounts_messages.from_status</code>. 0 = unread, 1 = read, 2 = deleted.
     */
    public final TableField<AccountsMessagesRecord, Byte> FROM_STATUS = createField(
            DSL.name("from_status"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "1",
                                                     org.jooq.impl.SQLDataType.TINYINT
                                             )),
            this,
            "0 = unread, 1 = read, 2 = deleted."
    );
    /**
     * The column <code>kalaazu.accounts_messages.to_accounts_id</code>.
     */
    public final TableField<AccountsMessagesRecord, Integer> TO_ACCOUNTS_ID = createField(
            DSL.name("to_accounts_id"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false),
            this,
            ""
    );
    /**
     * The column <code>kalaazu.accounts_messages.to_status</code>. 0 = unread, 1 = read, 2 = unread.
     */
    public final TableField<AccountsMessagesRecord, Byte> TO_STATUS = createField(
            DSL.name("to_status"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "0",
                                                     org.jooq.impl.SQLDataType.TINYINT
                                             )),
            this,
            "0 = unread, 1 = read, 2 = unread."
    );
    /**
     * The column <code>kalaazu.accounts_messages.date</code>.
     */
    public final TableField<AccountsMessagesRecord, Timestamp> DATE = createField(
            DSL.name("date"),
            org.jooq.impl.SQLDataType.TIMESTAMP.nullable(false)
                                               .defaultValue(org.jooq.impl.DSL.field(
                                                       "CURRENT_TIMESTAMP",
                                                       org.jooq.impl.SQLDataType.TIMESTAMP
                                               )),
            this,
            ""
    );
    /**
     * The column <code>kalaazu.accounts_messages.title</code>.
     */
    public final TableField<AccountsMessagesRecord, String> TITLE = createField(
            DSL.name("title"),
            org.jooq.impl.SQLDataType.VARCHAR(255)
                                     .nullable(false),
            this,
            ""
    );
    /**
     * The column <code>kalaazu.accounts_messages.text</code>.
     */
    public final TableField<AccountsMessagesRecord, String> TEXT = createField(
            DSL.name("text"),
            org.jooq.impl.SQLDataType.CLOB.nullable(false),
            this,
            ""
    );

    /**
     * Create a <code>kalaazu.accounts_messages</code> table reference
     */
    public AccountsMessages() {
        this(DSL.name("accounts_messages"), null);
    }

    /**
     * Create an aliased <code>kalaazu.accounts_messages</code> table reference
     */
    public AccountsMessages(String alias) {
        this(DSL.name(alias), ACCOUNTS_MESSAGES);
    }

    /**
     * Create an aliased <code>kalaazu.accounts_messages</code> table reference
     */
    public AccountsMessages(Name alias) {
        this(alias, ACCOUNTS_MESSAGES);
    }

    private AccountsMessages(Name alias, Table<AccountsMessagesRecord> aliased) {
        this(alias, aliased, null);
    }

    private AccountsMessages(Name alias, Table<AccountsMessagesRecord> aliased, Field<?>[] parameters) {
        super(alias, null, aliased, parameters, DSL.comment("Messaging system."));
    }

    public <O extends Record> AccountsMessages(Table<O> child, ForeignKey<O, AccountsMessagesRecord> key) {
        super(child, key, ACCOUNTS_MESSAGES);
    }

    /**
     * The class holding records for this type
     */
    @Override
    public Class<AccountsMessagesRecord> getRecordType() {
        return AccountsMessagesRecord.class;
    }

    @Override
    public Schema getSchema() {
        return Kalaazu.KALAAZU;
    }

    @Override
    public List<Index> getIndexes() {
        return Arrays.<Index>asList(
                Indexes.ACCOUNTS_MESSAGES_ACCOUNTS_MESSAGES_FROM_ACCOUNTS_ID_IDX,
                Indexes.ACCOUNTS_MESSAGES_ACCOUNTS_MESSAGES_TO_ACCOUNTS_ID_IDX,
                Indexes.ACCOUNTS_MESSAGES_PRIMARY
        );
    }

    @Override
    public Identity<AccountsMessagesRecord, Integer> getIdentity() {
        return Keys.IDENTITY_ACCOUNTS_MESSAGES;
    }

    @Override
    public UniqueKey<AccountsMessagesRecord> getPrimaryKey() {
        return Keys.KEY_ACCOUNTS_MESSAGES_PRIMARY;
    }

    @Override
    public List<UniqueKey<AccountsMessagesRecord>> getKeys() {
        return Arrays.<UniqueKey<AccountsMessagesRecord>>asList(Keys.KEY_ACCOUNTS_MESSAGES_PRIMARY);
    }

    @Override
    public List<ForeignKey<AccountsMessagesRecord, ?>> getReferences() {
        return Arrays.<ForeignKey<AccountsMessagesRecord, ?>>asList(
                Keys.ACCOUNTS_MESSAGES_FROM_ACCOUNTS,
                Keys.ACCOUNTS_MESSAGES_TO_ACCOUNTS
        );
    }

    public Accounts accountsMessagesFromAccounts() {
        return new Accounts(this, Keys.ACCOUNTS_MESSAGES_FROM_ACCOUNTS);
    }

    public Accounts accountsMessagesToAccounts() {
        return new Accounts(this, Keys.ACCOUNTS_MESSAGES_TO_ACCOUNTS);
    }

    @Override
    public AccountsMessages as(String alias) {
        return new AccountsMessages(DSL.name(alias), this);
    }

    @Override
    public AccountsMessages as(Name alias) {
        return new AccountsMessages(alias, this);
    }

    /**
     * Rename this table
     */
    @Override
    public AccountsMessages rename(String name) {
        return new AccountsMessages(DSL.name(name), null);
    }

    /**
     * Rename this table
     */
    @Override
    public AccountsMessages rename(Name name) {
        return new AccountsMessages(name, null);
    }

    // -------------------------------------------------------------------------
    // Row8 type methods
    // -------------------------------------------------------------------------

    @Override
    public Row8<Integer, Integer, Byte, Integer, Byte, Timestamp, String, String> fieldsRow() {
        return (Row8) super.fieldsRow();
    }
}
