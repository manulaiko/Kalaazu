package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "accounts_configurations", schema = "kalaazu", catalog = "")
public class AccountsConfigurationsEntity {
    private int    id;
    private byte   configurationId;
    private String name;
    private int    shield;
    private short  speed;
    private int    damage;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "configuration_id", nullable = false)
    public byte getConfigurationId() {
        return configurationId;
    }

    public void setConfigurationId(byte configurationId) {
        this.configurationId = configurationId;
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
    @Column(name = "shield", nullable = false)
    public int getShield() {
        return shield;
    }

    public void setShield(int shield) {
        this.shield = shield;
    }

    @Basic
    @Column(name = "speed", nullable = false)
    public short getSpeed() {
        return speed;
    }

    public void setSpeed(short speed) {
        this.speed = speed;
    }

    @Basic
    @Column(name = "damage", nullable = false)
    public int getDamage() {
        return damage;
    }

    public void setDamage(int damage) {
        this.damage = damage;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AccountsConfigurationsEntity that = (AccountsConfigurationsEntity) o;
        return id == that.id &&
               configurationId == that.configurationId &&
               shield == that.shield &&
               speed == that.speed &&
               damage == that.damage &&
               Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, configurationId, name, shield, speed, damage);
    }
}
