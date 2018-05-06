package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.moderators_roles.generated.GeneratedModeratorsRoles;
import com.kalaazu.persistence.database.entities.roles.Role;

/**
 * The main interface for entities of the {@code moderators_roles}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface ModeratorsRoles extends GeneratedModeratorsRoles, Entity<Byte>, Role {
}