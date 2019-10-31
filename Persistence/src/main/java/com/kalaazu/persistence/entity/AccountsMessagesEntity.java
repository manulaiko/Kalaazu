package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "accounts_messages", schema = "kalaazu", catalog = "")
public class AccountsMessagesEntity {
    private int            id;
    private byte           fromStatus;
    private byte           toStatus;
    private Timestamp      date;
    private String         title;
    private String         text;
    private AccountsEntity accountsByFromAccountsId;
    private AccountsEntity accountsByToAccountsId;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "from_status", nullable = false)
    public byte getFromStatus() {
        return fromStatus;
    }

    public void setFromStatus(byte fromStatus) {
        this.fromStatus = fromStatus;
    }

    @Basic
    @Column(name = "to_status", nullable = false)
    public byte getToStatus() {
        return toStatus;
    }

    public void setToStatus(byte toStatus) {
        this.toStatus = toStatus;
    }

    @Basic
    @Column(name = "date", nullable = false)
    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    @Basic
    @Column(name = "title", nullable = false, length = 255)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "text", nullable = false, length = -1)
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
        AccountsMessagesEntity that = (AccountsMessagesEntity) o;
        return id == that.id &&
               fromStatus == that.fromStatus &&
               toStatus == that.toStatus &&
               Objects.equals(date, that.date) &&
               Objects.equals(title, that.title) &&
               Objects.equals(text, that.text);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, fromStatus, toStatus, date, title, text);
    }

    @ManyToOne
    @JoinColumn(name = "from_accounts_id", referencedColumnName = "id", nullable = false)
    public AccountsEntity getAccountsByFromAccountsId() {
        return accountsByFromAccountsId;
    }

    public void setAccountsByFromAccountsId(AccountsEntity accountsByFromAccountsId) {
        this.accountsByFromAccountsId = accountsByFromAccountsId;
    }

    @ManyToOne
    @JoinColumn(name = "to_accounts_id", referencedColumnName = "id", nullable = false)
    public AccountsEntity getAccountsByToAccountsId() {
        return accountsByToAccountsId;
    }

    public void setAccountsByToAccountsId(AccountsEntity accountsByToAccountsId) {
        this.accountsByToAccountsId = accountsByToAccountsId;
    }
}
