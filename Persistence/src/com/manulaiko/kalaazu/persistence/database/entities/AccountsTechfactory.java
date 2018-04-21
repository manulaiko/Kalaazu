package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class AccountsTechfactory {
    private int id;

    private int accountsId;

    private int slotUnlockPrice;

    private int slotUnlockFactor;

    private byte slots;

    private Account accountsByAccountsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountsId() {
        return accountsId;
    }

    public void setAccountsId(int accountsId) {
        this.accountsId = accountsId;
    }

    public int getSlotUnlockPrice() {
        return slotUnlockPrice;
    }

    public void setSlotUnlockPrice(int slotUnlockPrice) {
        this.slotUnlockPrice = slotUnlockPrice;
    }

    public int getSlotUnlockFactor() {
        return slotUnlockFactor;
    }

    public void setSlotUnlockFactor(int slotUnlockFactor) {
        this.slotUnlockFactor = slotUnlockFactor;
    }

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
        AccountsTechfactory that = (AccountsTechfactory) o;
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

    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }
}
