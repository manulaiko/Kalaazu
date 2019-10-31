package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "npcs", schema = "kalaazu", catalog = "")
public class NpcsEntity {
    private byte   id;
    private String name;
    private int    health;
    private int    shield;
    private byte   shieldAbsorption;
    private int    damage;
    private short  speed;
    private byte   gfx;
    private byte   ai;

    @Id
    @Column(name = "id", nullable = false)
    public byte getId() {
        return id;
    }

    public void setId(byte id) {
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
    @Column(name = "health", nullable = false)
    public int getHealth() {
        return health;
    }

    public void setHealth(int health) {
        this.health = health;
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
    @Column(name = "shield_absorption", nullable = false)
    public byte getShieldAbsorption() {
        return shieldAbsorption;
    }

    public void setShieldAbsorption(byte shieldAbsorption) {
        this.shieldAbsorption = shieldAbsorption;
    }

    @Basic
    @Column(name = "damage", nullable = false)
    public int getDamage() {
        return damage;
    }

    public void setDamage(int damage) {
        this.damage = damage;
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
    @Column(name = "gfx", nullable = false)
    public byte getGfx() {
        return gfx;
    }

    public void setGfx(byte gfx) {
        this.gfx = gfx;
    }

    @Basic
    @Column(name = "ai", nullable = false)
    public byte getAi() {
        return ai;
    }

    public void setAi(byte ai) {
        this.ai = ai;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        NpcsEntity that = (NpcsEntity) o;
        return id == that.id &&
               health == that.health &&
               shield == that.shield &&
               shieldAbsorption == that.shieldAbsorption &&
               damage == that.damage &&
               speed == that.speed &&
               gfx == that.gfx &&
               ai == that.ai &&
               Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, health, shield, shieldAbsorption, damage, speed, gfx, ai);
    }
}
