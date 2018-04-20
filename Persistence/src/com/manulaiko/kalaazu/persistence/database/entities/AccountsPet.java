package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_pets", schema = "kalaazu")
public class AccountsPet {
    private int id;

    private int accountsId;

    private int levelsId;

    private String name;

    private int experience;

    private int fuel;

    private int health;

    private int slotsLasersTotal;

    private int slotsLasersAvailable;

    private int slotsGeneratorsTotal;

    private int slotsGeneratorsAvailable;

    private int slotsProtocolsTotal;

    private int slotsProtocolsAvailable;

    private int slotsGearsTotal;

    private int slotsGearsAvailable;

    private Collection<AccountsConfigurationsAccountsItem> accountsConfigurationsAccountsItemsById;

    private Account accountsByAccountsId;

    private Level levelsByLevelsId;

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
    @Column(name = "levels_id")
    public int getLevelsId() {
        return levelsId;
    }

    public void setLevelsId(int levelsId) {
        this.levelsId = levelsId;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "experience")
    public int getExperience() {
        return experience;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }

    @Basic
    @Column(name = "fuel")
    public int getFuel() {
        return fuel;
    }

    public void setFuel(int fuel) {
        this.fuel = fuel;
    }

    @Basic
    @Column(name = "health")
    public int getHealth() {
        return health;
    }

    public void setHealth(int health) {
        this.health = health;
    }

    @Basic
    @Column(name = "slots_lasers_total")
    public int getSlotsLasersTotal() {
        return slotsLasersTotal;
    }

    public void setSlotsLasersTotal(int slotsLasersTotal) {
        this.slotsLasersTotal = slotsLasersTotal;
    }

    @Basic
    @Column(name = "slots_lasers_available")
    public int getSlotsLasersAvailable() {
        return slotsLasersAvailable;
    }

    public void setSlotsLasersAvailable(int slotsLasersAvailable) {
        this.slotsLasersAvailable = slotsLasersAvailable;
    }

    @Basic
    @Column(name = "slots_generators_total")
    public int getSlotsGeneratorsTotal() {
        return slotsGeneratorsTotal;
    }

    public void setSlotsGeneratorsTotal(int slotsGeneratorsTotal) {
        this.slotsGeneratorsTotal = slotsGeneratorsTotal;
    }

    @Basic
    @Column(name = "slots_generators_available")
    public int getSlotsGeneratorsAvailable() {
        return slotsGeneratorsAvailable;
    }

    public void setSlotsGeneratorsAvailable(int slotsGeneratorsAvailable) {
        this.slotsGeneratorsAvailable = slotsGeneratorsAvailable;
    }

    @Basic
    @Column(name = "slots_protocols_total")
    public int getSlotsProtocolsTotal() {
        return slotsProtocolsTotal;
    }

    public void setSlotsProtocolsTotal(int slotsProtocolsTotal) {
        this.slotsProtocolsTotal = slotsProtocolsTotal;
    }

    @Basic
    @Column(name = "slots_protocols_available")
    public int getSlotsProtocolsAvailable() {
        return slotsProtocolsAvailable;
    }

    public void setSlotsProtocolsAvailable(int slotsProtocolsAvailable) {
        this.slotsProtocolsAvailable = slotsProtocolsAvailable;
    }

    @Basic
    @Column(name = "slots_gears_total")
    public int getSlotsGearsTotal() {
        return slotsGearsTotal;
    }

    public void setSlotsGearsTotal(int slotsGearsTotal) {
        this.slotsGearsTotal = slotsGearsTotal;
    }

    @Basic
    @Column(name = "slots_gears_available")
    public int getSlotsGearsAvailable() {
        return slotsGearsAvailable;
    }

    public void setSlotsGearsAvailable(int slotsGearsAvailable) {
        this.slotsGearsAvailable = slotsGearsAvailable;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AccountsPet that = (AccountsPet) o;
        return id == that.id &&
               accountsId == that.accountsId &&
               levelsId == that.levelsId &&
               experience == that.experience &&
               fuel == that.fuel &&
               health == that.health &&
               slotsLasersTotal == that.slotsLasersTotal &&
               slotsLasersAvailable == that.slotsLasersAvailable &&
               slotsGeneratorsTotal == that.slotsGeneratorsTotal &&
               slotsGeneratorsAvailable == that.slotsGeneratorsAvailable &&
               slotsProtocolsTotal == that.slotsProtocolsTotal &&
               slotsProtocolsAvailable == that.slotsProtocolsAvailable &&
               slotsGearsTotal == that.slotsGearsTotal &&
               slotsGearsAvailable == that.slotsGearsAvailable &&
               Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, accountsId, levelsId, name, experience, fuel, health, slotsLasersTotal,
                            slotsLasersAvailable, slotsGeneratorsTotal, slotsGeneratorsAvailable, slotsProtocolsTotal,
                            slotsProtocolsAvailable, slotsGearsTotal, slotsGearsAvailable
        );
    }

    @OneToMany(mappedBy = "accountsPetsByAccountsPetsId")
    public Collection<AccountsConfigurationsAccountsItem> getAccountsConfigurationsAccountsItemsById() {
        return accountsConfigurationsAccountsItemsById;
    }

    public void setAccountsConfigurationsAccountsItemsById(
            Collection<AccountsConfigurationsAccountsItem> accountsConfigurationsAccountsItemsById
    ) {
        this.accountsConfigurationsAccountsItemsById = accountsConfigurationsAccountsItemsById;
    }

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }

    @ManyToOne
    @JoinColumn(name = "levels_id", referencedColumnName = "id", nullable = false)
    public Level getLevelsByLevelsId() {
        return levelsByLevelsId;
    }

    public void setLevelsByLevelsId(Level levelsByLevelsId) {
        this.levelsByLevelsId = levelsByLevelsId;
    }
}
