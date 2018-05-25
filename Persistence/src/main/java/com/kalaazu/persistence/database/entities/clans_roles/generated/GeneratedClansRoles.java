package com.kalaazu.persistence.database.entities.clans_roles.generated;

import com.kalaazu.persistence.database.entities.Clans;
import com.kalaazu.persistence.database.entities.ClansRoles;
import com.kalaazu.persistence.database.entities.Manager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.ColumnIdentifier;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.util.OptionalUtil;
import com.speedment.runtime.field.*;
import com.speedment.runtime.typemapper.TypeMapper;

import java.util.OptionalInt;

/**
 * The generated base for the {@link
 * ClansRoles}-interface
 * representing entities of the {@code clans_roles}-table in the database.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedClansRoles {

    /**
     * This Field corresponds to the {@link ClansRoles} field that can be
     * obtained using the {@link ClansRoles#getId()} method.
     */
    IntField<ClansRoles, Integer> ID = IntField.create(
            Identifier.ID,
            ClansRoles::getId,
            ClansRoles::setId,
            TypeMapper.primitive(),
            true
    );

    /**
     * This Field corresponds to the {@link ClansRoles} field that can be
     * obtained using the {@link ClansRoles#getName()} method.
     */
    StringField<ClansRoles, String> NAME = StringField.create(
            Identifier.NAME,
            ClansRoles::getName,
            ClansRoles::setName,
            TypeMapper.identity(),
            false
    );

    /**
     * This Field corresponds to the {@link ClansRoles} field that can be
     * obtained using the {@link ClansRoles#getClansId()} method.
     */
    IntForeignKeyField<ClansRoles, Integer, Clans> CLANS_ID = IntForeignKeyField.create(
            Identifier.CLANS_ID,
            ClansRoles::getClansId,
            ClansRoles::setClansId,
            Clans.ID,
            TypeMapper.primitive(),
            false
    );

    /**
     * This Field corresponds to the {@link ClansRoles} field that can be
     * obtained using the {@link ClansRoles#getClansRolesId()} method.
     */
    ComparableField<ClansRoles, Integer, Integer> CLANS_ROLES_ID = ComparableField.create(
            Identifier.CLANS_ROLES_ID,
            o -> OptionalUtil.unwrap(o.getClansRolesId()),
            ClansRoles::setClansRolesId,
            TypeMapper.identity(),
            false
    );

    /**
     * This Field corresponds to the {@link ClansRoles} field that can be
     * obtained using the {@link ClansRoles#getPriority()} method.
     */
    ByteField<ClansRoles, Byte> PRIORITY = ByteField.create(
            Identifier.PRIORITY,
            ClansRoles::getPriority,
            ClansRoles::setPriority,
            TypeMapper.primitive(),
            false
    );

    /**
     * Returns the id of this ClansRoles. The id field corresponds to the
     * database column kalaazu.kalaazu.clans_roles.id.
     *
     * @return the id of this ClansRoles
     */
    Integer getId();

    /**
     * Returns the name of this ClansRoles. The name field corresponds to the
     * database column kalaazu.kalaazu.clans_roles.name.
     *
     * @return the name of this ClansRoles
     */
    String getName();

    /**
     * Returns the clansId of this ClansRoles. The clansId field corresponds to
     * the database column kalaazu.kalaazu.clans_roles.clans_id.
     *
     * @return the clansId of this ClansRoles
     */
    int getClansId();

    /**
     * Returns the clansRolesId of this ClansRoles. The clansRolesId field
     * corresponds to the database column
     * kalaazu.kalaazu.clans_roles.clans_roles_id.
     *
     * @return the clansRolesId of this ClansRoles
     */
    OptionalInt getClansRolesId();

    /**
     * Returns the priority of this ClansRoles. The priority field corresponds
     * to the database column kalaazu.kalaazu.clans_roles.priority.
     *
     * @return the priority of this ClansRoles
     */
    byte getPriority();

    /**
     * Sets the id of this ClansRoles. The id field corresponds to the database
     * column kalaazu.kalaazu.clans_roles.id.
     *
     * @param id to set of this ClansRoles
     *
     * @return this ClansRoles instance
     */
    ClansRoles setId(int id);

    /**
     * Sets the name of this ClansRoles. The name field corresponds to the
     * database column kalaazu.kalaazu.clans_roles.name.
     *
     * @param name to set of this ClansRoles
     *
     * @return this ClansRoles instance
     */
    ClansRoles setName(String name);

    /**
     * Sets the clansId of this ClansRoles. The clansId field corresponds to the
     * database column kalaazu.kalaazu.clans_roles.clans_id.
     *
     * @param clansId to set of this ClansRoles
     *
     * @return this ClansRoles instance
     */
    ClansRoles setClansId(int clansId);

    /**
     * Sets the clansRolesId of this ClansRoles. The clansRolesId field
     * corresponds to the database column
     * kalaazu.kalaazu.clans_roles.clans_roles_id.
     *
     * @param clansRolesId to set of this ClansRoles
     *
     * @return this ClansRoles instance
     */
    ClansRoles setClansRolesId(Integer clansRolesId);

    /**
     * Sets the priority of this ClansRoles. The priority field corresponds to
     * the database column kalaazu.kalaazu.clans_roles.priority.
     *
     * @param priority to set of this ClansRoles
     *
     * @return this ClansRoles instance
     */
    ClansRoles setPriority(byte priority);

    /**
     * Queries the specified manager for the referenced Clans. If no such Clans
     * exists, an {@code NullPointerException} will be thrown.
     *
     * @param foreignManager the manager to query for the entity
     *
     * @return the foreign entity referenced
     */
    Clans findClansId(Manager<Clans> foreignManager);

    enum Identifier implements ColumnIdentifier<ClansRoles> {

        ID("id"),
        NAME("name"),
        CLANS_ID("clans_id"),
        CLANS_ROLES_ID("clans_roles_id"),
        PRIORITY("priority");

        private final String columnName;

        private final TableIdentifier<ClansRoles> tableIdentifier;

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
            return "clans_roles";
        }

        @Override
        public String getColumnName() {
            return this.columnName;
        }

        @Override
        public TableIdentifier<ClansRoles> asTableIdentifier() {
            return this.tableIdentifier;
        }
    }
}