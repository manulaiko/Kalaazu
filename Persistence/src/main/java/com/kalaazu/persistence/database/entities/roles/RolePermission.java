package com.kalaazu.persistence.database.entities.roles;

import com.kalaazu.persistence.database.entities.Permissions;
import com.speedment.common.function.OptionalBoolean;

/**
 * Role permission interface.
 * ==========================
 *
 * Base interface for all role permissions.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface RolePermission {
    /**
     * Returns the role.
     *
     * @return The role.
     */
    Role role();

    /**
     * Returns the role ID.
     *
     * @return Role ID.
     */
    int roleId();

    /**
     * Returns the permission.
     *
     * @return The permission.
     */
    Permissions permission();

    /**
     * Returns the permission ID.
     *
     * @return Permission ID.
     */
    byte permissionsId();

    /**
     * Returns whether the permission is enabled or not.
     *
     * @return Whether the permission is enabled or not.
     */
    OptionalBoolean isEnabled();
}
