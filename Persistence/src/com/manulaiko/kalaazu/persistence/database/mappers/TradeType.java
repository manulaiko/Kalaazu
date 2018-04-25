package com.manulaiko.kalaazu.persistence.database.mappers;

/**
 * Trade type.
 * ===========
 *
 * Maps `trade_items`.`type` fields to an enum.
 *
 * 0 = hourly
 * 1 = daily
 * 2 = weekly
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public enum TradeType {
    HOURLY,
    DAILY,
    WEEKLY
}
