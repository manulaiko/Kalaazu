package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.clans_roles_permissions.generated.GeneratedClansRolesPermissions;
import com.kalaazu.persistence.database.entities.roles.RolePermission;

/**
 * Clans' roles to permissions table.
 * ==================================
 *
 * Maps the permissions to their clan role.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface ClansRolesPermissions extends GeneratedClansRolesPermissions, Entity<Integer>, RolePermission {
}