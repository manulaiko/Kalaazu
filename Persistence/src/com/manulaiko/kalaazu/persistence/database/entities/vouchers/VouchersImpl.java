package com.manulaiko.kalaazu.persistence.database.entities.vouchers;

import com.manulaiko.kalaazu.persistence.database.Database;
import com.manulaiko.kalaazu.persistence.database.entities.Rewards;
import com.manulaiko.kalaazu.persistence.database.entities.RewardsVouchers;
import com.manulaiko.kalaazu.persistence.database.entities.Vouchers;
import com.manulaiko.kalaazu.persistence.database.entities.VouchersRedeemLogs;
import com.manulaiko.kalaazu.persistence.database.entities.rewards_vouchers.RewardsVouchersManager;
import com.manulaiko.kalaazu.persistence.database.entities.vouchers.generated.GeneratedVouchersImpl;

import java.util.List;
import java.util.stream.Collectors;

/**
 * The default implementation of the {@link
 * Vouchers}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * TODO implement many-to-many relations for rewards.
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

    @Override
    public List<VouchersRedeemLogs> getRedeemLogs() {
        if (this.redeemLogs != null) {
            return this.redeemLogs;
        }

        this.redeemLogs = Database.getInstance()
                                  .all(VouchersRedeemLogs.class)
                                  .filter(l -> l.getVouchersId() == this.getId())
                                  .collect(Collectors.toList());

        return this.redeemLogs;
    }
}