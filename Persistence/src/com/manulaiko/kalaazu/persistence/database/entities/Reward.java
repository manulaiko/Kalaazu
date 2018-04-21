package com.manulaiko.kalaazu.persistence.database.entities;


import java.math.BigDecimal;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Reward {
    private int id;

    private int itemsId;

    private int amount;

    private BigDecimal reward;

    private BigDecimal probability;

    private String comment;

    private Item itemsByItemsId;

    private Collection<RewardsCollectable> rewardsCollectablesById;

    private Collection<RewardsGalaxygate> rewardsGalaxygatesById;

    private Collection<RewardsNpc> rewardsNpcsById;

    private Collection<RewardsQuest> rewardsQuestsById;

    private Collection<RewardsShip> rewardsShipsById;

    private Collection<RewardsVoucher> rewardsVouchersById;

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

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public BigDecimal getReward() {
        return reward;
    }

    public void setReward(BigDecimal reward) {
        this.reward = reward;
    }

    public BigDecimal getProbability() {
        return probability;
    }

    public void setProbability(BigDecimal probability) {
        this.probability = probability;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Reward reward1 = (Reward) o;
        return id == reward1.id &&
               itemsId == reward1.itemsId &&
               amount == reward1.amount &&
               Objects.equals(reward, reward1.reward) &&
               Objects.equals(probability, reward1.probability) &&
               Objects.equals(comment, reward1.comment);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, itemsId, amount, reward, probability, comment);
    }

    public Item getItemsByItemsId() {
        return itemsByItemsId;
    }

    public void setItemsByItemsId(Item itemsByItemsId) {
        this.itemsByItemsId = itemsByItemsId;
    }

    public Collection<RewardsCollectable> getRewardsCollectablesById() {
        return rewardsCollectablesById;
    }

    public void setRewardsCollectablesById(
            Collection<RewardsCollectable> rewardsCollectablesById
    ) {
        this.rewardsCollectablesById = rewardsCollectablesById;
    }

    public Collection<RewardsGalaxygate> getRewardsGalaxygatesById() {
        return rewardsGalaxygatesById;
    }

    public void setRewardsGalaxygatesById(
            Collection<RewardsGalaxygate> rewardsGalaxygatesById
    ) {
        this.rewardsGalaxygatesById = rewardsGalaxygatesById;
    }

    public Collection<RewardsNpc> getRewardsNpcsById() {
        return rewardsNpcsById;
    }

    public void setRewardsNpcsById(
            Collection<RewardsNpc> rewardsNpcsById
    ) {
        this.rewardsNpcsById = rewardsNpcsById;
    }

    public Collection<RewardsQuest> getRewardsQuestsById() {
        return rewardsQuestsById;
    }

    public void setRewardsQuestsById(
            Collection<RewardsQuest> rewardsQuestsById
    ) {
        this.rewardsQuestsById = rewardsQuestsById;
    }

    public Collection<RewardsShip> getRewardsShipsById() {
        return rewardsShipsById;
    }

    public void setRewardsShipsById(
            Collection<RewardsShip> rewardsShipsById
    ) {
        this.rewardsShipsById = rewardsShipsById;
    }

    public Collection<RewardsVoucher> getRewardsVouchersById() {
        return rewardsVouchersById;
    }

    public void setRewardsVouchersById(
            Collection<RewardsVoucher> rewardsVouchersById
    ) {
        this.rewardsVouchersById = rewardsVouchersById;
    }
}
