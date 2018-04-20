package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "rewards_vouchers", schema = "kalaazu")
public class RewardsVoucher {
    private int id;

    private int vouchersId;

    private int rewardsId;

    private Voucher vouchersByVouchersId;

    private Reward rewardsByRewardsId;

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
    @Column(name = "rewards_id")
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

    @ManyToOne
    @JoinColumn(name = "vouchers_id", referencedColumnName = "id", nullable = false)
    public Voucher getVouchersByVouchersId() {
        return vouchersByVouchersId;
    }

    public void setVouchersByVouchersId(Voucher vouchersByVouchersId) {
        this.vouchersByVouchersId = vouchersByVouchersId;
    }

    @ManyToOne
    @JoinColumn(name = "rewards_id", referencedColumnName = "id", nullable = false)
    public Reward getRewardsByRewardsId() {
        return rewardsByRewardsId;
    }

    public void setRewardsByRewardsId(Reward rewardsByRewardsId) {
        this.rewardsByRewardsId = rewardsByRewardsId;
    }
}
