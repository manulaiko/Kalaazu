package com.manulaiko.kalaazu.persistence.database.entities;

import java.util.Date;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class AccountsBanksLog {
    private int id;
    private int fromAccountsId;
    private int toAccountsId;
    private Date date;
    private int type;
    private int amount;
    private int currency;
    private int accountsBanksId;

    private Account accountsByFromAccountsId;
    private Account accountsByToAccountsId;
    private AccountsBank accountsBanksByAccountsBanksId;

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

    public int getToAccountsId() {
        return toAccountsId;
    }

    public void setToAccountsId(int toAccountsId) {
        this.toAccountsId = toAccountsId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getCurrency() {
        return currency;
    }

    public void setCurrency(int currency) {
        this.currency = currency;
    }

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

    public AccountsBank getAccountsBanksByAccountsBanksId() {
        return accountsBanksByAccountsBanksId;
    }

    public void setAccountsBanksByAccountsBanksId(
            AccountsBank accountsBanksByAccountsBanksId
    ) {
        this.accountsBanksByAccountsBanksId = accountsBanksByAccountsBanksId;
    }
}
