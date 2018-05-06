package com.kalaazu.persistence.database.entities.moderators_roles;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.ModeratorsRoles;
import com.kalaazu.persistence.database.entities.ModeratorsRolesPermissions;
import com.kalaazu.persistence.database.entities.moderators_roles.generated.GeneratedModeratorsRolesImpl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * The default implementation of the {@link
 * ModeratorsRoles}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class ModeratorsRolesImpl
        extends GeneratedModeratorsRolesImpl
        implements ModeratorsRoles {
    /**
     * Parent role.
     */
    private Optional<ModeratorsRoles> role;

    /**
     * Permissions.
     */
    private List<ModeratorsRolesPermissions> permissions;

    @Override
    public Optional<ModeratorsRoles> getRole() {
        if (this.role != null) {
            return this.role;
        }

        this.role = Optional.empty();

        super.getModeratorsRolesId()
             .ifPresent(
                     i -> this.role = Database.getInstance()
                                              .find(i, ModeratorsRoles.class)
             );

        return this.role;
    }

    @Override
    public List<ModeratorsRolesPermissions> getPermissions() {
        if (this.permissions != null) {
            return this.permissions;
        }

        this.permissions = Database.getInstance()
                                   .all(ModeratorsRolesPermissions.class)
                                   .filter(p -> p.getModeratorsRolesId() == super.getId())
                                   .collect(Collectors.toList());

        return this.permissions;
    }
}