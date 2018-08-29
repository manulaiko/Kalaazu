package com.kalaazu.persistence.database.entities.clans_roles_permissions;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.ClansRoles;
import com.kalaazu.persistence.database.entities.ClansRolesPermissions;
import com.kalaazu.persistence.database.entities.ModeratorsRoles;
import com.kalaazu.persistence.database.entities.Permissions;
import com.kalaazu.persistence.database.entities.clans_roles_permissions.generated.GeneratedClansRolesPermissionsImpl;

/**
 * The default implementation of the {@link
 * ClansRolesPermissions}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class ClansRolesPermissionsImpl
        extends GeneratedClansRolesPermissionsImpl
        implements ClansRolesPermissions {
    /**
     * The role.
     */
    private ClansRoles role;

    /**
     * The permission.
     */
    private Permissions permission;

    @Override
    public ClansRoles role() {
        if (this.role != null) {
            return this.role;
        }

        this.role = super.findClansRolesId(
                Database.instance()
                        .db()
                        .manager(ModeratorsRoles.class)
        );

        return this.role;
    }

    @Override
    public Permissions permission() {
        if (this.permission != null) {
            return this.permission;
        }

        this.permission = super.findPermissionsId(
                Database.instance()
                        .db()
                        .manager(Permissions.class)
        );

        return this.permission;
    }

    @Override
    public int roleId() {
        return super.clansRolesId();
    }
}