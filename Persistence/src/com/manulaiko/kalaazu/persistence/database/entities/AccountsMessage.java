package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_messages", schema = "kalaazu")
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

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "from_accounts_id")
    public int getFromAccountsId() {
        return fromAccountsId;
    }

    public void setFromAccountsId(int fromAccountsId) {
        this.fromAccountsId = fromAccountsId;
    }

    @Basic
    @Column(name = "from_status")
    public int getFromStatus() {
        return fromStatus;
    }

    public void setFromStatus(int fromStatus) {
        this.fromStatus = fromStatus;
    }

    @Basic
    @Column(name = "to_accounts_id")
    public int getToAccountsId() {
        return toAccountsId;
    }

    public void setToAccountsId(int toAccountsId) {
        this.toAccountsId = toAccountsId;
    }

    @Basic
    @Column(name = "to_status")
    public int getToStatus() {
        return toStatus;
    }

    public void setToStatus(int toStatus) {
        this.toStatus = toStatus;
    }

    @Basic
    @Column(name = "date")
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Basic
    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "text")
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

    @ManyToOne
    @JoinColumn(name = "from_accounts_id", referencedColumnName = "id", nullable = false)
    public Account getAccountsByFromAccountsId() {
        return accountsByFromAccountsId;
    }

    public void setAccountsByFromAccountsId(Account accountsByFromAccountsId) {
        this.accountsByFromAccountsId = accountsByFromAccountsId;
    }

    @ManyToOne
    @JoinColumn(name = "to_accounts_id", referencedColumnName = "id", nullable = false)
    public Account getAccountsByToAccountsId() {
        return accountsByToAccountsId;
    }

    public void setAccountsByToAccountsId(Account accountsByToAccountsId) {
        this.accountsByToAccountsId = accountsByToAccountsId;
    }
}
