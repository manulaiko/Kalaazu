package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.clans_roles_permissions.generated.GeneratedClansRolesPermissions;
import com.kalaazu.persistence.database.entities.roles.RolePermission;

/**
 * The main interface for entities of the {@code clans_roles_permissions}-table
 * in the database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface ClansRolesPermissions extends GeneratedClansRolesPermissions, Entity<Integer>, RolePermission {
}