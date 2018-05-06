package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.moderators_roles.generated.GeneratedModeratorsRoles;
import com.kalaazu.persistence.database.entities.roles.Role;

/**
 * Moderators' roles table.
 * ========================
 *
 * Contains the roles a moderator can have.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface ModeratorsRoles extends GeneratedModeratorsRoles, Entity<Byte>, Role {
}