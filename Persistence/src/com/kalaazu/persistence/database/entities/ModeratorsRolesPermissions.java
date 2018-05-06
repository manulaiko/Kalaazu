package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.moderators_roles_permissions.generated.GeneratedModeratorsRolesPermissions;
import com.kalaazu.persistence.database.entities.roles.RolePermission;

/**
 * The main interface for entities of the {@code
 * moderators_roles_permissions}-table in the database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface ModeratorsRolesPermissions extends GeneratedModeratorsRolesPermissions, Entity<Byte>, RolePermission {
}