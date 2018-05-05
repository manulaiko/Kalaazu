package com.kalaazu.persistence.database.entities.vouchers;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Rewards;
import com.kalaazu.persistence.database.entities.RewardsVouchers;
import com.kalaazu.persistence.database.entities.Vouchers;
import com.kalaazu.persistence.database.entities.VouchersRedeemLogs;
import com.kalaazu.persistence.database.entities.vouchers.generated.GeneratedVouchersImpl;

import java.util.List;
import java.util.stream.Collectors;

/**
 * The default implementation of the {@link
 * Vouchers}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class VouchersImpl
        extends GeneratedVouchersImpl
        implements Vouchers {
    /**
     * Redeem logs.
     */
    private List<VouchersRedeemLogs> redeemLogs;

    /**
     * Rewards.
     */
    private List<Rewards> rewards;

    @Override
    public List<VouchersRedeemLogs> getRedeemLogs() {
        if (this.redeemLogs != null) {
            return this.redeemLogs;
        }

        this.redeemLogs = Database.getInstance()
                                  .all(VouchersRedeemLogs.class)
                                  .filter(l -> l.getVouchersId() == super.getId())
                                  .collect(Collectors.toList());

        return this.redeemLogs;
    }

    @Override
    public List<Rewards> getRewards() {
        if (this.rewards != null) {
            return this.rewards;
        }

        this.rewards = Database.getInstance()
                               .all(RewardsVouchers.class)
                               .filter(r -> r.getVouchersId() == super.getId())
                               .map(RewardsVouchers::getReward)
                               .collect(Collectors.toList());

        return this.rewards;
    }
}