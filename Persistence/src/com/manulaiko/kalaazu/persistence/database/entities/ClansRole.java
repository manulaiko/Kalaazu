package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class ClansRole {
    private int id;

    private String name;

    private int clansId;

    private Integer clansRolesId;

    private int priority;

    private Collection<AccountsClansRole> accountsClansRolesById;

    private Clan clansByClansId;

    private Collection<ClansRolesPermission> clansRolesPermissionsById;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getClansId() {
        return clansId;
    }

    public void setClansId(int clansId) {
        this.clansId = clansId;
    }

    public Integer getClansRolesId() {
        return clansRolesId;
    }

    public void setClansRolesId(Integer clansRolesId) {
        this.clansRolesId = clansRolesId;
    }

    public int getPriority() {
        return priority;
    }

    public void setPriority(int priority) {
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
        ClansRole clansRole = (ClansRole) o;
        return id == clansRole.id &&
               clansId == clansRole.clansId &&
               priority == clansRole.priority &&
               Objects.equals(name, clansRole.name) &&
               Objects.equals(clansRolesId, clansRole.clansRolesId);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, name, clansId, clansRolesId, priority);
    }

    public Collection<AccountsClansRole> getAccountsClansRolesById() {
        return accountsClansRolesById;
    }

    public void setAccountsClansRolesById(
            Collection<AccountsClansRole> accountsClansRolesById
    ) {
        this.accountsClansRolesById = accountsClansRolesById;
    }

    public Clan getClansByClansId() {
        return clansByClansId;
    }

    public void setClansByClansId(Clan clansByClansId) {
        this.clansByClansId = clansByClansId;
    }

    public Collection<ClansRolesPermission> getClansRolesPermissionsById() {
        return clansRolesPermissionsById;
    }

    public void setClansRolesPermissionsById(
            Collection<ClansRolesPermission> clansRolesPermissionsById
    ) {
        this.clansRolesPermissionsById = clansRolesPermissionsById;
    }
}
