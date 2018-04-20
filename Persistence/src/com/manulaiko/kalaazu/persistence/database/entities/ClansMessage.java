package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "clans_messages", schema = "kalaazu")
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

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "clans_id")
    public int getClansId() {
        return clansId;
    }

    public void setClansId(int clansId) {
        this.clansId = clansId;
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
    @Column(name = "to_accounts_id")
    public Integer getToAccountsId() {
        return toAccountsId;
    }

    public void setToAccountsId(Integer toAccountsId) {
        this.toAccountsId = toAccountsId;
    }

    @Basic
    @Column(name = "subject")
    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    @Basic
    @Column(name = "text")
    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
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

    @ManyToOne
    @JoinColumn(name = "clans_id", referencedColumnName = "id", nullable = false)
    public Clan getClansByClansId() {
        return clansByClansId;
    }

    public void setClansByClansId(Clan clansByClansId) {
        this.clansByClansId = clansByClansId;
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
    @JoinColumn(name = "to_accounts_id", referencedColumnName = "id")
    public Account getAccountsByToAccountsId() {
        return accountsByToAccountsId;
    }

    public void setAccountsByToAccountsId(Account accountsByToAccountsId) {
        this.accountsByToAccountsId = accountsByToAccountsId;
    }
}
