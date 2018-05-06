package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.vouchers.generated.GeneratedVouchers;

import java.util.List;

/**
 * Vouchers table.
 * ===============
 *
 * Contains the voucher codes available in the server.
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