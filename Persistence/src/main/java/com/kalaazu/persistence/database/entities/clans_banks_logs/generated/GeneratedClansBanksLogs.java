package com.kalaazu.persistence.database.entities.clans_banks_logs.generated;

import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.ClansBanks;
import com.kalaazu.persistence.database.entities.ClansBanksLogs;
import com.kalaazu.persistence.database.entities.Manager;
import com.kalaazu.persistence.database.mappers.BankLogType;
import com.kalaazu.persistence.database.mappers.BankLogTypeMapper;
import com.kalaazu.persistence.database.mappers.Currency;
import com.kalaazu.persistence.database.mappers.CurrencyMapper;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.ColumnIdentifier;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.field.ComparableField;
import com.speedment.runtime.field.EnumField;
import com.speedment.runtime.field.IntField;
import com.speedment.runtime.field.IntForeignKeyField;
import com.speedment.runtime.typemapper.TypeMapper;

import java.sql.Timestamp;

/**
 * The generated base for the {@link
 * ClansBanksLogs}-interface
 * representing entities of the {@code clans_banks_logs}-table in the database.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedClansBanksLogs {

    /**
     * This Field corresponds to the {@link ClansBanksLogs} field that can be
     * obtained using the {@link ClansBanksLogs#getId()} method.
     */
    IntField<ClansBanksLogs, Integer> ID = IntField.create(
            Identifier.ID,
            ClansBanksLogs::getId,
            ClansBanksLogs::setId,
            TypeMapper.primitive(),
            true
    );

    /**
     * This Field corresponds to the {@link ClansBanksLogs} field that can be
     * obtained using the {@link ClansBanksLogs#getClansBanksId()} method.
     */
    IntForeignKeyField<ClansBanksLogs, Integer, ClansBanks> CLANS_BANKS_ID = IntForeignKeyField.create(
            Identifier.CLANS_BANKS_ID,
            ClansBanksLogs::getClansBanksId,
            ClansBanksLogs::setClansBanksId,
            ClansBanks.ID,
            TypeMapper.primitive(),
            false
    );

    /**
     * This Field corresponds to the {@link ClansBanksLogs} field that can be
     * obtained using the {@link ClansBanksLogs#getFromAccountsId()} method.
     */
    IntForeignKeyField<ClansBanksLogs, Integer, Accounts> FROM_ACCOUNTS_ID = IntForeignKeyField.create(
            Identifier.FROM_ACCOUNTS_ID,
            ClansBanksLogs::getFromAccountsId,
            ClansBanksLogs::setFromAccountsId,
            Accounts.ID,
            TypeMapper.primitive(),
            false
    );

    /**
     * This Field corresponds to the {@link ClansBanksLogs} field that can be
     * obtained using the {@link ClansBanksLogs#getToAccountsId()} method.
     */
    IntForeignKeyField<ClansBanksLogs, Integer, Accounts> TO_ACCOUNTS_ID = IntForeignKeyField.create(
            Identifier.TO_ACCOUNTS_ID,
            ClansBanksLogs::getToAccountsId,
            ClansBanksLogs::setToAccountsId,
            Accounts.ID,
            TypeMapper.primitive(),
            false
    );

    /**
     * This Field corresponds to the {@link ClansBanksLogs} field that can be
     * obtained using the {@link ClansBanksLogs#getDate()} method.
     */
    ComparableField<ClansBanksLogs, Timestamp, Timestamp> DATE = ComparableField.create(
            Identifier.DATE,
            ClansBanksLogs::getDate,
            ClansBanksLogs::setDate,
            TypeMapper.identity(),
            false
    );

    /**
     * This Field corresponds to the {@link ClansBanksLogs} field that can be
     * obtained using the {@link ClansBanksLogs#getType()} method.
     */
    EnumField<ClansBanksLogs, Byte, BankLogType> TYPE = EnumField.create(
            Identifier.TYPE,
            ClansBanksLogs::getType,
            ClansBanksLogs::setType,
            new BankLogTypeMapper(),
            BankLogType::name,
            BankLogType::valueOf,
            BankLogType.class
    );

    /**
     * This Field corresponds to the {@link ClansBanksLogs} field that can be
     * obtained using the {@link ClansBanksLogs#getAmount()} method.
     */
    IntField<ClansBanksLogs, Integer> AMOUNT = IntField.create(
            Identifier.AMOUNT,
            ClansBanksLogs::getAmount,
            ClansBanksLogs::setAmount,
            TypeMapper.primitive(),
            false
    );

    /**
     * This Field corresponds to the {@link ClansBanksLogs} field that can be
     * obtained using the {@link ClansBanksLogs#getCurrency()} method.
     */
    EnumField<ClansBanksLogs, Byte, Currency> CURRENCY = EnumField.create(
            Identifier.CURRENCY,
            ClansBanksLogs::getCurrency,
            ClansBanksLogs::setCurrency,
            new CurrencyMapper(),
            Currency::name,
            Currency::valueOf,
            Currency.class
    );

    /**
     * Returns the id of this ClansBanksLogs. The id field corresponds to the
     * database column kalaazu.kalaazu.clans_banks_logs.id.
     *
     * @return the id of this ClansBanksLogs
     */
    Integer getId();

    /**
     * Returns the clansBanksId of this ClansBanksLogs. The clansBanksId field
     * corresponds to the database column
     * kalaazu.kalaazu.clans_banks_logs.clans_banks_id.
     *
     * @return the clansBanksId of this ClansBanksLogs
     */
    int getClansBanksId();

    /**
     * Returns the fromAccountsId of this ClansBanksLogs. The fromAccountsId
     * field corresponds to the database column
     * kalaazu.kalaazu.clans_banks_logs.from_accounts_id.
     *
     * @return the fromAccountsId of this ClansBanksLogs
     */
    int getFromAccountsId();

    /**
     * Returns the toAccountsId of this ClansBanksLogs. The toAccountsId field
     * corresponds to the database column
     * kalaazu.kalaazu.clans_banks_logs.to_accounts_id.
     *
     * @return the toAccountsId of this ClansBanksLogs
     */
    int getToAccountsId();

    /**
     * Returns the date of this ClansBanksLogs. The date field corresponds to
     * the database column kalaazu.kalaazu.clans_banks_logs.date.
     *
     * @return the date of this ClansBanksLogs
     */
    Timestamp getDate();

    /**
     * Returns the type of this ClansBanksLogs. The type field corresponds to
     * the database column kalaazu.kalaazu.clans_banks_logs.type.
     *
     * @return the type of this ClansBanksLogs
     */
    BankLogType getType();

    /**
     * Returns the amount of this ClansBanksLogs. The amount field corresponds
     * to the database column kalaazu.kalaazu.clans_banks_logs.amount.
     *
     * @return the amount of this ClansBanksLogs
     */
    int getAmount();

    /**
     * Returns the currency of this ClansBanksLogs. The currency field
     * corresponds to the database column
     * kalaazu.kalaazu.clans_banks_logs.currency.
     *
     * @return the currency of this ClansBanksLogs
     */
    Currency getCurrency();

    /**
     * Sets the id of this ClansBanksLogs. The id field corresponds to the
     * database column kalaazu.kalaazu.clans_banks_logs.id.
     *
     * @param id to set of this ClansBanksLogs
     *
     * @return this ClansBanksLogs instance
     */
    ClansBanksLogs setId(int id);

    /**
     * Sets the clansBanksId of this ClansBanksLogs. The clansBanksId field
     * corresponds to the database column
     * kalaazu.kalaazu.clans_banks_logs.clans_banks_id.
     *
     * @param clansBanksId to set of this ClansBanksLogs
     *
     * @return this ClansBanksLogs instance
     */
    ClansBanksLogs setClansBanksId(int clansBanksId);

    /**
     * Sets the fromAccountsId of this ClansBanksLogs. The fromAccountsId field
     * corresponds to the database column
     * kalaazu.kalaazu.clans_banks_logs.from_accounts_id.
     *
     * @param fromAccountsId to set of this ClansBanksLogs
     *
     * @return this ClansBanksLogs instance
     */
    ClansBanksLogs setFromAccountsId(int fromAccountsId);

    /**
     * Sets the toAccountsId of this ClansBanksLogs. The toAccountsId field
     * corresponds to the database column
     * kalaazu.kalaazu.clans_banks_logs.to_accounts_id.
     *
     * @param toAccountsId to set of this ClansBanksLogs
     *
     * @return this ClansBanksLogs instance
     */
    ClansBanksLogs setToAccountsId(int toAccountsId);

    /**
     * Sets the date of this ClansBanksLogs. The date field corresponds to the
     * database column kalaazu.kalaazu.clans_banks_logs.date.
     *
     * @param date to set of this ClansBanksLogs
     *
     * @return this ClansBanksLogs instance
     */
    ClansBanksLogs setDate(Timestamp date);

    /**
     * Sets the type of this ClansBanksLogs. The type field corresponds to the
     * database column kalaazu.kalaazu.clans_banks_logs.type.
     *
     * @param type to set of this ClansBanksLogs
     *
     * @return this ClansBanksLogs instance
     */
    ClansBanksLogs setType(BankLogType type);

    /**
     * Sets the amount of this ClansBanksLogs. The amount field corresponds to
     * the database column kalaazu.kalaazu.clans_banks_logs.amount.
     *
     * @param amount to set of this ClansBanksLogs
     *
     * @return this ClansBanksLogs instance
     */
    ClansBanksLogs setAmount(int amount);

    /**
     * Sets the currency of this ClansBanksLogs. The currency field corresponds
     * to the database column kalaazu.kalaazu.clans_banks_logs.currency.
     *
     * @param currency to set of this ClansBanksLogs
     *
     * @return this ClansBanksLogs instance
     */
    ClansBanksLogs setCurrency(Currency currency);

    /**
     * Queries the specified manager for the referenced ClansBanks. If no such
     * ClansBanks exists, an {@code NullPointerException} will be thrown.
     *
     * @param foreignManager the manager to query for the entity
     *
     * @return the foreign entity referenced
     */
    ClansBanks findClansBanksId(Manager<ClansBanks> foreignManager);

    /**
     * Queries the specified manager for the referenced Accounts. If no such
     * Accounts exists, an {@code NullPointerException} will be thrown.
     *
     * @param foreignManager the manager to query for the entity
     *
     * @return the foreign entity referenced
     */
    Accounts findFromAccountsId(Manager<Accounts> foreignManager);

    /**
     * Queries the specified manager for the referenced Accounts. If no such
     * Accounts exists, an {@code NullPointerException} will be thrown.
     *
     * @param foreignManager the manager to query for the entity
     *
     * @return the foreign entity referenced
     */
    Accounts findToAccountsId(Manager<Accounts> foreignManager);

    enum Identifier implements ColumnIdentifier<ClansBanksLogs> {

        ID("id"),
        CLANS_BANKS_ID("clans_banks_id"),
        FROM_ACCOUNTS_ID("from_accounts_id"),
        TO_ACCOUNTS_ID("to_accounts_id"),
        DATE("date"),
        TYPE("type"),
        AMOUNT("amount"),
        CURRENCY("currency");

        private final String columnName;

        private final TableIdentifier<ClansBanksLogs> tableIdentifier;

        Identifier(String columnName) {
            this.columnName = columnName;
            this.tableIdentifier = TableIdentifier.of(
                    getDbmsName(),
                    getSchemaName(),
                    getTableName()
            );
        }

        @Override
        public String getDbmsName() {
            return "kalaazu";
        }

        @Override
        public String getSchemaName() {
            return "kalaazu";
        }

        @Override
        public String getTableName() {
            return "clans_banks_logs";
        }

        @Override
        public String getColumnName() {
            return this.columnName;
        }

        @Override
        public TableIdentifier<ClansBanksLogs> asTableIdentifier() {
            return this.tableIdentifier;
        }
    }
}