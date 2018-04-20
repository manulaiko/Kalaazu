package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_destroys", schema = "kalaazu")
public class AccountsDestroy {
    private int id;

    private int accountsId;

    private int shipsId;

    private int points;

    private int amount;

    private Account accountsByAccountsId;

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
    @Column(name = "ships_id")
    public int getShipsId() {
        return shipsId;
    }

    public void setShipsId(int shipsId) {
        this.shipsId = shipsId;
    }

    @Basic
    @Column(name = "points")
    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    @Basic
    @Column(name = "amount")
    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
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
        AccountsDestroy that = (AccountsDestroy) o;
        return id == that.id &&
               accountsId == that.accountsId &&
               shipsId == that.shipsId &&
               points == that.points &&
               amount == that.amount;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, accountsId, shipsId, points, amount);
    }

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }
}
