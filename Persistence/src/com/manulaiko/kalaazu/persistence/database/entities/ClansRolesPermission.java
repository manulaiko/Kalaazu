package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class ClansRolesPermission {
    private int id;

    private int clansRolesId;

    private int permissionsId;

    private Boolean enabled;

    private ClansRole clansRolesByClansRolesId;

    private Permission permissionsByPermissionsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getClansRolesId() {
        return clansRolesId;
    }

    public void setClansRolesId(int clansRolesId) {
        this.clansRolesId = clansRolesId;
    }

    public int getPermissionsId() {
        return permissionsId;
    }

    public void setPermissionsId(int permissionsId) {
        this.permissionsId = permissionsId;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ClansRolesPermission that = (ClansRolesPermission) o;
        return id == that.id &&
               clansRolesId == that.clansRolesId &&
               permissionsId == that.permissionsId &&
               Objects.equals(enabled, that.enabled);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, clansRolesId, permissionsId, enabled);
    }

    public ClansRole getClansRolesByClansRolesId() {
        return clansRolesByClansRolesId;
    }

    public void setClansRolesByClansRolesId(
            ClansRole clansRolesByClansRolesId
    ) {
        this.clansRolesByClansRolesId = clansRolesByClansRolesId;
    }

    public Permission getPermissionsByPermissionsId() {
        return permissionsByPermissionsId;
    }

    public void setPermissionsByPermissionsId(
            Permission permissionsByPermissionsId
    ) {
        this.permissionsByPermissionsId = permissionsByPermissionsId;
    }
}
