package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "accounts_banks", schema = "kalaazu", catalog = "")
public class AccountsBanksEntity {
    private int            id;
    private long           credits;
    private long           uridium;
    private byte           taxCredits;
    private byte           taxUridium;
    private AccountsEntity accountsByAccountsId;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "credits", nullable = false)
    public long getCredits() {
        return credits;
    }

    public void setCredits(long credits) {
        this.credits = credits;
    }

    @Basic
    @Column(name = "uridium", nullable = false)
    public long getUridium() {
        return uridium;
    }

    public void setUridium(long uridium) {
        this.uridium = uridium;
    }

    @Basic
    @Column(name = "tax_credits", nullable = false)
    public byte getTaxCredits() {
        return taxCredits;
    }

    public void setTaxCredits(byte taxCredits) {
        this.taxCredits = taxCredits;
    }

    @Basic
    @Column(name = "tax_uridium", nullable = false)
    public byte getTaxUridium() {
        return taxUridium;
    }

    public void setTaxUridium(byte taxUridium) {
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
        AccountsBanksEntity that = (AccountsBanksEntity) o;
        return id == that.id &&
               credits == that.credits &&
               uridium == that.uridium &&
               taxCredits == that.taxCredits &&
               taxUridium == that.taxUridium;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, credits, uridium, taxCredits, taxUridium);
    }

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    public AccountsEntity getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(AccountsEntity accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }
}
