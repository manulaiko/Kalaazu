package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "accounts_skylabs", schema = "kalaazu", catalog = "")
public class AccountsSkylabsEntity {
    private int            id;
    private int            space;
    private Timestamp      upgrade;
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
    @Column(name = "space", nullable = false)
    public int getSpace() {
        return space;
    }

    public void setSpace(int space) {
        this.space = space;
    }

    @Basic
    @Column(name = "upgrade", nullable = true)
    public Timestamp getUpgrade() {
        return upgrade;
    }

    public void setUpgrade(Timestamp upgrade) {
        this.upgrade = upgrade;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AccountsSkylabsEntity that = (AccountsSkylabsEntity) o;
        return id == that.id &&
               space == that.space &&
               Objects.equals(upgrade, that.upgrade);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, space, upgrade);
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
