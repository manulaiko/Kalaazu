package com.kalaazu.persistence.database.entities.clans.generated;

import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.Clans;
import com.kalaazu.persistence.database.entities.Manager;
import com.kalaazu.persistence.database.mappers.ClanStatus;
import com.kalaazu.persistence.database.mappers.ClanStatusMapper;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.ColumnIdentifier;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.util.OptionalUtil;
import com.speedment.runtime.field.*;
import com.speedment.runtime.field.method.ReferenceSetter;
import com.speedment.runtime.typemapper.TypeMapper;

import java.util.Optional;

/**
 * The generated base for the {@link
 * Clans}-interface
 * representing entities of the {@code clans}-table in the database.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedClans {

    /**
     * This Field corresponds to the {@link Clans} field that can be obtained
     * using the {@link Clans#id()} method.
     */
    IntField<Clans, Integer> ID = IntField.create(
            Identifier.ID,
            Clans::id,
            Clans::id,
            TypeMapper.primitive(),
            true
    );

    /**
     * This Field corresponds to the {@link Clans} field that can be obtained
     * using the {@link Clans#accountsId()} method.
     */
    IntForeignKeyField<Clans, Integer, Accounts> ACCOUNTS_ID = IntForeignKeyField.create(
            Identifier.ACCOUNTS_ID,
            Clans::accountsId,
            Clans::accountsId,
            Accounts.ID,
            TypeMapper.primitive(),
            false
    );

    /**
     * This Field corresponds to the {@link Clans} field that can be obtained
     * using the {@link Clans#factionsId()} method.
     */
    ComparableField<Clans, Byte, Byte> FACTIONS_ID = ComparableField.create(
            Identifier.FACTIONS_ID,
            o -> OptionalUtil.unwrap(o.factionsId()),
            (ReferenceSetter<Clans, Byte>) Clans::factionsId,
            TypeMapper.identity(),
            false
    );

    /**
     * This Field corresponds to the {@link Clans} field that can be obtained
     * using the {@link Clans#tag()} method.
     */
    StringField<Clans, String> TAG = StringField.create(
            Identifier.TAG,
            Clans::tag,
            Clans::tag,
            TypeMapper.identity(),
            true
    );

    /**
     * This Field corresponds to the {@link Clans} field that can be obtained
     * using the {@link Clans#name()} method.
     */
    StringField<Clans, String> NAME = StringField.create(
            Identifier.NAME,
            Clans::name,
            Clans::name,
            TypeMapper.identity(),
            true
    );

    /**
     * This Field corresponds to the {@link Clans} field that can be obtained
     * using the {@link Clans#description()} method.
     */
    StringField<Clans, String> DESCRIPTION = StringField.create(
            Identifier.DESCRIPTION,
            Clans::description,
            Clans::description,
            TypeMapper.identity(),
            false
    );

    /**
     * This Field corresponds to the {@link Clans} field that can be obtained
     * using the {@link Clans#logo()} method.
     */
    StringField<Clans, String> LOGO = StringField.create(
            Identifier.LOGO,
            Clans::logo,
            Clans::logo,
            TypeMapper.identity(),
            false
    );

    /**
     * This Field corresponds to the {@link Clans} field that can be obtained
     * using the {@link Clans#status()} method.
     */
    EnumField<Clans, Byte, ClanStatus> STATUS = EnumField.create(
            Identifier.STATUS,
            Clans::status,
            Clans::status,
            new ClanStatusMapper(),
            ClanStatus::name,
            ClanStatus::valueOf,
            ClanStatus.class
    );

    /**
     * Returns the id of this Clans. The id field corresponds to the database
     * column kalaazu.kalaazu.clans.id.
     *
     * @return the id of this Clans
     */
    Integer id();

    /**
     * Returns the accountsId of this Clans. The accountsId field corresponds to
     * the database column kalaazu.kalaazu.clans.accounts_id.
     *
     * @return the accountsId of this Clans
     */
    int accountsId();

    /**
     * Returns the factionsId of this Clans. The factionsId field corresponds to
     * the database column kalaazu.kalaazu.clans.factions_id.
     *
     * @return the factionsId of this Clans
     */
    Optional<Byte> factionsId();

    /**
     * Returns the tag of this Clans. The tag field corresponds to the database
     * column kalaazu.kalaazu.clans.tag.
     *
     * @return the tag of this Clans
     */
    String tag();

    /**
     * Returns the name of this Clans. The name field corresponds to the
     * database column kalaazu.kalaazu.clans.name.
     *
     * @return the name of this Clans
     */
    String name();

    /**
     * Returns the description of this Clans. The description field corresponds
     * to the database column kalaazu.kalaazu.clans.description.
     *
     * @return the description of this Clans
     */
    String description();

    /**
     * Returns the logo of this Clans. The logo field corresponds to the
     * database column kalaazu.kalaazu.clans.logo.
     *
     * @return the logo of this Clans
     */
    String logo();

    /**
     * Returns the status of this Clans. The status field corresponds to the
     * database column kalaazu.kalaazu.clans.status.
     *
     * @return the status of this Clans
     */
    ClanStatus status();

    /**
     * Sets the id of this Clans. The id field corresponds to the database
     * column kalaazu.kalaazu.clans.id.
     *
     * @param id to set of this Clans
     *
     * @return this Clans instance
     */
    Clans id(Integer id);

    /**
     * Sets the accountsId of this Clans. The accountsId field corresponds to
     * the database column kalaazu.kalaazu.clans.accounts_id.
     *
     * @param accountsId to set of this Clans
     *
     * @return this Clans instance
     */
    Clans accountsId(int accountsId);

    /**
     * Sets the factionsId of this Clans. The factionsId field corresponds to
     * the database column kalaazu.kalaazu.clans.factions_id.
     *
     * @param factionsId to set of this Clans
     *
     * @return this Clans instance
     */
    Clans factionsId(Byte factionsId);

    /**
     * Sets the tag of this Clans. The tag field corresponds to the database
     * column kalaazu.kalaazu.clans.tag.
     *
     * @param tag to set of this Clans
     *
     * @return this Clans instance
     */
    Clans tag(String tag);

    /**
     * Sets the name of this Clans. The name field corresponds to the database
     * column kalaazu.kalaazu.clans.name.
     *
     * @param name to set of this Clans
     *
     * @return this Clans instance
     */
    Clans name(String name);

    /**
     * Sets the description of this Clans. The description field corresponds to
     * the database column kalaazu.kalaazu.clans.description.
     *
     * @param description to set of this Clans
     *
     * @return this Clans instance
     */
    Clans description(String description);

    /**
     * Sets the logo of this Clans. The logo field corresponds to the database
     * column kalaazu.kalaazu.clans.logo.
     *
     * @param logo to set of this Clans
     *
     * @return this Clans instance
     */
    Clans logo(String logo);

    /**
     * Sets the status of this Clans. The status field corresponds to the
     * database column kalaazu.kalaazu.clans.status.
     *
     * @param status to set of this Clans
     *
     * @return this Clans instance
     */
    Clans status(ClanStatus status);

    /**
     * Queries the specified manager for the referenced Accounts. If no such
     * Accounts exists, an {@code NullPointerException} will be thrown.
     *
     * @param foreignManager the manager to query for the entity
     *
     * @return the foreign entity referenced
     */
    Accounts findAccountsId(Manager<Accounts> foreignManager);

    enum Identifier implements ColumnIdentifier<Clans> {

        ID("id"),
        ACCOUNTS_ID("accounts_id"),
        FACTIONS_ID("factions_id"),
        TAG("tag"),
        NAME("name"),
        DESCRIPTION("description"),
        LOGO("logo"),
        STATUS("status");

        private final String columnName;

        private final TableIdentifier<Clans> tableIdentifier;

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
            return "clans";
        }

        @Override
        public String getColumnName() {
            return this.columnName;
        }

        @Override
        public TableIdentifier<Clans> asTableIdentifier() {
            return this.tableIdentifier;
        }
    }
}