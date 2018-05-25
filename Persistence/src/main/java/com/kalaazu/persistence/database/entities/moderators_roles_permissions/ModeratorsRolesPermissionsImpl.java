package com.kalaazu.persistence.database.entities.moderators_roles_permissions;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.ModeratorsRoles;
import com.kalaazu.persistence.database.entities.ModeratorsRolesPermissions;
import com.kalaazu.persistence.database.entities.Permissions;
import com.kalaazu.persistence.database.entities.moderators_roles_permissions.generated.GeneratedModeratorsRolesPermissionsImpl;

/**
 * The default implementation of the {@link
 * ModeratorsRolesPermissions}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class ModeratorsRolesPermissionsImpl
        extends GeneratedModeratorsRolesPermissionsImpl
        implements ModeratorsRolesPermissions {
    /**
     * The role.
     */
    private ModeratorsRoles role;

    /**
     * The permission.
     */
    private Permissions permission;

    @Override
    public ModeratorsRoles getRole() {
        if (this.role != null) {
            return this.role;
        }

        this.role = super.findModeratorsRolesId(
                Database.getInstance()
                        .getDb()
                        .manager(ModeratorsRoles.class)
        );

        return this.role;
    }

    @Override
    public Permissions getPermission() {
        if (this.permission != null) {
            return this.permission;
        }

        this.permission = super.findPermissionsId(
                Database.getInstance()
                        .getDb()
                        .manager(Permissions.class)
        );

        return this.permission;
    }

    @Override
    public int getRolesId() {
        return super.getModeratorsRolesId();
    }
}