package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_techfactories", schema = "kalaazu")
public class AccountsTechfactorie {
    private int id;

    private int accountsId;

    private int slotUnlockPrice;

    private int slotUnlockFactor;

    private byte slots;

    private Account accountsByAccountsId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "accounts_id")
    public int getAccountsId() {
        return accountsId;
    }

    public void setAccountsId(int accountsId) {
        this.accountsId = accountsId;
    }

    @Basic
    @Column(name = "slot_unlock_price")
    public int getSlotUnlockPrice() {
        return slotUnlockPrice;
    }

    public void setSlotUnlockPrice(int slotUnlockPrice) {
        this.slotUnlockPrice = slotUnlockPrice;
    }

    @Basic
    @Column(name = "slot_unlock_factor")
    public int getSlotUnlockFactor() {
        return slotUnlockFactor;
    }

    public void setSlotUnlockFactor(int slotUnlockFactor) {
        this.slotUnlockFactor = slotUnlockFactor;
    }

    @Basic
    @Column(name = "slots")
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
        AccountsTechfactorie that = (AccountsTechfactorie) o;
        return id == that.id &&
               accountsId == that.accountsId &&
               slotUnlockPrice == that.slotUnlockPrice &&
               slotUnlockFactor == that.slotUnlockFactor &&
               slots == that.slots;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, accountsId, slotUnlockPrice, slotUnlockFactor, slots);
    }

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }
}
