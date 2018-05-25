package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.rewards_vouchers.generated.GeneratedRewardsVouchers;

/**
 * Rewards to vouchers table.
 * ==========================
 *
 * Maps the rewards to their given vouchers.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface RewardsVouchers extends GeneratedRewardsVouchers, Entity<Short> {
    /**
     * Returns the reward.
     *
     * @return The reward.
     */
    Rewards getReward();

    /**
     * Returns the voucher.
     *
     * @return The voucher.
     */
    Vouchers getVoucher();
}