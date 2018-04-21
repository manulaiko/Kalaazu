package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Voucher {
    private int id;

    private String code;

    private int limit;

    private Collection<RewardsVoucher> rewardsVouchersById;

    private Collection<VouchersRedeemLog> vouchersRedeemLogsById;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Voucher voucher = (Voucher) o;
        return id == voucher.id &&
               limit == voucher.limit &&
               Objects.equals(code, voucher.code);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, code, limit);
    }

    public Collection<RewardsVoucher> getRewardsVouchersById() {
        return rewardsVouchersById;
    }

    public void setRewardsVouchersById(
            Collection<RewardsVoucher> rewardsVouchersById
    ) {
        this.rewardsVouchersById = rewardsVouchersById;
    }

    public Collection<VouchersRedeemLog> getVouchersRedeemLogsById() {
        return vouchersRedeemLogsById;
    }

    public void setVouchersRedeemLogsById(
            Collection<VouchersRedeemLog> vouchersRedeemLogsById
    ) {
        this.vouchersRedeemLogsById = vouchersRedeemLogsById;
    }
}
