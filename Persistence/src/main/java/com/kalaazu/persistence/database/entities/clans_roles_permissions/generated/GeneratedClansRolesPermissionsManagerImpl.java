package com.kalaazu.persistence.database.entities.clans_roles_permissions.generated;

import com.kalaazu.persistence.database.entities.ClansRolesPermissions;
import com.kalaazu.persistence.database.entities.clans_roles_permissions.ClansRolesPermissionsManager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.AbstractManager;
import com.speedment.runtime.field.Field;

import java.util.stream.Stream;

/**
 * The generated base implementation for the manager of every {@link
 * ClansRolesPermissions}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedClansRolesPermissionsManagerImpl
        extends AbstractManager<ClansRolesPermissions>
        implements GeneratedClansRolesPermissionsManager {

    private final TableIdentifier<ClansRolesPermissions> tableIdentifier;

    protected GeneratedClansRolesPermissionsManagerImpl() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "clans_roles_permissions");
    }

    @Override
    public TableIdentifier<ClansRolesPermissions> getTableIdentifier() {
        return tableIdentifier;
    }

    @Override
    public Stream<Field<ClansRolesPermissions>> fields() {
        return ClansRolesPermissionsManager.FIELDS.stream();
    }

    @Override
    public Stream<Field<ClansRolesPermissions>> primaryKeyFields() {
        return Stream.of(
                ClansRolesPermissions.ID
        );
    }
}