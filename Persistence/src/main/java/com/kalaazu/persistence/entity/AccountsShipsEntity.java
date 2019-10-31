package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "accounts_ships", schema = "kalaazu", catalog = "")
public class AccountsShipsEntity {
    private int            id;
    private long           position;
    private int            health;
    private int            nanohull;
    private byte           gfx;
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
    @Column(name = "position", nullable = false)
    public long getPosition() {
        return position;
    }

    public void setPosition(long position) {
        this.position = position;
    }

    @Basic
    @Column(name = "health", nullable = false)
    public int getHealth() {
        return health;
    }

    public void setHealth(int health) {
        this.health = health;
    }

    @Basic
    @Column(name = "nanohull", nullable = false)
    public int getNanohull() {
        return nanohull;
    }

    public void setNanohull(int nanohull) {
        this.nanohull = nanohull;
    }

    @Basic
    @Column(name = "gfx", nullable = false)
    public byte getGfx() {
        return gfx;
    }

    public void setGfx(byte gfx) {
        this.gfx = gfx;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AccountsShipsEntity that = (AccountsShipsEntity) o;
        return id == that.id &&
               position == that.position &&
               health == that.health &&
               nanohull == that.nanohull &&
               gfx == that.gfx;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, position, health, nanohull, gfx);
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
