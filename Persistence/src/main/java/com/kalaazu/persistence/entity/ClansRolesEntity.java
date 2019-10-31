package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "clans_roles", schema = "kalaazu", catalog = "")
public class ClansRolesEntity {
    private int         id;
    private String      name;
    private Integer     clansRolesId;
    private byte        priority;
    private ClansEntity clansByClansId;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
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
    @Column(name = "clans_roles_id", nullable = true)
    public Integer getClansRolesId() {
        return clansRolesId;
    }

    public void setClansRolesId(Integer clansRolesId) {
        this.clansRolesId = clansRolesId;
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
        ClansRolesEntity that = (ClansRolesEntity) o;
        return id == that.id &&
               priority == that.priority &&
               Objects.equals(name, that.name) &&
               Objects.equals(clansRolesId, that.clansRolesId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, clansRolesId, priority);
    }

    @ManyToOne
    @JoinColumn(name = "clans_id", referencedColumnName = "id", nullable = false)
    public ClansEntity getClansByClansId() {
        return clansByClansId;
    }

    public void setClansByClansId(ClansEntity clansByClansId) {
        this.clansByClansId = clansByClansId;
    }
}
