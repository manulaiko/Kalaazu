package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_banks_logs", schema = "kalaazu")
public class AccountsBanksLog {
    private int id;

    private int fromAccountsId;

    private int toAccountsId;

    private Date date;

    private int type;

    private int amount;

    private int currency;

    private Integer accountsBanksId;

    private Account accountsByFromAccountsId;

    private Account accountsByToAccountsId;

    private AccountsBank accountsBanksByAccountsBanksId;

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

    @Basic
    @Column(name = "accounts_banks_id")
    public Integer getAccountsBanksId() {
        return accountsBanksId;
    }

    public void setAccountsBanksId(Integer accountsBanksId) {
        this.accountsBanksId = accountsBanksId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AccountsBanksLog that = (AccountsBanksLog) o;
        return id == that.id &&
               fromAccountsId == that.fromAccountsId &&
               toAccountsId == that.toAccountsId &&
               type == that.type &&
               amount == that.amount &&
               currency == that.currency &&
               Objects.equals(date, that.date) &&
               Objects.equals(accountsBanksId, that.accountsBanksId);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, fromAccountsId, toAccountsId, date, type, amount, currency, accountsBanksId);
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

    @ManyToOne
    @JoinColumn(name = "accounts_banks_id", referencedColumnName = "id")
    public AccountsBank getAccountsBanksByAccountsBanksId() {
        return accountsBanksByAccountsBanksId;
    }

    public void setAccountsBanksByAccountsBanksId(
            AccountsBank accountsBanksByAccountsBanksId
    ) {
        this.accountsBanksByAccountsBanksId = accountsBanksByAccountsBanksId;
    }
}
