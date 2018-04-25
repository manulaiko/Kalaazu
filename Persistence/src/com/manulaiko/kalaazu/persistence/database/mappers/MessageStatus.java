package com.manulaiko.kalaazu.persistence.database.mappers;

/**
 * Message status.
 * ===============
 *
 * Maps `accounts_messages`.`to_accounts_status` fields to an enum.
 *
 * 0 = unread
 * 1 = read
 * 2 = deleted
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public enum MessageStatus {
    UNREAD,
    READ,
    DELETED
}
