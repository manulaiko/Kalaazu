package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "clans_banks_logs", schema = "kalaazu")
public class ClansBanksLog {
    private int id;

    private int clansBanksId;

    private int fromAccountsId;

    private int toAccountsId;

    private Date date;

    private int type;

    private int amount;

    private int currency;

    private ClansBank clansBanksByClansBanksId;

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
    @Column(name = "clans_banks_id")
    public int getClansBanksId() {
        return clansBanksId;
    }

    public void setClansBanksId(int clansBanksId) {
        this.clansBanksId = clansBanksId;
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
    public int getToAccountsId() {
        return toAccountsId;
    }

    public void setToAccountsId(int toAccountsId) {
        this.toAccountsId = toAccountsId;
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
    @Column(name = "type")
    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    @Basic
    @Column(name = "amount")
    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Basic
    @Column(name = "currency")
    public int getCurrency() {
        return currency;
    }

    public void setCurrency(int currency) {
        this.currency = currency;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ClansBanksLog that = (ClansBanksLog) o;
        return id == that.id &&
               clansBanksId == that.clansBanksId &&
               fromAccountsId == that.fromAccountsId &&
               toAccountsId == that.toAccountsId &&
               type == that.type &&
               amount == that.amount &&
               currency == that.currency &&
               Objects.equals(date, that.date);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, clansBanksId, fromAccountsId, toAccountsId, date, type, amount, currency);
    }

    @ManyToOne
    @JoinColumn(name = "clans_banks_id", referencedColumnName = "id", nullable = false)
    public ClansBank getClansBanksByClansBanksId() {
        return clansBanksByClansBanksId;
    }

    public void setClansBanksByClansBanksId(
            ClansBank clansBanksByClansBanksId
    ) {
        this.clansBanksByClansBanksId = clansBanksByClansBanksId;
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
