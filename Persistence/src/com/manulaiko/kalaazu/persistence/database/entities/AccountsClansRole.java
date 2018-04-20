package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_clans_roles", schema = "kalaazu")
public class AccountsClansRole {
    private int id;

    private int accountsId;

    private int clansRolesId;

    private Account accountsByAccountsId;

    private ClansRole clansRolesByClansRolesId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "accounts_id")
    public int getAccountsId() {
        return accountsId;
    }

    public void setAccountsId(int accountsId) {
        this.accountsId = accountsId;
    }

    @Basic
    @Column(name = "clans_roles_id")
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

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }

    @ManyToOne
    @JoinColumn(name = "clans_roles_id", referencedColumnName = "id", nullable = false)
    public ClansRole getClansRolesByClansRolesId() {
        return clansRolesByClansRolesId;
    }

    public void setClansRolesByClansRolesId(
            ClansRole clansRolesByClansRolesId
    ) {
        this.clansRolesByClansRolesId = clansRolesByClansRolesId;
    }
}
