package com.kalaazu.persistence.database.entities.vouchers_redeem_logs;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.Vouchers;
import com.kalaazu.persistence.database.entities.VouchersRedeemLogs;
import com.kalaazu.persistence.database.entities.vouchers_redeem_logs.generated.GeneratedVouchersRedeemLogsImpl;

/**
 * The default implementation of the {@link
 * VouchersRedeemLogs}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class VouchersRedeemLogsImpl
        extends GeneratedVouchersRedeemLogsImpl
        implements VouchersRedeemLogs {
    /**
     * Account that redeemed the voucher.
     */
    private Accounts account;

    /**
     * Voucher code.
     */
    private Vouchers voucher;

    @Override
    public Accounts getAccount() {
        if (this.account != null) {
            return this.account;
        }

        this.account = Database.getInstance()
                               .find(super.getAccountsId(), Accounts.class)
                               .orElse(null);

        return this.account;
    }

    @Override
    public Vouchers getVoucher() {
        if (this.voucher != null) {
            return this.voucher;
        }

        this.voucher = Database.getInstance()
                               .find(super.getVouchersId(), Vouchers.class)
                               .orElse(null);

        return this.voucher;
    }
}