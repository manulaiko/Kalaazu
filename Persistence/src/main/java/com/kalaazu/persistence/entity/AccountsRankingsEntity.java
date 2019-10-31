package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "accounts_rankings", schema = "kalaazu", catalog = "")
public class AccountsRankingsEntity {
    private int            id;
    private int            points;
    private int            bestPoints;
    private short          destroyedAllies;
    private short          destroyedPhoenix;
    private short          destroyedTimes;
    private short          destroyedRadiation;
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
    @Column(name = "points", nullable = false)
    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    @Basic
    @Column(name = "best_points", nullable = false)
    public int getBestPoints() {
        return bestPoints;
    }

    public void setBestPoints(int bestPoints) {
        this.bestPoints = bestPoints;
    }

    @Basic
    @Column(name = "destroyed_allies", nullable = false)
    public short getDestroyedAllies() {
        return destroyedAllies;
    }

    public void setDestroyedAllies(short destroyedAllies) {
        this.destroyedAllies = destroyedAllies;
    }

    @Basic
    @Column(name = "destroyed_phoenix", nullable = false)
    public short getDestroyedPhoenix() {
        return destroyedPhoenix;
    }

    public void setDestroyedPhoenix(short destroyedPhoenix) {
        this.destroyedPhoenix = destroyedPhoenix;
    }

    @Basic
    @Column(name = "destroyed_times", nullable = false)
    public short getDestroyedTimes() {
        return destroyedTimes;
    }

    public void setDestroyedTimes(short destroyedTimes) {
        this.destroyedTimes = destroyedTimes;
    }

    @Basic
    @Column(name = "destroyed_radiation", nullable = false)
    public short getDestroyedRadiation() {
        return destroyedRadiation;
    }

    public void setDestroyedRadiation(short destroyedRadiation) {
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
        AccountsRankingsEntity that = (AccountsRankingsEntity) o;
        return id == that.id &&
               points == that.points &&
               bestPoints == that.bestPoints &&
               destroyedAllies == that.destroyedAllies &&
               destroyedPhoenix == that.destroyedPhoenix &&
               destroyedTimes == that.destroyedTimes &&
               destroyedRadiation == that.destroyedRadiation;
    }

    @Override
    public int hashCode() {
        return Objects.hash(
                id,
                points,
                bestPoints,
                destroyedAllies,
                destroyedPhoenix,
                destroyedTimes,
                destroyedRadiation
        );
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
