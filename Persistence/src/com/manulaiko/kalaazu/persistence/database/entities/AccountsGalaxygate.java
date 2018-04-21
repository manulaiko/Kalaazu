package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class AccountsGalaxygate {
    private int id;

    private int galaxygatesId;

    private int accountsId;

    private int parts;

    private int lifes;

    private int wave;

    private int times;

    private boolean isCompleted;

    private Galaxygate galaxygatesByGalaxygatesId;

    private Account accountsByAccountsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGalaxygatesId() {
        return galaxygatesId;
    }

    public void setGalaxygatesId(int galaxygatesId) {
        this.galaxygatesId = galaxygatesId;
    }

    public int getAccountsId() {
        return accountsId;
    }

    public void setAccountsId(int accountsId) {
        this.accountsId = accountsId;
    }

    public int getParts() {
        return parts;
    }

    public void setParts(int parts) {
        this.parts = parts;
    }

    public int getLifes() {
        return lifes;
    }

    public void setLifes(int lifes) {
        this.lifes = lifes;
    }

    public int getWave() {
        return wave;
    }

    public void setWave(int wave) {
        this.wave = wave;
    }

    public int getTimes() {
        return times;
    }

    public void setTimes(int times) {
        this.times = times;
    }

    public boolean isCompleted() {
        return isCompleted;
    }

    public void setCompleted(boolean completed) {
        isCompleted = completed;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AccountsGalaxygate that = (AccountsGalaxygate) o;
        return id == that.id &&
               galaxygatesId == that.galaxygatesId &&
               accountsId == that.accountsId &&
               parts == that.parts &&
               lifes == that.lifes &&
               wave == that.wave &&
               times == that.times &&
               isCompleted == that.isCompleted;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, galaxygatesId, accountsId, parts, lifes, wave, times, isCompleted);
    }

    public Galaxygate getGalaxygatesByGalaxygatesId() {
        return galaxygatesByGalaxygatesId;
    }

    public void setGalaxygatesByGalaxygatesId(
            Galaxygate galaxygatesByGalaxygatesId
    ) {
        this.galaxygatesByGalaxygatesId = galaxygatesByGalaxygatesId;
    }

    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }
}
