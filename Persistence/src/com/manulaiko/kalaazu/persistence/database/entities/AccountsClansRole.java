package com.manulaiko.kalaazu.persistence.database.entities;

import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class AccountsClansRole {
    private int id;
    private int accountsId;
    private int clansRolesId;

    private Account accountsByAccountsId;
    private ClansRole clansRolesByClansRolesId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountsId() {
        return accountsId;
    }

    public void setAccountsId(int accountsId) {
        this.accountsId = accountsId;
    }

    public int getClansRolesId() {
        return clansRolesId;
    }

    public void setClansRolesId(int clansRolesId) {
        this.clansRolesId = clansRolesId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AccountsClansRole that = (AccountsClansRole) o;
        return id == that.id &&
               accountsId == that.accountsId &&
               clansRolesId == that.clansRolesId;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, accountsId, clansRolesId);
    }

    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }

    public ClansRole getClansRolesByClansRolesId() {
        return clansRolesByClansRolesId;
    }

    public void setClansRolesByClansRolesId(
            ClansRole clansRolesByClansRolesId
    ) {
        this.clansRolesByClansRolesId = clansRolesByClansRolesId;
    }
}
