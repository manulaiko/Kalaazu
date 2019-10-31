package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "rewards", schema = "kalaazu", catalog = "")
public class RewardsEntity {
    private short       id;
    private int         amount;
    private double      probability;
    private String      comment;
    private ItemsEntity itemsByItemsId;

    @Id
    @Column(name = "id", nullable = false)
    public short getId() {
        return id;
    }

    public void setId(short id) {
        this.id = id;
    }

    @Basic
    @Column(name = "amount", nullable = false)
    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Basic
    @Column(name = "probability", nullable = false, precision = 0)
    public double getProbability() {
        return probability;
    }

    public void setProbability(double probability) {
        this.probability = probability;
    }

    @Basic
    @Column(name = "comment", nullable = true, length = 255)
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
        RewardsEntity that = (RewardsEntity) o;
        return id == that.id &&
               amount == that.amount &&
               Double.compare(that.probability, probability) == 0 &&
               Objects.equals(comment, that.comment);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, amount, probability, comment);
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
