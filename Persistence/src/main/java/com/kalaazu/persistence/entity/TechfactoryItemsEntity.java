package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "techfactory_items", schema = "kalaazu", catalog = "")
public class TechfactoryItemsEntity {
    private byte   id;
    private String name;
    private String description;
    private String effect;
    private short  duration;
    private short  cooldown;
    private int    time;
    private short  freeProduction;
    private short  instantProduction;

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
    @Column(name = "description", nullable = false, length = -1)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "effect", nullable = false, length = -1)
    public String getEffect() {
        return effect;
    }

    public void setEffect(String effect) {
        this.effect = effect;
    }

    @Basic
    @Column(name = "duration", nullable = false)
    public short getDuration() {
        return duration;
    }

    public void setDuration(short duration) {
        this.duration = duration;
    }

    @Basic
    @Column(name = "cooldown", nullable = false)
    public short getCooldown() {
        return cooldown;
    }

    public void setCooldown(short cooldown) {
        this.cooldown = cooldown;
    }

    @Basic
    @Column(name = "time", nullable = false)
    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    @Basic
    @Column(name = "free_production", nullable = false)
    public short getFreeProduction() {
        return freeProduction;
    }

    public void setFreeProduction(short freeProduction) {
        this.freeProduction = freeProduction;
    }

    @Basic
    @Column(name = "instant_production", nullable = false)
    public short getInstantProduction() {
        return instantProduction;
    }

    public void setInstantProduction(short instantProduction) {
        this.instantProduction = instantProduction;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        TechfactoryItemsEntity that = (TechfactoryItemsEntity) o;
        return id == that.id &&
               duration == that.duration &&
               cooldown == that.cooldown &&
               time == that.time &&
               freeProduction == that.freeProduction &&
               instantProduction == that.instantProduction &&
               Objects.equals(name, that.name) &&
               Objects.equals(description, that.description) &&
               Objects.equals(effect, that.effect);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, description, effect, duration, cooldown, time, freeProduction, instantProduction);
    }
}
