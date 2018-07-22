package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.vouchers_redeem_logs.generated.GeneratedVouchersRedeemLogs;

/**
 * Vouchers' redeem logs.
 * ======================
 *
 * Contains the redeem logs of the vouchers.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface VouchersRedeemLogs extends GeneratedVouchersRedeemLogs, Entity<Integer> {
    /**
     * Returns the account instance.
     *
     * @return Account instance.
     */
    Accounts account();

    /**
     * Returns the voucher instance.
     *
     * @return Voucher instance.
     */
    Vouchers voucher();
}