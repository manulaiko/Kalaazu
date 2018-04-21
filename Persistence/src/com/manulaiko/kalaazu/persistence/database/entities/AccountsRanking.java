package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
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

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public int getBestPoints() {
        return bestPoints;
    }

    public void setBestPoints(int bestPoints) {
        this.bestPoints = bestPoints;
    }

    public int getDestroyedAllies() {
        return destroyedAllies;
    }

    public void setDestroyedAllies(int destroyedAllies) {
        this.destroyedAllies = destroyedAllies;
    }

    public int getDestroyedPhoenix() {
        return destroyedPhoenix;
    }

    public void setDestroyedPhoenix(int destroyedPhoenix) {
        this.destroyedPhoenix = destroyedPhoenix;
    }

    public int getDestroyedTimes() {
        return destroyedTimes;
    }

    public void setDestroyedTimes(int destroyedTimes) {
        this.destroyedTimes = destroyedTimes;
    }

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

    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }
}
