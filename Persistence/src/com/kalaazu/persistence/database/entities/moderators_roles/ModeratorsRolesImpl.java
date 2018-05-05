package com.kalaazu.persistence.database.entities.moderators_roles;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.ModeratorsRoles;
import com.kalaazu.persistence.database.entities.ModeratorsRolesPermissions;
import com.kalaazu.persistence.database.entities.Permissions;
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

    @Override
    public boolean can(Permissions permission) {
        var p = this.findPermission(permission);

        if (!p.isPresent()) {
            return this.parentCan(permission);
        }

        var enabled = p.get()
                       .getIsEnabled();

        if (enabled.isPresent()) {
            return enabled.getAsBoolean();
        }

        return this.parentCan(permission);
    }

    private Optional<ModeratorsRolesPermissions> findPermission(Permissions permissions) {
        for (ModeratorsRolesPermissions p : this.getPermissions()) {
            if (p.getPermissionsId() == permissions.getId()) {
                return Optional.of(p);
            }
        }

        return Optional.empty();
    }

    private boolean parentCan(Permissions permission) {
        if (!this.getRole().isPresent()) {
            return false;
        }

        return this.getRole()
                   .get()
                   .can(permission);
    }
}