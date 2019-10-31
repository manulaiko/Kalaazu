package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "vouchers_redeem_logs", schema = "kalaazu", catalog = "")
public class VouchersRedeemLogsEntity {
    private int            id;
    private Timestamp      date;
    private VouchersEntity vouchersByVouchersId;
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
    @Column(name = "date", nullable = false)
    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
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
        VouchersRedeemLogsEntity that = (VouchersRedeemLogsEntity) o;
        return id == that.id &&
               Objects.equals(date, that.date);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, date);
    }

    @ManyToOne
    @JoinColumn(name = "vouchers_id", referencedColumnName = "id", nullable = false)
    public VouchersEntity getVouchersByVouchersId() {
        return vouchersByVouchersId;
    }

    public void setVouchersByVouchersId(VouchersEntity vouchersByVouchersId) {
        this.vouchersByVouchersId = vouchersByVouchersId;
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
