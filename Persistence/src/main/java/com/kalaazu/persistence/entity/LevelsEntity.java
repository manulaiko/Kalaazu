package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "levels", schema = "kalaazu", catalog = "")
public class LevelsEntity {
    private byte   id;
    private long   account;
    private short  drone;
    private int    pet;
    private double damage;
    private double shield;

    @Id
    @Column(name = "id", nullable = false)
    public byte getId() {
        return id;
    }

    public void setId(byte id) {
        this.id = id;
    }

    @Basic
    @Column(name = "account", nullable = false)
    public long getAccount() {
        return account;
    }

    public void setAccount(long account) {
        this.account = account;
    }

    @Basic
    @Column(name = "drone", nullable = false)
    public short getDrone() {
        return drone;
    }

    public void setDrone(short drone) {
        this.drone = drone;
    }

    @Basic
    @Column(name = "pet", nullable = false)
    public int getPet() {
        return pet;
    }

    public void setPet(int pet) {
        this.pet = pet;
    }

    @Basic
    @Column(name = "damage", nullable = false, precision = 0)
    public double getDamage() {
        return damage;
    }

    public void setDamage(double damage) {
        this.damage = damage;
    }

    @Basic
    @Column(name = "shield", nullable = false, precision = 0)
    public double getShield() {
        return shield;
    }

    public void setShield(double shield) {
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
        LevelsEntity that = (LevelsEntity) o;
        return id == that.id &&
               account == that.account &&
               drone == that.drone &&
               pet == that.pet &&
               Double.compare(that.damage, damage) == 0 &&
               Double.compare(that.shield, shield) == 0;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, account, drone, pet, damage, shield);
    }
}
