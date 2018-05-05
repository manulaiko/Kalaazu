package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.moderators_roles.generated.GeneratedModeratorsRoles;

import java.util.List;
import java.util.Optional;

/**
 * The main interface for entities of the {@code moderators_roles}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface ModeratorsRoles extends GeneratedModeratorsRoles, Entity<Byte> {
    /**
     * Returns parent role.
     *
     * @return Parent role.
     */
    Optional<ModeratorsRoles> getRole();

    /**
     * Returns role's permissions.
     *
     * @return Role's permissions.
     */
    List<ModeratorsRolesPermissions> getPermissions();

    /**
     * Checks if the give permission is allowed.
     *
     * @param permission Permission to check.
     *
     * @return Whether this role has `permission` enabled or not.
     */
    boolean can(Permissions permission);
}