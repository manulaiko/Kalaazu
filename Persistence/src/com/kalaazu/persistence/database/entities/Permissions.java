package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.permissions.generated.GeneratedPermissions;
import com.kalaazu.persistence.database.entities.roles.Permission;

/**
 * The main interface for entities of the {@code permissions}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Permissions extends GeneratedPermissions, Entity<Byte>, Permission {
}