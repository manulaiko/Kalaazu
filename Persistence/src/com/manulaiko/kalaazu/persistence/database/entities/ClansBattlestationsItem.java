package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "clans_battlestations_items", schema = "kalaazu")
public class ClansBattlestationsItem {
    private int id;

    private int clansBattlestationsId;

    private int accountsItemsId;

    private byte slot;

    private Date date;

    private ClansBattlestation clansBattlestationsByClansBattlestationsId;

    private AccountsItem accountsItemsByAccountsItemsId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "clans_battlestations_id")
    public int getClansBattlestationsId() {
        return clansBattlestationsId;
    }

    public void setClansBattlestationsId(int clansBattlestationsId) {
        this.clansBattlestationsId = clansBattlestationsId;
    }

    @Basic
    @Column(name = "accounts_items_id")
    public int getAccountsItemsId() {
        return accountsItemsId;
    }

    public void setAccountsItemsId(int accountsItemsId) {
        this.accountsItemsId = accountsItemsId;
    }

    @Basic
    @Column(name = "slot")
    public byte getSlot() {
        return slot;
    }

    public void setSlot(byte slot) {
        this.slot = slot;
    }

    @Basic
    @Column(name = "date")
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ClansBattlestationsItem that = (ClansBattlestationsItem) o;
        return id == that.id &&
               clansBattlestationsId == that.clansBattlestationsId &&
               accountsItemsId == that.accountsItemsId &&
               slot == that.slot &&
               Objects.equals(date, that.date);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, clansBattlestationsId, accountsItemsId, slot, date);
    }

    @ManyToOne
    @JoinColumn(name = "clans_battlestations_id", referencedColumnName = "id", nullable = false)
    public ClansBattlestation getClansBattlestationsByClansBattlestationsId() {
        return clansBattlestationsByClansBattlestationsId;
    }

    public void setClansBattlestationsByClansBattlestationsId(
            ClansBattlestation clansBattlestationsByClansBattlestationsId
    ) {
        this.clansBattlestationsByClansBattlestationsId = clansBattlestationsByClansBattlestationsId;
    }

    @ManyToOne
    @JoinColumn(name = "accounts_items_id", referencedColumnName = "id", nullable = false)
    public AccountsItem getAccountsItemsByAccountsItemsId() {
        return accountsItemsByAccountsItemsId;
    }

    public void setAccountsItemsByAccountsItemsId(
            AccountsItem accountsItemsByAccountsItemsId
    ) {
        this.accountsItemsByAccountsItemsId = accountsItemsByAccountsItemsId;
    }
}
