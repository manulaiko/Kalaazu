package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "moderators_roles", schema = "kalaazu", catalog = "")
public class ModeratorsRolesEntity {
    private byte   id;
    private String name;
    private Byte   moderatorsRolesId;
    private byte   priority;

    @Id
    @Column(name = "id", nullable = false)
    public byte getId() {
        return id;
    }

    public void setId(byte id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name", nullable = false, length = 255)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "moderators_roles_id", nullable = true)
    public Byte getModeratorsRolesId() {
        return moderatorsRolesId;
    }

    public void setModeratorsRolesId(Byte moderatorsRolesId) {
        this.moderatorsRolesId = moderatorsRolesId;
    }

    @Basic
    @Column(name = "priority", nullable = false)
    public byte getPriority() {
        return priority;
    }

    public void setPriority(byte priority) {
        this.priority = priority;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ModeratorsRolesEntity that = (ModeratorsRolesEntity) o;
        return id == that.id &&
               priority == that.priority &&
               Objects.equals(name, that.name) &&
               Objects.equals(moderatorsRolesId, that.moderatorsRolesId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, moderatorsRolesId, priority);
    }
}
