package com.manulaiko.kalaazu.persistence.database.entities;


import java.math.BigDecimal;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Level {
    private int id;

    private long account;

    private int drone;

    private int pet;

    private BigDecimal damage;

    private BigDecimal shield;

    private Collection<Account> accountsById;

    private Collection<AccountsDrone> accountsDronesById;

    private Collection<AccountsItem> accountsItemsById;

    private Collection<AccountsPet> accountsPetsById;

    private Collection<AccountsSkylab> accountsSkylabsById;

    private Collection<LevelsUpgrade> levelsUpgradesById;

    private Collection<Quest> questsById;

    private Collection<SkilltreeLevel> skilltreeLevelsById;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public long getAccount() {
        return account;
    }

    public void setAccount(long account) {
        this.account = account;
    }

    public int getDrone() {
        return drone;
    }

    public void setDrone(int drone) {
        this.drone = drone;
    }

    public int getPet() {
        return pet;
    }

    public void setPet(int pet) {
        this.pet = pet;
    }

    public BigDecimal getDamage() {
        return damage;
    }

    public void setDamage(BigDecimal damage) {
        this.damage = damage;
    }

    public BigDecimal getShield() {
        return shield;
    }

    public void setShield(BigDecimal shield) {
        this.shield = shield;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Level level = (Level) o;
        return id == level.id &&
               account == level.account &&
               drone == level.drone &&
               pet == level.pet &&
               Objects.equals(damage, level.damage) &&
               Objects.equals(shield, level.shield);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, account, drone, pet, damage, shield);
    }

    public Collection<Account> getAccountsById() {
        return accountsById;
    }

    public void setAccountsById(Collection<Account> accountsById) {
        this.accountsById = accountsById;
    }

    public Collection<AccountsDrone> getAccountsDronesById() {
        return accountsDronesById;
    }

    public void setAccountsDronesById(
            Collection<AccountsDrone> accountsDronesById
    ) {
        this.accountsDronesById = accountsDronesById;
    }

    public Collection<AccountsItem> getAccountsItemsById() {
        return accountsItemsById;
    }

    public void setAccountsItemsById(
            Collection<AccountsItem> accountsItemsById
    ) {
        this.accountsItemsById = accountsItemsById;
    }

    public Collection<AccountsPet> getAccountsPetsById() {
        return accountsPetsById;
    }

    public void setAccountsPetsById(
            Collection<AccountsPet> accountsPetsById
    ) {
        this.accountsPetsById = accountsPetsById;
    }

    public Collection<AccountsSkylab> getAccountsSkylabsById() {
        return accountsSkylabsById;
    }

    public void setAccountsSkylabsById(
            Collection<AccountsSkylab> accountsSkylabsById
    ) {
        this.accountsSkylabsById = accountsSkylabsById;
    }

    public Collection<LevelsUpgrade> getLevelsUpgradesById() {
        return levelsUpgradesById;
    }

    public void setLevelsUpgradesById(
            Collection<LevelsUpgrade> levelsUpgradesById
    ) {
        this.levelsUpgradesById = levelsUpgradesById;
    }

    public Collection<Quest> getQuestsById() {
        return questsById;
    }

    public void setQuestsById(Collection<Quest> questsById) {
        this.questsById = questsById;
    }

    public Collection<SkilltreeLevel> getSkilltreeLevelsById() {
        return skilltreeLevelsById;
    }

    public void setSkilltreeLevelsById(
            Collection<SkilltreeLevel> skilltreeLevelsById
    ) {
        this.skilltreeLevelsById = skilltreeLevelsById;
    }
}
