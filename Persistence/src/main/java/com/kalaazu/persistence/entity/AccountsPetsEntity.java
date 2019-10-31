package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "accounts_pets", schema = "kalaazu", catalog = "")
public class AccountsPetsEntity {
    private int            id;
    private String         name;
    private int            experience;
    private int            fuel;
    private int            health;
    private byte           slotsLasersTotal;
    private byte           slotsLasersAvailable;
    private byte           slotsGeneratorsTotal;
    private byte           slotsGeneratorsAvailable;
    private byte           slotsProtocolsTotal;
    private byte           slotsProtocolsAvailable;
    private byte           slotsGearsTotal;
    private byte           slotsGearsAvailable;
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
    @Column(name = "name", nullable = false, length = 255)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "experience", nullable = false)
    public int getExperience() {
        return experience;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }

    @Basic
    @Column(name = "fuel", nullable = false)
    public int getFuel() {
        return fuel;
    }

    public void setFuel(int fuel) {
        this.fuel = fuel;
    }

    @Basic
    @Column(name = "health", nullable = false)
    public int getHealth() {
        return health;
    }

    public void setHealth(int health) {
        this.health = health;
    }

    @Basic
    @Column(name = "slots_lasers_total", nullable = false)
    public byte getSlotsLasersTotal() {
        return slotsLasersTotal;
    }

    public void setSlotsLasersTotal(byte slotsLasersTotal) {
        this.slotsLasersTotal = slotsLasersTotal;
    }

    @Basic
    @Column(name = "slots_lasers_available", nullable = false)
    public byte getSlotsLasersAvailable() {
        return slotsLasersAvailable;
    }

    public void setSlotsLasersAvailable(byte slotsLasersAvailable) {
        this.slotsLasersAvailable = slotsLasersAvailable;
    }

    @Basic
    @Column(name = "slots_generators_total", nullable = false)
    public byte getSlotsGeneratorsTotal() {
        return slotsGeneratorsTotal;
    }

    public void setSlotsGeneratorsTotal(byte slotsGeneratorsTotal) {
        this.slotsGeneratorsTotal = slotsGeneratorsTotal;
    }

    @Basic
    @Column(name = "slots_generators_available", nullable = false)
    public byte getSlotsGeneratorsAvailable() {
        return slotsGeneratorsAvailable;
    }

    public void setSlotsGeneratorsAvailable(byte slotsGeneratorsAvailable) {
        this.slotsGeneratorsAvailable = slotsGeneratorsAvailable;
    }

    @Basic
    @Column(name = "slots_protocols_total", nullable = false)
    public byte getSlotsProtocolsTotal() {
        return slotsProtocolsTotal;
    }

    public void setSlotsProtocolsTotal(byte slotsProtocolsTotal) {
        this.slotsProtocolsTotal = slotsProtocolsTotal;
    }

    @Basic
    @Column(name = "slots_protocols_available", nullable = false)
    public byte getSlotsProtocolsAvailable() {
        return slotsProtocolsAvailable;
    }

    public void setSlotsProtocolsAvailable(byte slotsProtocolsAvailable) {
        this.slotsProtocolsAvailable = slotsProtocolsAvailable;
    }

    @Basic
    @Column(name = "slots_gears_total", nullable = false)
    public byte getSlotsGearsTotal() {
        return slotsGearsTotal;
    }

    public void setSlotsGearsTotal(byte slotsGearsTotal) {
        this.slotsGearsTotal = slotsGearsTotal;
    }

    @Basic
    @Column(name = "slots_gears_available", nullable = false)
    public byte getSlotsGearsAvailable() {
        return slotsGearsAvailable;
    }

    public void setSlotsGearsAvailable(byte slotsGearsAvailable) {
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
        AccountsPetsEntity that = (AccountsPetsEntity) o;
        return id == that.id &&
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
        return Objects.hash(
                id,
                name,
                experience,
                fuel,
                health,
                slotsLasersTotal,
                slotsLasersAvailable,
                slotsGeneratorsTotal,
                slotsGeneratorsAvailable,
                slotsProtocolsTotal,
                slotsProtocolsAvailable,
                slotsGearsTotal,
                slotsGearsAvailable
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
