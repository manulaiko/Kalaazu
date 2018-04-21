package com.manulaiko.kalaazu.persistence.database.entities;


import java.math.BigDecimal;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getHealth() {
        return health;
    }

    public void setHealth(int health) {
        this.health = health;
    }

    public int getShield() {
        return shield;
    }

    public void setShield(int shield) {
        this.shield = shield;
    }

    public BigDecimal getShieldAbsorption() {
        return shieldAbsorption;
    }

    public void setShieldAbsorption(BigDecimal shieldAbsorption) {
        this.shieldAbsorption = shieldAbsorption;
    }

    public int getDamage() {
        return damage;
    }

    public void setDamage(int damage) {
        this.damage = damage;
    }

    public int getSpeed() {
        return speed;
    }

    public void setSpeed(int speed) {
        this.speed = speed;
    }

    public int getGfx() {
        return gfx;
    }

    public void setGfx(int gfx) {
        this.gfx = gfx;
    }

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

    public Collection<GalaxygatesSpawn> getGalaxygatesSpawnsById() {
        return galaxygatesSpawnsById;
    }

    public void setGalaxygatesSpawnsById(
            Collection<GalaxygatesSpawn> galaxygatesSpawnsById
    ) {
        this.galaxygatesSpawnsById = galaxygatesSpawnsById;
    }

    public Collection<MapsNpc> getMapsNpcsById() {
        return mapsNpcsById;
    }

    public void setMapsNpcsById(Collection<MapsNpc> mapsNpcsById) {
        this.mapsNpcsById = mapsNpcsById;
    }

    public Collection<RewardsNpc> getRewardsNpcsById() {
        return rewardsNpcsById;
    }

    public void setRewardsNpcsById(
            Collection<RewardsNpc> rewardsNpcsById
    ) {
        this.rewardsNpcsById = rewardsNpcsById;
    }
}
