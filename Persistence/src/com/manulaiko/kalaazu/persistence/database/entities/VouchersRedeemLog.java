package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "vouchers_redeem_logs", schema = "kalaazu")
public class VouchersRedeemLog {
    private int id;

    private int vouchersId;

    private int accountsId;

    private Date date;

    private Voucher vouchersByVouchersId;

    private Account accountsByAccountsId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "vouchers_id")
    public int getVouchersId() {
        return vouchersId;
    }

    public void setVouchersId(int vouchersId) {
        this.vouchersId = vouchersId;
    }

    @Basic
    @Column(name = "accounts_id")
    public int getAccountsId() {
        return accountsId;
    }

    public void setAccountsId(int accountsId) {
        this.accountsId = accountsId;
    }

    @Basic
    @Column(name = "date")
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
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
        VouchersRedeemLog that = (VouchersRedeemLog) o;
        return id == that.id &&
               vouchersId == that.vouchersId &&
               accountsId == that.accountsId &&
               Objects.equals(date, that.date);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, vouchersId, accountsId, date);
    }

    @ManyToOne
    @JoinColumn(name = "vouchers_id", referencedColumnName = "id", nullable = false)
    public Voucher getVouchersByVouchersId() {
        return vouchersByVouchersId;
    }

    public void setVouchersByVouchersId(Voucher vouchersByVouchersId) {
        this.vouchersByVouchersId = vouchersByVouchersId;
    }

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }
}
