package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Date;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class ClansMessage {
    private int id;

    private int clansId;

    private int fromAccountsId;

    private Integer toAccountsId;

    private String subject;

    private String text;

    private Date date;

    private Clan clansByClansId;

    private Account accountsByFromAccountsId;

    private Account accountsByToAccountsId;

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

    public int getFromAccountsId() {
        return fromAccountsId;
    }

    public void setFromAccountsId(int fromAccountsId) {
        this.fromAccountsId = fromAccountsId;
    }

    public Integer getToAccountsId() {
        return toAccountsId;
    }

    public void setToAccountsId(Integer toAccountsId) {
        this.toAccountsId = toAccountsId;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

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
        ClansMessage that = (ClansMessage) o;
        return id == that.id &&
               clansId == that.clansId &&
               fromAccountsId == that.fromAccountsId &&
               Objects.equals(toAccountsId, that.toAccountsId) &&
               Objects.equals(subject, that.subject) &&
               Objects.equals(text, that.text) &&
               Objects.equals(date, that.date);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, clansId, fromAccountsId, toAccountsId, subject, text, date);
    }

    public Clan getClansByClansId() {
        return clansByClansId;
    }

    public void setClansByClansId(Clan clansByClansId) {
        this.clansByClansId = clansByClansId;
    }

    public Account getAccountsByFromAccountsId() {
        return accountsByFromAccountsId;
    }

    public void setAccountsByFromAccountsId(Account accountsByFromAccountsId) {
        this.accountsByFromAccountsId = accountsByFromAccountsId;
    }

    public Account getAccountsByToAccountsId() {
        return accountsByToAccountsId;
    }

    public void setAccountsByToAccountsId(Account accountsByToAccountsId) {
        this.accountsByToAccountsId = accountsByToAccountsId;
    }
}
