package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "accounts_hangars", schema = "kalaazu", catalog = "")
public class AccountsHangarsEntity {
    private int            id;
    private Integer        accountsConfigurationsId;
    private String         name;
    private Byte           priority;
    private Timestamp      date;
    private AccountsEntity accountsByAccountsId;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "accounts_configurations_id", nullable = true)
    public Integer getAccountsConfigurationsId() {
        return accountsConfigurationsId;
    }

    public void setAccountsConfigurationsId(Integer accountsConfigurationsId) {
        this.accountsConfigurationsId = accountsConfigurationsId;
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
    @Column(name = "priority", nullable = true)
    public Byte getPriority() {
        return priority;
    }

    public void setPriority(Byte priority) {
        this.priority = priority;
    }

    @Basic
    @Column(name = "date", nullable = false)
    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AccountsHangarsEntity that = (AccountsHangarsEntity) o;
        return id == that.id &&
               Objects.equals(accountsConfigurationsId, that.accountsConfigurationsId) &&
               Objects.equals(name, that.name) &&
               Objects.equals(priority, that.priority) &&
               Objects.equals(date, that.date);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, accountsConfigurationsId, name, priority, date);
    }

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    public AccountsEntity getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(AccountsEntity accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }
}
