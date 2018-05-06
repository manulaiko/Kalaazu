package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.permissions.generated.GeneratedPermissions;
import com.kalaazu.persistence.database.entities.roles.Permission;

/**
 * Permissions table.
 * ==================
 *
 * Contains the different permissions that can
 * be assigned to any role system.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Permissions extends GeneratedPermissions, Entity<Byte>, Permission {
}