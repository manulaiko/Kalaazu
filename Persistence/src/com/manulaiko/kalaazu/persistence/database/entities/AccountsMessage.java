package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Date;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class AccountsMessage {
    private int id;

    private int fromAccountsId;

    private int fromStatus;

    private int toAccountsId;

    private int toStatus;

    private Date date;

    private String title;

    private String text;

    private Account accountsByFromAccountsId;

    private Account accountsByToAccountsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFromAccountsId() {
        return fromAccountsId;
    }

    public void setFromAccountsId(int fromAccountsId) {
        this.fromAccountsId = fromAccountsId;
    }

    public int getFromStatus() {
        return fromStatus;
    }

    public void setFromStatus(int fromStatus) {
        this.fromStatus = fromStatus;
    }

    public int getToAccountsId() {
        return toAccountsId;
    }

    public void setToAccountsId(int toAccountsId) {
        this.toAccountsId = toAccountsId;
    }

    public int getToStatus() {
        return toStatus;
    }

    public void setToStatus(int toStatus) {
        this.toStatus = toStatus;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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
        AccountsMessage that = (AccountsMessage) o;
        return id == that.id &&
               fromAccountsId == that.fromAccountsId &&
               fromStatus == that.fromStatus &&
               toAccountsId == that.toAccountsId &&
               toStatus == that.toStatus &&
               Objects.equals(date, that.date) &&
               Objects.equals(title, that.title) &&
               Objects.equals(text, that.text);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, fromAccountsId, fromStatus, toAccountsId, toStatus, date, title, text);
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
