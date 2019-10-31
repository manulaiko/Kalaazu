package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "ships", schema = "kalaazu", catalog = "")
public class ShipsEntity {
    private byte        id;
    private int         health;
    private short       speed;
    private short       cargo;
    private short       batteries;
    private short       rockets;
    private byte        lasers;
    private byte        hellstorms;
    private byte        generators;
    private byte        extras;
    private byte        gfx;
    private ItemsEntity itemsByItemsId;

    @Id
    @Column(name = "id", nullable = false)
    public byte getId() {
        return id;
    }

    public void setId(byte id) {
        this.id = id;
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
    @Column(name = "speed", nullable = false)
    public short getSpeed() {
        return speed;
    }

    public void setSpeed(short speed) {
        this.speed = speed;
    }

    @Basic
    @Column(name = "cargo", nullable = false)
    public short getCargo() {
        return cargo;
    }

    public void setCargo(short cargo) {
        this.cargo = cargo;
    }

    @Basic
    @Column(name = "batteries", nullable = false)
    public short getBatteries() {
        return batteries;
    }

    public void setBatteries(short batteries) {
        this.batteries = batteries;
    }

    @Basic
    @Column(name = "rockets", nullable = false)
    public short getRockets() {
        return rockets;
    }

    public void setRockets(short rockets) {
        this.rockets = rockets;
    }

    @Basic
    @Column(name = "lasers", nullable = false)
    public byte getLasers() {
        return lasers;
    }

    public void setLasers(byte lasers) {
        this.lasers = lasers;
    }

    @Basic
    @Column(name = "hellstorms", nullable = false)
    public byte getHellstorms() {
        return hellstorms;
    }

    public void setHellstorms(byte hellstorms) {
        this.hellstorms = hellstorms;
    }

    @Basic
    @Column(name = "generators", nullable = false)
    public byte getGenerators() {
        return generators;
    }

    public void setGenerators(byte generators) {
        this.generators = generators;
    }

    @Basic
    @Column(name = "extras", nullable = false)
    public byte getExtras() {
        return extras;
    }

    public void setExtras(byte extras) {
        this.extras = extras;
    }

    @Basic
    @Column(name = "gfx", nullable = false)
    public byte getGfx() {
        return gfx;
    }

    public void setGfx(byte gfx) {
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
        ShipsEntity that = (ShipsEntity) o;
        return id == that.id &&
               health == that.health &&
               speed == that.speed &&
               cargo == that.cargo &&
               batteries == that.batteries &&
               rockets == that.rockets &&
               lasers == that.lasers &&
               hellstorms == that.hellstorms &&
               generators == that.generators &&
               extras == that.extras &&
               gfx == that.gfx;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, health, speed, cargo, batteries, rockets, lasers, hellstorms, generators, extras, gfx);
    }

    @ManyToOne
    @JoinColumn(name = "items_id", referencedColumnName = "id", nullable = false)
    public ItemsEntity getItemsByItemsId() {
        return itemsByItemsId;
    }

    public void setItemsByItemsId(ItemsEntity itemsByItemsId) {
        this.itemsByItemsId = itemsByItemsId;
    }
}
