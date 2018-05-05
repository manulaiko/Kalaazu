package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.vouchers.generated.GeneratedVouchers;

import java.util.List;

/**
 * The main interface for entities of the {@code vouchers}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Vouchers extends GeneratedVouchers, Entity<Short> {
    /**
     * Returns the redeem logs of this voucher.
     *
     * @return Redeem logs of this voucher.
     */
    List<VouchersRedeemLogs> getRedeemLogs();

    /**
     * Returns the rewards of this voucher.
     *
     * @return Rewards of this voucher.
     */
    List<Rewards> getRewards();
}