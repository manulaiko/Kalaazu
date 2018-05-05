package com.kalaazu.persistence.database.entities.moderators_roles_permissions.generated;

import com.kalaazu.persistence.database.entities.ModeratorsRolesPermissions;
import com.kalaazu.persistence.database.entities.moderators_roles_permissions.ModeratorsRolesPermissionsManager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.AbstractManager;
import com.speedment.runtime.field.Field;

import java.util.stream.Stream;

/**
 * The generated base implementation for the manager of every {@link
 * ModeratorsRolesPermissions}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedModeratorsRolesPermissionsManagerImpl
        extends AbstractManager<ModeratorsRolesPermissions>
        implements GeneratedModeratorsRolesPermissionsManager {

    private final TableIdentifier<ModeratorsRolesPermissions> tableIdentifier;

    protected GeneratedModeratorsRolesPermissionsManagerImpl() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "moderators_roles_permissions");
    }

    @Override
    public TableIdentifier<ModeratorsRolesPermissions> getTableIdentifier() {
        return tableIdentifier;
    }

    @Override
    public Stream<Field<ModeratorsRolesPermissions>> fields() {
        return ModeratorsRolesPermissionsManager.FIELDS.stream();
    }

    @Override
    public Stream<Field<ModeratorsRolesPermissions>> primaryKeyFields() {
        return Stream.of(
                ModeratorsRolesPermissions.ID
        );
    }
}