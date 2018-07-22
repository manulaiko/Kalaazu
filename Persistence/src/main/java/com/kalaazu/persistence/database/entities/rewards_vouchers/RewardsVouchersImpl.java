package com.kalaazu.persistence.database.entities.rewards_vouchers;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Rewards;
import com.kalaazu.persistence.database.entities.RewardsVouchers;
import com.kalaazu.persistence.database.entities.Vouchers;
import com.kalaazu.persistence.database.entities.rewards_vouchers.generated.GeneratedRewardsVouchersImpl;

/**
 * The default implementation of the {@link
 * RewardsVouchers}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class RewardsVouchersImpl
        extends GeneratedRewardsVouchersImpl
        implements RewardsVouchers {
    /**
     * The reward.
     */
    private Rewards reward;

    /**
     * The voucher.
     */
    private Vouchers voucher;

    @Override
    public Rewards reward() {
        if (this.reward != null) {
            return this.reward;
        }

        this.reward = super.findRewardsId(
                Database.getInstance()
                        .db()
                        .manager(Rewards.class)
        );

        return this.reward;
    }

    @Override
    public Vouchers voucher() {
        if (this.voucher != null) {
            return this.voucher;
        }

        this.voucher = super.findVouchersId(
                Database.getInstance()
                        .db()
                        .manager(Vouchers.class)
        );

        return this.voucher;
    }
}