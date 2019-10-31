package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "accounts_destroys", schema = "kalaazu", catalog = "")
public class AccountsDestroysEntity {
    private int            id;
    private byte           shipsId;
    private short          points;
    private short          amount;
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
    @Column(name = "ships_id", nullable = false)
    public byte getShipsId() {
        return shipsId;
    }

    public void setShipsId(byte shipsId) {
        this.shipsId = shipsId;
    }

    @Basic
    @Column(name = "points", nullable = false)
    public short getPoints() {
        return points;
    }

    public void setPoints(short points) {
        this.points = points;
    }

    @Basic
    @Column(name = "amount", nullable = false)
    public short getAmount() {
        return amount;
    }

    public void setAmount(short amount) {
        this.amount = amount;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AccountsDestroysEntity that = (AccountsDestroysEntity) o;
        return id == that.id &&
               shipsId == that.shipsId &&
               points == that.points &&
               amount == that.amount;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, shipsId, points, amount);
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
