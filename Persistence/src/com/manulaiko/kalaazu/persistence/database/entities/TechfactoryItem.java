package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class TechfactoryItem {
    private int id;

    private String name;

    private String description;

    private String effect;

    private int duration;

    private int cooldown;

    private int time;

    private int instantProduction;

    private int freeProduction;

    private Collection<AccountsTechfactoryItem> accountsTechfactoryItemsById;

    private Collection<TechfactoryCost> techfactoryCostsById;

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getEffect() {
        return effect;
    }

    public void setEffect(String effect) {
        this.effect = effect;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public int getCooldown() {
        return cooldown;
    }

    public void setCooldown(int cooldown) {
        this.cooldown = cooldown;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public int getInstantProduction() {
        return instantProduction;
    }

    public void setInstantProduction(int instantProduction) {
        this.instantProduction = instantProduction;
    }

    public int getFreeProduction() {
        return freeProduction;
    }

    public void setFreeProduction(int freeProduction) {
        this.freeProduction = freeProduction;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        TechfactoryItem that = (TechfactoryItem) o;
        return id == that.id &&
               duration == that.duration &&
               cooldown == that.cooldown &&
               time == that.time &&
               instantProduction == that.instantProduction &&
               freeProduction == that.freeProduction &&
               Objects.equals(name, that.name) &&
               Objects.equals(description, that.description) &&
               Objects.equals(effect, that.effect);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, name, description, effect, duration, cooldown, time, instantProduction, freeProduction);
    }

    public Collection<AccountsTechfactoryItem> getAccountsTechfactoryItemsById() {
        return accountsTechfactoryItemsById;
    }

    public void setAccountsTechfactoryItemsById(
            Collection<AccountsTechfactoryItem> accountsTechfactoryItemsById
    ) {
        this.accountsTechfactoryItemsById = accountsTechfactoryItemsById;
    }

    public Collection<TechfactoryCost> getTechfactoryCostsById() {
        return techfactoryCostsById;
    }

    public void setTechfactoryCostsById(
            Collection<TechfactoryCost> techfactoryCostsById
    ) {
        this.techfactoryCostsById = techfactoryCostsById;
    }
}
