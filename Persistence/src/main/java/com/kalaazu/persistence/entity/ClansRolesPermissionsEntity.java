package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "clans_roles_permissions", schema = "kalaazu", catalog = "")
public class ClansRolesPermissionsEntity {
    private int              id;
    private Byte             isEnabled;
    private ClansRolesEntity clansRolesByClansRolesId;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "is_enabled", nullable = true)
    public Byte getIsEnabled() {
        return isEnabled;
    }

    public void setIsEnabled(Byte isEnabled) {
        this.isEnabled = isEnabled;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ClansRolesPermissionsEntity that = (ClansRolesPermissionsEntity) o;
        return id == that.id &&
               Objects.equals(isEnabled, that.isEnabled);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, isEnabled);
    }

    @ManyToOne
    @JoinColumn(name = "clans_roles_id", referencedColumnName = "id", nullable = false)
    public ClansRolesEntity getClansRolesByClansRolesId() {
        return clansRolesByClansRolesId;
    }

    public void setClansRolesByClansRolesId(ClansRolesEntity clansRolesByClansRolesId) {
        this.clansRolesByClansRolesId = clansRolesByClansRolesId;
    }
}
