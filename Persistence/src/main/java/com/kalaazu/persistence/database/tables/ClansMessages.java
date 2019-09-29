/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.tables;


import com.kalaazu.persistence.database.Indexes;
import com.kalaazu.persistence.database.Kalaazu;
import com.kalaazu.persistence.database.Keys;
import com.kalaazu.persistence.database.records.ClansMessagesRecord;
import org.jooq.*;
import org.jooq.impl.DSL;
import org.jooq.impl.TableImpl;

import javax.annotation.processing.Generated;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;


/**
 * Messages in the clan.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class ClansMessages extends TableImpl<ClansMessagesRecord> {

    /**
     * The reference instance of <code>kalaazu.clans_messages</code>
     */
    public static final ClansMessages CLANS_MESSAGES = new ClansMessages();
    private static final long serialVersionUID = -1487470447;
    /**
     * The column <code>kalaazu.clans_messages.id</code>. Primary Key.
     */
    public final TableField<ClansMessagesRecord, Integer> ID = createField(
            DSL.name("id"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false).identity(true),
            this,
            "Primary Key."
    );
    /**
     * The column <code>kalaazu.clans_messages.clans_id</code>. Clan where the message was created
     */
    public final TableField<ClansMessagesRecord, Integer> CLANS_ID = createField(
            DSL.name("clans_id"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false),
            this,
            "Clan where the message was created"
    );
    /**
     * The column <code>kalaazu.clans_messages.from_accounts_id</code>.
     */
    public final TableField<ClansMessagesRecord, Integer> FROM_ACCOUNTS_ID = createField(
            DSL.name("from_accounts_id"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false),
            this,
            ""
    );
    /**
     * The column <code>kalaazu.clans_messages.from_status</code>. 0 = unread, 1 = read, 2 = deleted.
     */
    public final TableField<ClansMessagesRecord, Byte> FROM_STATUS = createField(
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
     * The column <code>kalaazu.clans_messages.to_accounts_id</code>.
     */
    public final TableField<ClansMessagesRecord, Integer> TO_ACCOUNTS_ID = createField(
            DSL.name("to_accounts_id"),
            org.jooq.impl.SQLDataType.INTEGER,
            this,
            ""
    );
    /**
     * The column <code>kalaazu.clans_messages.to_status</code>. 0 = unread, 1 = read, 2 = unread.
     */
    public final TableField<ClansMessagesRecord, Byte> TO_STATUS = createField(
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
     * The column <code>kalaazu.clans_messages.title</code>.
     */
    public final TableField<ClansMessagesRecord, String> TITLE = createField(
            DSL.name("title"),
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
     * The column <code>kalaazu.clans_messages.text</code>.
     */
    public final TableField<ClansMessagesRecord, String> TEXT = createField(
            DSL.name("text"),
            org.jooq.impl.SQLDataType.CLOB.nullable(false),
            this,
            ""
    );
    /**
     * The column <code>kalaazu.clans_messages.date</code>.
     */
    public final TableField<ClansMessagesRecord, Timestamp> DATE = createField(
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
     * Create a <code>kalaazu.clans_messages</code> table reference
     */
    public ClansMessages() {
        this(DSL.name("clans_messages"), null);
    }

    /**
     * Create an aliased <code>kalaazu.clans_messages</code> table reference
     */
    public ClansMessages(String alias) {
        this(DSL.name(alias), CLANS_MESSAGES);
    }

    /**
     * Create an aliased <code>kalaazu.clans_messages</code> table reference
     */
    public ClansMessages(Name alias) {
        this(alias, CLANS_MESSAGES);
    }

    private ClansMessages(Name alias, Table<ClansMessagesRecord> aliased) {
        this(alias, aliased, null);
    }

    private ClansMessages(Name alias, Table<ClansMessagesRecord> aliased, Field<?>[] parameters) {
        super(alias, null, aliased, parameters, DSL.comment("Messages in the clan."));
    }

    public <O extends Record> ClansMessages(Table<O> child, ForeignKey<O, ClansMessagesRecord> key) {
        super(child, key, CLANS_MESSAGES);
    }

    /**
     * The class holding records for this type
     */
    @Override
    public Class<ClansMessagesRecord> getRecordType() {
        return ClansMessagesRecord.class;
    }

    @Override
    public Schema getSchema() {
        return Kalaazu.KALAAZU;
    }

    @Override
    public List<Index> getIndexes() {
        return Arrays.<Index>asList(
                Indexes.CLANS_MESSAGES_CLANS_MESSAGES_CLANS_ID_IDX,
                Indexes.CLANS_MESSAGES_CLANS_MESSAGES_FROM_ACCOUNTS_ID_IDX,
                Indexes.CLANS_MESSAGES_CLANS_MESSAGES_TO_ACCOUNTS_ID_IDX,
                Indexes.CLANS_MESSAGES_PRIMARY
        );
    }

    @Override
    public Identity<ClansMessagesRecord, Integer> getIdentity() {
        return Keys.IDENTITY_CLANS_MESSAGES;
    }

    @Override
    public UniqueKey<ClansMessagesRecord> getPrimaryKey() {
        return Keys.KEY_CLANS_MESSAGES_PRIMARY;
    }

    @Override
    public List<UniqueKey<ClansMessagesRecord>> getKeys() {
        return Arrays.<UniqueKey<ClansMessagesRecord>>asList(Keys.KEY_CLANS_MESSAGES_PRIMARY);
    }

    @Override
    public List<ForeignKey<ClansMessagesRecord, ?>> getReferences() {
        return Arrays.<ForeignKey<ClansMessagesRecord, ?>>asList(
                Keys.CLANS_MESSAGES_CLANS,
                Keys.CLANS_MESSAGES_FROM_ACCOUNTS,
                Keys.CLANS_MESSAGES_TO_ACCOUNTS
        );
    }

    public Clans clans() {
        return new Clans(this, Keys.CLANS_MESSAGES_CLANS);
    }

    public Accounts clansMessagesFromAccounts() {
        return new Accounts(this, Keys.CLANS_MESSAGES_FROM_ACCOUNTS);
    }

    public Accounts clansMessagesToAccounts() {
        return new Accounts(this, Keys.CLANS_MESSAGES_TO_ACCOUNTS);
    }

    @Override
    public ClansMessages as(String alias) {
        return new ClansMessages(DSL.name(alias), this);
    }

    @Override
    public ClansMessages as(Name alias) {
        return new ClansMessages(alias, this);
    }

    /**
     * Rename this table
     */
    @Override
    public ClansMessages rename(String name) {
        return new ClansMessages(DSL.name(name), null);
    }

    /**
     * Rename this table
     */
    @Override
    public ClansMessages rename(Name name) {
        return new ClansMessages(name, null);
    }

    // -------------------------------------------------------------------------
    // Row9 type methods
    // -------------------------------------------------------------------------

    @Override
    public Row9<Integer, Integer, Integer, Byte, Integer, Byte, String, String, Timestamp> fieldsRow() {
        return (Row9) super.fieldsRow();
    }
}
