package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Ship {
    private int id;

    private int itemsId;

    private int health;

    private int speed;

    private int cargo;

    private int batteries;

    private int rockets;

    private int lasers;

    private int hellstorms;

    private int generators;

    private int extras;

    private int gfx;

    private Collection<AccountsShip> accountsShipsById;

    private Collection<RewardsShip> rewardsShipsById;

    private Item itemsByItemsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getItemsId() {
        return itemsId;
    }

    public void setItemsId(int itemsId) {
        this.itemsId = itemsId;
    }

    public int getHealth() {
        return health;
    }

    public void setHealth(int health) {
        this.health = health;
    }

    public int getSpeed() {
        return speed;
    }

    public void setSpeed(int speed) {
        this.speed = speed;
    }

    public int getCargo() {
        return cargo;
    }

    public void setCargo(int cargo) {
        this.cargo = cargo;
    }

    public int getBatteries() {
        return batteries;
    }

    public void setBatteries(int batteries) {
        this.batteries = batteries;
    }

    public int getRockets() {
        return rockets;
    }

    public void setRockets(int rockets) {
        this.rockets = rockets;
    }

    public int getLasers() {
        return lasers;
    }

    public void setLasers(int lasers) {
        this.lasers = lasers;
    }

    public int getHellstorms() {
        return hellstorms;
    }

    public void setHellstorms(int hellstorms) {
        this.hellstorms = hellstorms;
    }

    public int getGenerators() {
        return generators;
    }

    public void setGenerators(int generators) {
        this.generators = generators;
    }

    public int getExtras() {
        return extras;
    }

    public void setExtras(int extras) {
        this.extras = extras;
    }

    public int getGfx() {
        return gfx;
    }

    public void setGfx(int gfx) {
        this.gfx = gfx;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Ship ship = (Ship) o;
        return id == ship.id &&
               itemsId == ship.itemsId &&
               health == ship.health &&
               speed == ship.speed &&
               cargo == ship.cargo &&
               batteries == ship.batteries &&
               rockets == ship.rockets &&
               lasers == ship.lasers &&
               hellstorms == ship.hellstorms &&
               generators == ship.generators &&
               extras == ship.extras &&
               gfx == ship.gfx;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, itemsId, health, speed, cargo, batteries, rockets, lasers, hellstorms, generators,
                            extras,
                            gfx
        );
    }

    public Collection<AccountsShip> getAccountsShipsById() {
        return accountsShipsById;
    }

    public void setAccountsShipsById(
            Collection<AccountsShip> accountsShipsById
    ) {
        this.accountsShipsById = accountsShipsById;
    }

    public Collection<RewardsShip> getRewardsShipsById() {
        return rewardsShipsById;
    }

    public void setRewardsShipsById(
            Collection<RewardsShip> rewardsShipsById
    ) {
        this.rewardsShipsById = rewardsShipsById;
    }

    public Item getItemsByItemsId() {
        return itemsByItemsId;
    }

    public void setItemsByItemsId(Item itemsByItemsId) {
        this.itemsByItemsId = itemsByItemsId;
    }
}
