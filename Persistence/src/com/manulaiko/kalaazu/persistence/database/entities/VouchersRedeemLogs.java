package com.manulaiko.kalaazu.persistence.database.entities;


import com.manulaiko.kalaazu.persistence.database.entities.vouchers_redeem_logs.generated.GeneratedVouchersRedeemLogs;

/**
 * The main interface for entities of the {@code vouchers_redeem_logs}-table in
 * the database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface VouchersRedeemLogs extends GeneratedVouchersRedeemLogs, Entity<Integer> {
    /**
     * Returns the account instance.
     *
     * @return Account instance.
     */
    Accounts getAccount();

    /**
     * Returns the voucher instance.
     *
     * @return Voucher instance.
     */
    Vouchers getVoucher();
}