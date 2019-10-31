package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "accounts_drones", schema = "kalaazu", catalog = "")
public class AccountsDronesEntity {
    private int            id;
    private short          experience;
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
    @Column(name = "experience", nullable = false)
    public short getExperience() {
        return experience;
    }

    public void setExperience(short experience) {
        this.experience = experience;
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
        AccountsDronesEntity that = (AccountsDronesEntity) o;
        return id == that.id &&
               experience == that.experience &&
               Objects.equals(date, that.date);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, experience, date);
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
