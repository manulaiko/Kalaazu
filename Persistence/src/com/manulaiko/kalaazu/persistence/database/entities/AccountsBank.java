package com.manulaiko.kalaazu.persistence.database.entities;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class AccountsBank {
    private int id;
    private int accountsId;
    private long credits;
    private long uridium;
    private BigDecimal taxCredits;
    private BigDecimal taxUridium;

    private Account accountsByAccountsId;
    private Collection<AccountsBanksLog> accountsBanksLogsById;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountsId() {
        return accountsId;
    }

    public void setAccountsId(int accountsId) {
        this.accountsId = accountsId;
    }

    public long getCredits() {
        return credits;
    }

    public void setCredits(long credits) {
        this.credits = credits;
    }

    public long getUridium() {
        return uridium;
    }

    public void setUridium(long uridium) {
        this.uridium = uridium;
    }

    public BigDecimal getTaxCredits() {
        return taxCredits;
    }

    public void setTaxCredits(BigDecimal taxCredits) {
        this.taxCredits = taxCredits;
    }

    public BigDecimal getTaxUridium() {
        return taxUridium;
    }

    public void setTaxUridium(BigDecimal taxUridium) {
        this.taxUridium = taxUridium;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AccountsBank that = (AccountsBank) o;
        return id == that.id &&
               accountsId == that.accountsId &&
               credits == that.credits &&
               uridium == that.uridium &&
               Objects.equals(taxCredits, that.taxCredits) &&
               Objects.equals(taxUridium, that.taxUridium);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, accountsId, credits, uridium, taxCredits, taxUridium);
    }

    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }

    public Collection<AccountsBanksLog> getAccountsBanksLogsById() {
        return accountsBanksLogsById;
    }

    public void setAccountsBanksLogsById(
            Collection<AccountsBanksLog> accountsBanksLogsById
    ) {
        this.accountsBanksLogsById = accountsBanksLogsById;
    }
}
