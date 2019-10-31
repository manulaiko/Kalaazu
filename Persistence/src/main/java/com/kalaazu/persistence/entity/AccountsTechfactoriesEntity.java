package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "accounts_techfactories", schema = "kalaazu", catalog = "")
public class AccountsTechfactoriesEntity {
    private int            id;
    private int            slotUnlockPrice;
    private byte           slotUnlockFactor;
    private byte           slots;
    private AccountsEntity accountsByAccountsId;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "slot_unlock_price", nullable = false)
    public int getSlotUnlockPrice() {
        return slotUnlockPrice;
    }

    public void setSlotUnlockPrice(int slotUnlockPrice) {
        this.slotUnlockPrice = slotUnlockPrice;
    }

    @Basic
    @Column(name = "slot_unlock_factor", nullable = false)
    public byte getSlotUnlockFactor() {
        return slotUnlockFactor;
    }

    public void setSlotUnlockFactor(byte slotUnlockFactor) {
        this.slotUnlockFactor = slotUnlockFactor;
    }

    @Basic
    @Column(name = "slots", nullable = false)
    public byte getSlots() {
        return slots;
    }

    public void setSlots(byte slots) {
        this.slots = slots;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AccountsTechfactoriesEntity that = (AccountsTechfactoriesEntity) o;
        return id == that.id &&
               slotUnlockPrice == that.slotUnlockPrice &&
               slotUnlockFactor == that.slotUnlockFactor &&
               slots == that.slots;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, slotUnlockPrice, slotUnlockFactor, slots);
    }

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    public AccountsEntity getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(AccountsEntity accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }
}
