package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "npcs", schema = "kalaazu")
public class Npc {
    private int id;

    private String name;

    private int health;

    private int shield;

    private BigDecimal shieldAbsorption;

    private int damage;

    private int speed;

    private int gfx;

    private int ai;

    private Collection<GalaxygatesSpawn> galaxygatesSpawnsById;

    private Collection<MapsNpc> mapsNpcsById;

    private Collection<RewardsNpc> rewardsNpcsById;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
    @Column(name = "health")
    public int getHealth() {
        return health;
    }

    public void setHealth(int health) {
        this.health = health;
    }

    @Basic
    @Column(name = "shield")
    public int getShield() {
        return shield;
    }

    public void setShield(int shield) {
        this.shield = shield;
    }

    @Basic
    @Column(name = "shield_absorption")
    public BigDecimal getShieldAbsorption() {
        return shieldAbsorption;
    }

    public void setShieldAbsorption(BigDecimal shieldAbsorption) {
        this.shieldAbsorption = shieldAbsorption;
    }

    @Basic
    @Column(name = "damage")
    public int getDamage() {
        return damage;
    }

    public void setDamage(int damage) {
        this.damage = damage;
    }

    @Basic
    @Column(name = "speed")
    public int getSpeed() {
        return speed;
    }

    public void setSpeed(int speed) {
        this.speed = speed;
    }

    @Basic
    @Column(name = "gfx")
    public int getGfx() {
        return gfx;
    }

    public void setGfx(int gfx) {
        this.gfx = gfx;
    }

    @Basic
    @Column(name = "ai")
    public int getAi() {
        return ai;
    }

    public void setAi(int ai) {
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
        Npc npc = (Npc) o;
        return id == npc.id &&
               health == npc.health &&
               shield == npc.shield &&
               damage == npc.damage &&
               speed == npc.speed &&
               gfx == npc.gfx &&
               ai == npc.ai &&
               Objects.equals(name, npc.name) &&
               Objects.equals(shieldAbsorption, npc.shieldAbsorption);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, name, health, shield, shieldAbsorption, damage, speed, gfx, ai);
    }

    @OneToMany(mappedBy = "npcsByNpcsId")
    public Collection<GalaxygatesSpawn> getGalaxygatesSpawnsById() {
        return galaxygatesSpawnsById;
    }

    public void setGalaxygatesSpawnsById(
            Collection<GalaxygatesSpawn> galaxygatesSpawnsById
    ) {
        this.galaxygatesSpawnsById = galaxygatesSpawnsById;
    }

    @OneToMany(mappedBy = "npcsByNpcsId")
    public Collection<MapsNpc> getMapsNpcsById() {
        return mapsNpcsById;
    }

    public void setMapsNpcsById(Collection<MapsNpc> mapsNpcsById) {
        this.mapsNpcsById = mapsNpcsById;
    }

    @OneToMany(mappedBy = "npcsByNpcsId")
    public Collection<RewardsNpc> getRewardsNpcsById() {
        return rewardsNpcsById;
    }

    public void setRewardsNpcsById(
            Collection<RewardsNpc> rewardsNpcsById
    ) {
        this.rewardsNpcsById = rewardsNpcsById;
    }
}
