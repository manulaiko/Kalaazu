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
    Role getRole();

    /**
     * Returns the role ID.
     *
     * @return Role ID.
     */
    int getRolesId();

    /**
     * Returns the permission.
     *
     * @return The permission.
     */
    Permissions getPermission();

    /**
     * Returns the permission ID.
     *
     * @return Permission ID.
     */
    byte getPermissionsId();

    /**
     * Returns whether the permission is enabled or not.
     *
     * @return Whether the permission is enabled or not.
     */
    OptionalBoolean getIsEnabled();
}
