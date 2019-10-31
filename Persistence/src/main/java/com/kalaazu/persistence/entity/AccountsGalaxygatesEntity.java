package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "accounts_galaxygates", schema = "kalaazu", catalog = "")
public class AccountsGalaxygatesEntity {
    private int            id;
    private byte           parts;
    private byte           lifes;
    private byte           wave;
    private short          times;
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
    @Column(name = "parts", nullable = false)
    public byte getParts() {
        return parts;
    }

    public void setParts(byte parts) {
        this.parts = parts;
    }

    @Basic
    @Column(name = "lifes", nullable = false)
    public byte getLifes() {
        return lifes;
    }

    public void setLifes(byte lifes) {
        this.lifes = lifes;
    }

    @Basic
    @Column(name = "wave", nullable = false)
    public byte getWave() {
        return wave;
    }

    public void setWave(byte wave) {
        this.wave = wave;
    }

    @Basic
    @Column(name = "times", nullable = false)
    public short getTimes() {
        return times;
    }

    public void setTimes(short times) {
        this.times = times;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AccountsGalaxygatesEntity that = (AccountsGalaxygatesEntity) o;
        return id == that.id &&
               parts == that.parts &&
               lifes == that.lifes &&
               wave == that.wave &&
               times == that.times;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, parts, lifes, wave, times);
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
