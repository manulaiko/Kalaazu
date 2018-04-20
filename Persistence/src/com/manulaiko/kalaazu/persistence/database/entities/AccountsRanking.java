package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_rankings", schema = "kalaazu")
public class AccountsRanking {
    private int id;

    private int accountsId;

    private int points;

    private int bestPoints;

    private int destroyedAllies;

    private int destroyedPhoenix;

    private int destroyedTimes;

    private int destroyedRadiation;

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
    @Column(name = "points")
    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    @Basic
    @Column(name = "best_points")
    public int getBestPoints() {
        return bestPoints;
    }

    public void setBestPoints(int bestPoints) {
        this.bestPoints = bestPoints;
    }

    @Basic
    @Column(name = "destroyed_allies")
    public int getDestroyedAllies() {
        return destroyedAllies;
    }

    public void setDestroyedAllies(int destroyedAllies) {
        this.destroyedAllies = destroyedAllies;
    }

    @Basic
    @Column(name = "destroyed_phoenix")
    public int getDestroyedPhoenix() {
        return destroyedPhoenix;
    }

    public void setDestroyedPhoenix(int destroyedPhoenix) {
        this.destroyedPhoenix = destroyedPhoenix;
    }

    @Basic
    @Column(name = "destroyed_times")
    public int getDestroyedTimes() {
        return destroyedTimes;
    }

    public void setDestroyedTimes(int destroyedTimes) {
        this.destroyedTimes = destroyedTimes;
    }

    @Basic
    @Column(name = "destroyed_radiation")
    public int getDestroyedRadiation() {
        return destroyedRadiation;
    }

    public void setDestroyedRadiation(int destroyedRadiation) {
        this.destroyedRadiation = destroyedRadiation;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AccountsRanking that = (AccountsRanking) o;
        return id == that.id &&
               accountsId == that.accountsId &&
               points == that.points &&
               bestPoints == that.bestPoints &&
               destroyedAllies == that.destroyedAllies &&
               destroyedPhoenix == that.destroyedPhoenix &&
               destroyedTimes == that.destroyedTimes &&
               destroyedRadiation == that.destroyedRadiation;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, accountsId, points, bestPoints, destroyedAllies, destroyedPhoenix, destroyedTimes,
                            destroyedRadiation
        );
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
