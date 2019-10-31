package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "accounts_quests", schema = "kalaazu", catalog = "")
public class AccountsQuestsEntity {
    private int            id;
    private byte           isCompleted;
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
    @Column(name = "is_completed", nullable = false)
    public byte getIsCompleted() {
        return isCompleted;
    }

    public void setIsCompleted(byte isCompleted) {
        this.isCompleted = isCompleted;
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
        AccountsQuestsEntity that = (AccountsQuestsEntity) o;
        return id == that.id &&
               isCompleted == that.isCompleted &&
               Objects.equals(date, that.date);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, isCompleted, date);
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
