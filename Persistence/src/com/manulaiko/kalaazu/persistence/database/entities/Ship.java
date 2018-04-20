package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "ships", schema = "kalaazu")
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

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "items_id")
    public int getItemsId() {
        return itemsId;
    }

    public void setItemsId(int itemsId) {
        this.itemsId = itemsId;
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
    @Column(name = "speed")
    public int getSpeed() {
        return speed;
    }

    public void setSpeed(int speed) {
        this.speed = speed;
    }

    @Basic
    @Column(name = "cargo")
    public int getCargo() {
        return cargo;
    }

    public void setCargo(int cargo) {
        this.cargo = cargo;
    }

    @Basic
    @Column(name = "batteries")
    public int getBatteries() {
        return batteries;
    }

    public void setBatteries(int batteries) {
        this.batteries = batteries;
    }

    @Basic
    @Column(name = "rockets")
    public int getRockets() {
        return rockets;
    }

    public void setRockets(int rockets) {
        this.rockets = rockets;
    }

    @Basic
    @Column(name = "lasers")
    public int getLasers() {
        return lasers;
    }

    public void setLasers(int lasers) {
        this.lasers = lasers;
    }

    @Basic
    @Column(name = "hellstorms")
    public int getHellstorms() {
        return hellstorms;
    }

    public void setHellstorms(int hellstorms) {
        this.hellstorms = hellstorms;
    }

    @Basic
    @Column(name = "generators")
    public int getGenerators() {
        return generators;
    }

    public void setGenerators(int generators) {
        this.generators = generators;
    }

    @Basic
    @Column(name = "extras")
    public int getExtras() {
        return extras;
    }

    public void setExtras(int extras) {
        this.extras = extras;
    }

    @Basic
    @Column(name = "gfx")
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

    @OneToMany(mappedBy = "shipsByShipsId")
    public Collection<AccountsShip> getAccountsShipsById() {
        return accountsShipsById;
    }

    public void setAccountsShipsById(
            Collection<AccountsShip> accountsShipsById
    ) {
        this.accountsShipsById = accountsShipsById;
    }

    @OneToMany(mappedBy = "shipsByShipsId")
    public Collection<RewardsShip> getRewardsShipsById() {
        return rewardsShipsById;
    }

    public void setRewardsShipsById(
            Collection<RewardsShip> rewardsShipsById
    ) {
        this.rewardsShipsById = rewardsShipsById;
    }

    @ManyToOne
    @JoinColumn(name = "items_id", referencedColumnName = "id", nullable = false)
    public Item getItemsByItemsId() {
        return itemsByItemsId;
    }

    public void setItemsByItemsId(Item itemsByItemsId) {
        this.itemsByItemsId = itemsByItemsId;
    }
}
