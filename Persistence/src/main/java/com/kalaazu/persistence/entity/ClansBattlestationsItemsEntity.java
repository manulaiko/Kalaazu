package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "clans_battlestations_items", schema = "kalaazu", catalog = "")
public class ClansBattlestationsItemsEntity {
    private int                       id;
    private byte                      slot;
    private Timestamp                 date;
    private ClansBattlestationsEntity clansBattlestationsByClansBattlestationsId;
    private AccountsItemsEntity       accountsItemsByAccountsItemsId;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "slot", nullable = false)
    public byte getSlot() {
        return slot;
    }

    public void setSlot(byte slot) {
        this.slot = slot;
    }

    @Basic
    @Column(name = "date", nullable = false)
    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
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
        ClansBattlestationsItemsEntity that = (ClansBattlestationsItemsEntity) o;
        return id == that.id &&
               slot == that.slot &&
               Objects.equals(date, that.date);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, slot, date);
    }

    @ManyToOne
    @JoinColumn(name = "clans_battlestations_id", referencedColumnName = "id", nullable = false)
    public ClansBattlestationsEntity getClansBattlestationsByClansBattlestationsId() {
        return clansBattlestationsByClansBattlestationsId;
    }

    public void setClansBattlestationsByClansBattlestationsId(
            ClansBattlestationsEntity clansBattlestationsByClansBattlestationsId
    ) {
        this.clansBattlestationsByClansBattlestationsId = clansBattlestationsByClansBattlestationsId;
    }

    @ManyToOne
    @JoinColumn(name = "accounts_items_id", referencedColumnName = "id", nullable = false)
    public AccountsItemsEntity getAccountsItemsByAccountsItemsId() {
        return accountsItemsByAccountsItemsId;
    }

    public void setAccountsItemsByAccountsItemsId(AccountsItemsEntity accountsItemsByAccountsItemsId) {
        this.accountsItemsByAccountsItemsId = accountsItemsByAccountsItemsId;
    }
}
