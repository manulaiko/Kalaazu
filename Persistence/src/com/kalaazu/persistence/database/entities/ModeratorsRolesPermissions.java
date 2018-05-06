package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.moderators_roles_permissions.generated.GeneratedModeratorsRolesPermissions;
import com.kalaazu.persistence.database.entities.roles.RolePermission;

/**
 * Moderator's roles to permissions table.
 * =======================================
 *
 * Maps the different permissions to their role.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface ModeratorsRolesPermissions extends GeneratedModeratorsRolesPermissions, Entity<Byte>, RolePermission {
}