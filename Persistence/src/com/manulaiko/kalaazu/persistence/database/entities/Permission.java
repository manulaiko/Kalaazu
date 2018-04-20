package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "permissions", schema = "kalaazu")
public class Permission {
    private int id;

    private String name;

    private String category;

    private Collection<ClansRolesPermission> clansRolesPermissionsById;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "category")
    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Permission that = (Permission) o;
        return id == that.id &&
               Objects.equals(name, that.name) &&
               Objects.equals(category, that.category);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, name, category);
    }

    @OneToMany(mappedBy = "permissionsByPermissionsId")
    public Collection<ClansRolesPermission> getClansRolesPermissionsById() {
        return clansRolesPermissionsById;
    }

    public void setClansRolesPermissionsById(
            Collection<ClansRolesPermission> clansRolesPermissionsById
    ) {
        this.clansRolesPermissionsById = clansRolesPermissionsById;
    }
}
