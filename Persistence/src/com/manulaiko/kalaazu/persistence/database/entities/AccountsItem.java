package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Date;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class AccountsItem {
    private int id;

    private int itemsId;

    private int accountsId;

    private int levelsId;

    private Date date;

    private int amount;

    private Collection<AccountsConfigurationsAccountsItem> accountsConfigurationsAccountsItemsById;

    private Item itemsByItemsId;

    private Account accountsByAccountsId;

    private Level levelsByLevelsId;

    private Collection<ClansBattlestationsItem> clansBattlestationsItemsById;

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

    public int getAccountsId() {
        return accountsId;
    }

    public void setAccountsId(int accountsId) {
        this.accountsId = accountsId;
    }

    public int getLevelsId() {
        return levelsId;
    }

    public void setLevelsId(int levelsId) {
        this.levelsId = levelsId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AccountsItem that = (AccountsItem) o;
        return id == that.id &&
               itemsId == that.itemsId &&
               accountsId == that.accountsId &&
               levelsId == that.levelsId &&
               amount == that.amount &&
               Objects.equals(date, that.date);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, itemsId, accountsId, levelsId, date, amount);
    }

    public Collection<AccountsConfigurationsAccountsItem> getAccountsConfigurationsAccountsItemsById() {
        return accountsConfigurationsAccountsItemsById;
    }

    public void setAccountsConfigurationsAccountsItemsById(
            Collection<AccountsConfigurationsAccountsItem> accountsConfigurationsAccountsItemsById
    ) {
        this.accountsConfigurationsAccountsItemsById = accountsConfigurationsAccountsItemsById;
    }

    public Item getItemsByItemsId() {
        return itemsByItemsId;
    }

    public void setItemsByItemsId(Item itemsByItemsId) {
        this.itemsByItemsId = itemsByItemsId;
    }

    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }

    public Level getLevelsByLevelsId() {
        return levelsByLevelsId;
    }

    public void setLevelsByLevelsId(Level levelsByLevelsId) {
        this.levelsByLevelsId = levelsByLevelsId;
    }

    public Collection<ClansBattlestationsItem> getClansBattlestationsItemsById() {
        return clansBattlestationsItemsById;
    }

    public void setClansBattlestationsItemsById(
            Collection<ClansBattlestationsItem> clansBattlestationsItemsById
    ) {
        this.clansBattlestationsItemsById = clansBattlestationsItemsById;
    }
}
