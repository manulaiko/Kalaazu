package com.kalaazu.persistence.database.entities.clans_roles;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.ClansRoles;
import com.kalaazu.persistence.database.entities.ClansRolesPermissions;
import com.kalaazu.persistence.database.entities.clans_roles.generated.GeneratedClansRolesImpl;
import com.kalaazu.persistence.database.entities.roles.Role;
import com.kalaazu.persistence.database.entities.roles.RolePermission;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * The default implementation of the {@link
 * ClansRoles}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class ClansRolesImpl
        extends GeneratedClansRolesImpl
        implements ClansRoles {
    /**
     * Parent role.
     */
    private Optional<ClansRoles> role;

    /**
     * Permissions.
     */
    private List<ClansRolesPermissions> permissions;

    @Override
    public Optional<ClansRoles> getRole() {
        if (this.role != null) {
            return this.role;
        }

        this.role = Optional.empty();

        super.getClansRolesId()
             .ifPresent(
                     i -> this.role = Database.getInstance()
                                              .find(i, ClansRoles.class)
             );

        return this.role;
    }

    @Override
    public List<ClansRolesPermissions> getPermissions() {
        if (this.permissions != null) {
            return this.permissions;
        }

        this.permissions = Database.getInstance()
                                   .all(ClansRolesPermissions.class)
                                   .filter(p -> p.getClansRolesId() == super.getId())
                                   .collect(Collectors.toList());

        return this.permissions;
    }
}