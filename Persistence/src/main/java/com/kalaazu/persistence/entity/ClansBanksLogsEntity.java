package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "clans_banks_logs", schema = "kalaazu", catalog = "")
public class ClansBanksLogsEntity {
    private int              id;
    private Timestamp        date;
    private byte             type;
    private int              amount;
    private byte             currency;
    private ClansBanksEntity clansBanksByClansBanksId;
    private AccountsEntity   accountsByFromAccountsId;
    private AccountsEntity   accountsByToAccountsId;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
    @Column(name = "type", nullable = false)
    public byte getType() {
        return type;
    }

    public void setType(byte type) {
        this.type = type;
    }

    @Basic
    @Column(name = "amount", nullable = false)
    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Basic
    @Column(name = "currency", nullable = false)
    public byte getCurrency() {
        return currency;
    }

    public void setCurrency(byte currency) {
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
        ClansBanksLogsEntity that = (ClansBanksLogsEntity) o;
        return id == that.id &&
               type == that.type &&
               amount == that.amount &&
               currency == that.currency &&
               Objects.equals(date, that.date);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, date, type, amount, currency);
    }

    @ManyToOne
    @JoinColumn(name = "clans_banks_id", referencedColumnName = "id", nullable = false)
    public ClansBanksEntity getClansBanksByClansBanksId() {
        return clansBanksByClansBanksId;
    }

    public void setClansBanksByClansBanksId(ClansBanksEntity clansBanksByClansBanksId) {
        this.clansBanksByClansBanksId = clansBanksByClansBanksId;
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
