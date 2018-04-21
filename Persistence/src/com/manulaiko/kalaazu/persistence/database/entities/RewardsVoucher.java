package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class RewardsVoucher {
    private int id;

    private int vouchersId;

    private int rewardsId;

    private Voucher vouchersByVouchersId;

    private Reward rewardsByRewardsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getVouchersId() {
        return vouchersId;
    }

    public void setVouchersId(int vouchersId) {
        this.vouchersId = vouchersId;
    }

    public int getRewardsId() {
        return rewardsId;
    }

    public void setRewardsId(int rewardsId) {
        this.rewardsId = rewardsId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        RewardsVoucher that = (RewardsVoucher) o;
        return id == that.id &&
               vouchersId == that.vouchersId &&
               rewardsId == that.rewardsId;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, vouchersId, rewardsId);
    }

    public Voucher getVouchersByVouchersId() {
        return vouchersByVouchersId;
    }

    public void setVouchersByVouchersId(Voucher vouchersByVouchersId) {
        this.vouchersByVouchersId = vouchersByVouchersId;
    }

    public Reward getRewardsByRewardsId() {
        return rewardsByRewardsId;
    }

    public void setRewardsByRewardsId(Reward rewardsByRewardsId) {
        this.rewardsByRewardsId = rewardsByRewardsId;
    }
}
