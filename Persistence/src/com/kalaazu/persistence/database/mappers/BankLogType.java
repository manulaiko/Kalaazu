package com.kalaazu.persistence.database.mappers;

/**
 * Bank log type.
 * ==============
 *
 * Maps `accounts_banks_logs`.`type` fields to an enum.
 *
 * 0 = withdraw
 * 1 = deposit
 * 2 = donation
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public enum BankLogType {
    WITHDRAW,
    DEPOSIT,
    DONATION
}
