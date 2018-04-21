package com.manulaiko.kalaazu.persistence.database.entities.clans_roles_permissions.generated;

import com.manulaiko.kalaazu.persistence.database.entities.clans_roles.ClansRoles;
import com.manulaiko.kalaazu.persistence.database.entities.clans_roles_permissions.ClansRolesPermissions;
import com.manulaiko.kalaazu.persistence.database.entities.permissions.Permissions;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.common.function.OptionalBoolean;
import com.speedment.runtime.config.identifier.ColumnIdentifier;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.Manager;
import com.speedment.runtime.core.util.OptionalUtil;
import com.speedment.runtime.field.ComparableField;
import com.speedment.runtime.field.IntField;
import com.speedment.runtime.field.IntForeignKeyField;
import com.speedment.runtime.typemapper.TypeMapper;

/**
 * The generated base for the {@link
 * com.manulaiko.kalaazu.persistence.database.entities.clans_roles_permissions.ClansRolesPermissions}-interface
 * representing entities of the {@code clans_roles_permissions}-table in the
 * database.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedClansRolesPermissions {
    
    /**
     * This Field corresponds to the {@link ClansRolesPermissions} field that
     * can be obtained using the {@link ClansRolesPermissions#getId()} method.
     */
    IntField<ClansRolesPermissions, Integer> ID = IntField.create(
        Identifier.ID,
        ClansRolesPermissions::getId,
        ClansRolesPermissions::setId,
        TypeMapper.primitive(),
        true
    );
    /**
     * This Field corresponds to the {@link ClansRolesPermissions} field that
     * can be obtained using the {@link ClansRolesPermissions#getClansRolesId()}
     * method.
     */
    IntForeignKeyField<ClansRolesPermissions, Integer, ClansRoles> CLANS_ROLES_ID = IntForeignKeyField.create(
        Identifier.CLANS_ROLES_ID,
        ClansRolesPermissions::getClansRolesId,
        ClansRolesPermissions::setClansRolesId,
        ClansRoles.ID,
        TypeMapper.primitive(),
        false
    );
    /**
     * This Field corresponds to the {@link ClansRolesPermissions} field that
     * can be obtained using the {@link
     * ClansRolesPermissions#getPermissionsId()} method.
     */
    IntForeignKeyField<ClansRolesPermissions, Integer, Permissions> PERMISSIONS_ID = IntForeignKeyField.create(
        Identifier.PERMISSIONS_ID,
        ClansRolesPermissions::getPermissionsId,
        ClansRolesPermissions::setPermissionsId,
        Permissions.ID,
        TypeMapper.primitive(),
        false
    );
    /**
     * This Field corresponds to the {@link ClansRolesPermissions} field that
     * can be obtained using the {@link ClansRolesPermissions#getEnabled()}
     * method.
     */
    ComparableField<ClansRolesPermissions, Boolean, Boolean> ENABLED = ComparableField.create(
        Identifier.ENABLED,
        o -> OptionalUtil.unwrap(o.getEnabled()),
        ClansRolesPermissions::setEnabled,
        TypeMapper.identity(),
        false
    );
    
    /**
     * Returns the id of this ClansRolesPermissions. The id field corresponds to
     * the database column kalaazu.kalaazu.clans_roles_permissions.id.
     * 
     * @return the id of this ClansRolesPermissions
     */
    int getId();
    
    /**
     * Returns the clansRolesId of this ClansRolesPermissions. The clansRolesId
     * field corresponds to the database column
     * kalaazu.kalaazu.clans_roles_permissions.clans_roles_id.
     * 
     * @return the clansRolesId of this ClansRolesPermissions
     */
    int getClansRolesId();
    
    /**
     * Returns the permissionsId of this ClansRolesPermissions. The
     * permissionsId field corresponds to the database column
     * kalaazu.kalaazu.clans_roles_permissions.permissions_id.
     * 
     * @return the permissionsId of this ClansRolesPermissions
     */
    int getPermissionsId();
    
    /**
     * Returns the enabled of this ClansRolesPermissions. The enabled field
     * corresponds to the database column
     * kalaazu.kalaazu.clans_roles_permissions.enabled.
     * 
     * @return the enabled of this ClansRolesPermissions
     */
    OptionalBoolean getEnabled();
    
    /**
     * Sets the id of this ClansRolesPermissions. The id field corresponds to
     * the database column kalaazu.kalaazu.clans_roles_permissions.id.
     * 
     * @param id to set of this ClansRolesPermissions
     * @return   this ClansRolesPermissions instance
     */
    ClansRolesPermissions setId(int id);
    
    /**
     * Sets the clansRolesId of this ClansRolesPermissions. The clansRolesId
     * field corresponds to the database column
     * kalaazu.kalaazu.clans_roles_permissions.clans_roles_id.
     * 
     * @param clansRolesId to set of this ClansRolesPermissions
     * @return             this ClansRolesPermissions instance
     */
    ClansRolesPermissions setClansRolesId(int clansRolesId);
    
    /**
     * Sets the permissionsId of this ClansRolesPermissions. The permissionsId
     * field corresponds to the database column
     * kalaazu.kalaazu.clans_roles_permissions.permissions_id.
     * 
     * @param permissionsId to set of this ClansRolesPermissions
     * @return              this ClansRolesPermissions instance
     */
    ClansRolesPermissions setPermissionsId(int permissionsId);
    
    /**
     * Sets the enabled of this ClansRolesPermissions. The enabled field
     * corresponds to the database column
     * kalaazu.kalaazu.clans_roles_permissions.enabled.
     * 
     * @param enabled to set of this ClansRolesPermissions
     * @return        this ClansRolesPermissions instance
     */
    ClansRolesPermissions setEnabled(Boolean enabled);
    
    /**
     * Queries the specified manager for the referenced ClansRoles. If no such
     * ClansRoles exists, an {@code NullPointerException} will be thrown.
     * 
     * @param foreignManager the manager to query for the entity
     * @return               the foreign entity referenced
     */
    ClansRoles findClansRolesId(Manager<ClansRoles> foreignManager);
    
    /**
     * Queries the specified manager for the referenced Permissions. If no such
     * Permissions exists, an {@code NullPointerException} will be thrown.
     * 
     * @param foreignManager the manager to query for the entity
     * @return               the foreign entity referenced
     */
    Permissions findPermissionsId(Manager<Permissions> foreignManager);
    
    enum Identifier implements ColumnIdentifier<ClansRolesPermissions> {
        
        ID             ("id"),
        CLANS_ROLES_ID ("clans_roles_id"),
        PERMISSIONS_ID ("permissions_id"),
        ENABLED        ("enabled");
        
        private final String columnName;
        private final TableIdentifier<ClansRolesPermissions> tableIdentifier;
        
        Identifier(String columnName) {
            this.columnName      = columnName;
            this.tableIdentifier = TableIdentifier.of(    getDbmsName(), 
                getSchemaName(), 
                getTableName());
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
            return "clans_roles_permissions";
        }
        
        @Override
        public String getColumnName() {
            return this.columnName;
        }
        
        @Override
        public TableIdentifier<ClansRolesPermissions> asTableIdentifier() {
            return this.tableIdentifier;
        }
    }
}