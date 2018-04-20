package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "rewards", schema = "kalaazu")
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
    @Column(name = "amount")
    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Basic
    @Column(name = "reward")
    public BigDecimal getReward() {
        return reward;
    }

    public void setReward(BigDecimal reward) {
        this.reward = reward;
    }

    @Basic
    @Column(name = "probability")
    public BigDecimal getProbability() {
        return probability;
    }

    public void setProbability(BigDecimal probability) {
        this.probability = probability;
    }

    @Basic
    @Column(name = "comment")
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

    @ManyToOne
    @JoinColumn(name = "items_id", referencedColumnName = "id", nullable = false)
    public Item getItemsByItemsId() {
        return itemsByItemsId;
    }

    public void setItemsByItemsId(Item itemsByItemsId) {
        this.itemsByItemsId = itemsByItemsId;
    }

    @OneToMany(mappedBy = "rewardsByRewardsId")
    public Collection<RewardsCollectable> getRewardsCollectablesById() {
        return rewardsCollectablesById;
    }

    public void setRewardsCollectablesById(
            Collection<RewardsCollectable> rewardsCollectablesById
    ) {
        this.rewardsCollectablesById = rewardsCollectablesById;
    }

    @OneToMany(mappedBy = "rewardsByRewardsId")
    public Collection<RewardsGalaxygate> getRewardsGalaxygatesById() {
        return rewardsGalaxygatesById;
    }

    public void setRewardsGalaxygatesById(
            Collection<RewardsGalaxygate> rewardsGalaxygatesById
    ) {
        this.rewardsGalaxygatesById = rewardsGalaxygatesById;
    }

    @OneToMany(mappedBy = "rewardsByRewardsId")
    public Collection<RewardsNpc> getRewardsNpcsById() {
        return rewardsNpcsById;
    }

    public void setRewardsNpcsById(
            Collection<RewardsNpc> rewardsNpcsById
    ) {
        this.rewardsNpcsById = rewardsNpcsById;
    }

    @OneToMany(mappedBy = "rewardsByRewardsId")
    public Collection<RewardsQuest> getRewardsQuestsById() {
        return rewardsQuestsById;
    }

    public void setRewardsQuestsById(
            Collection<RewardsQuest> rewardsQuestsById
    ) {
        this.rewardsQuestsById = rewardsQuestsById;
    }

    @OneToMany(mappedBy = "rewardsByRewardsId")
    public Collection<RewardsShip> getRewardsShipsById() {
        return rewardsShipsById;
    }

    public void setRewardsShipsById(
            Collection<RewardsShip> rewardsShipsById
    ) {
        this.rewardsShipsById = rewardsShipsById;
    }

    @OneToMany(mappedBy = "rewardsByRewardsId")
    public Collection<RewardsVoucher> getRewardsVouchersById() {
        return rewardsVouchersById;
    }

    public void setRewardsVouchersById(
            Collection<RewardsVoucher> rewardsVouchersById
    ) {
        this.rewardsVouchersById = rewardsVouchersById;
    }
}
