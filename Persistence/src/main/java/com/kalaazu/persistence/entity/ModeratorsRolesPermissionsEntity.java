package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "moderators_roles_permissions", schema = "kalaazu", catalog = "")
public class ModeratorsRolesPermissionsEntity {
    private byte                  id;
    private Byte                  isEnabled;
    private ModeratorsRolesEntity moderatorsRolesByModeratorsRolesId;

    @Id
    @Column(name = "id", nullable = false)
    public byte getId() {
        return id;
    }

    public void setId(byte id) {
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
        ModeratorsRolesPermissionsEntity that = (ModeratorsRolesPermissionsEntity) o;
        return id == that.id &&
               Objects.equals(isEnabled, that.isEnabled);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, isEnabled);
    }

    @ManyToOne
    @JoinColumn(name = "moderators_roles_id", referencedColumnName = "id", nullable = false)
    public ModeratorsRolesEntity getModeratorsRolesByModeratorsRolesId() {
        return moderatorsRolesByModeratorsRolesId;
    }

    public void setModeratorsRolesByModeratorsRolesId(
            ModeratorsRolesEntity moderatorsRolesByModeratorsRolesId
    ) {
        this.moderatorsRolesByModeratorsRolesId = moderatorsRolesByModeratorsRolesId;
    }
}
