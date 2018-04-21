package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Item {
    private int id;

    private String name;

    private String category;

    private String description;

    private int price;

    private String type;

    private boolean isElite;

    private boolean isEvent;

    private boolean isBuyable;

    private Collection<AccountsItem> accountsItemsById;

    private Collection<GalaxygatesSpin> galaxygatesSpinsById;

    private Collection<Reward> rewardsById;

    private Collection<Ship> shipsById;

    private Collection<TechfactoryCost> techfactoryCostsById;

    private Collection<TradeItem> tradeItemsById;

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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public boolean isElite() {
        return isElite;
    }

    public void setElite(boolean elite) {
        isElite = elite;
    }

    public boolean isEvent() {
        return isEvent;
    }

    public void setEvent(boolean event) {
        isEvent = event;
    }

    public boolean isBuyable() {
        return isBuyable;
    }

    public void setBuyable(boolean buyable) {
        isBuyable = buyable;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Item item = (Item) o;
        return id == item.id &&
               price == item.price &&
               isElite == item.isElite &&
               isEvent == item.isEvent &&
               isBuyable == item.isBuyable &&
               Objects.equals(name, item.name) &&
               Objects.equals(category, item.category) &&
               Objects.equals(description, item.description) &&
               Objects.equals(type, item.type);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, name, category, description, price, type, isElite, isEvent, isBuyable);
    }

    public Collection<AccountsItem> getAccountsItemsById() {
        return accountsItemsById;
    }

    public void setAccountsItemsById(
            Collection<AccountsItem> accountsItemsById
    ) {
        this.accountsItemsById = accountsItemsById;
    }

    public Collection<GalaxygatesSpin> getGalaxygatesSpinsById() {
        return galaxygatesSpinsById;
    }

    public void setGalaxygatesSpinsById(
            Collection<GalaxygatesSpin> galaxygatesSpinsById
    ) {
        this.galaxygatesSpinsById = galaxygatesSpinsById;
    }

    public Collection<Reward> getRewardsById() {
        return rewardsById;
    }

    public void setRewardsById(Collection<Reward> rewardsById) {
        this.rewardsById = rewardsById;
    }

    public Collection<Ship> getShipsById() {
        return shipsById;
    }

    public void setShipsById(Collection<Ship> shipsById) {
        this.shipsById = shipsById;
    }

    public Collection<TechfactoryCost> getTechfactoryCostsById() {
        return techfactoryCostsById;
    }

    public void setTechfactoryCostsById(
            Collection<TechfactoryCost> techfactoryCostsById
    ) {
        this.techfactoryCostsById = techfactoryCostsById;
    }

    public Collection<TradeItem> getTradeItemsById() {
        return tradeItemsById;
    }

    public void setTradeItemsById(
            Collection<TradeItem> tradeItemsById
    ) {
        this.tradeItemsById = tradeItemsById;
    }
}
