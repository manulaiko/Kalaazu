package com.kalaazu.persistence.database.entities.vouchers_redeem_logs.generated;

import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.Manager;
import com.kalaazu.persistence.database.entities.Vouchers;
import com.kalaazu.persistence.database.entities.VouchersRedeemLogs;
import com.speedment.common.annotation.GeneratedCode;
import lombok.Data;

import java.sql.Timestamp;

/**
 * The generated base implementation of the {@link
 * VouchersRedeemLogs}-interface.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
@Data
public abstract class GeneratedVouchersRedeemLogsImpl implements VouchersRedeemLogs {

    private Integer id;

    private short vouchersId;

    private int accountsId;

    private Timestamp date;

    protected GeneratedVouchersRedeemLogsImpl() {

    }

    @Override
    public Vouchers findVouchersId(Manager<Vouchers> foreignManager) {
        return foreignManager.stream()
                             .filter(Vouchers.ID.equal(vouchersId()))
                             .findAny()
                             .orElse(null);
    }

    @Override
    public Accounts findAccountsId(Manager<Accounts> foreignManager) {
        return foreignManager.stream()
                             .filter(Accounts.ID.equal(accountsId()))
                             .findAny()
                             .orElse(null);
    }
}