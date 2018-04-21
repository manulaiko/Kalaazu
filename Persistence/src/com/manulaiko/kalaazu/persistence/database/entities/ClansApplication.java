package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Date;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class ClansApplication {
    private int id;

    private int clansId;

    private int accountsId;

    private Date date;

    private String text;

    private Clan clansByClansId;

    private Account accountsByAccountsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getClansId() {
        return clansId;
    }

    public void setClansId(int clansId) {
        this.clansId = clansId;
    }

    public int getAccountsId() {
        return accountsId;
    }

    public void setAccountsId(int accountsId) {
        this.accountsId = accountsId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ClansApplication that = (ClansApplication) o;
        return id == that.id &&
               clansId == that.clansId &&
               accountsId == that.accountsId &&
               Objects.equals(date, that.date) &&
               Objects.equals(text, that.text);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, clansId, accountsId, date, text);
    }

    public Clan getClansByClansId() {
        return clansByClansId;
    }

    public void setClansByClansId(Clan clansByClansId) {
        this.clansByClansId = clansByClansId;
    }

    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }
}
