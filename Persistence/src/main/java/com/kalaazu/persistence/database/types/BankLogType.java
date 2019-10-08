package com.kalaazu.persistence.database.types;

/**
 * Bank log type.
 * ==============
 *
 * Represents the type of a log in the bank.
 *
 * 0 = Withdraw.
 * 1 = Deposit.
 * 2 = Donation
 */
public enum BankLogType {
    WITHDRAW,
    DEPOSIT,
    DONATION
}
