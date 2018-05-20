package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.moderators.generated.GeneratedModerators;

import java.util.List;

/**
 * Moderators table.
 * =================
 *
 * Contains the moderators of the server.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Moderators extends GeneratedModerators, Entity<Byte> {
    /**
     * Returns the log entries of this moderator.
     *
     * @return Log entries.
     */
    List<ModeratorsLogs> getLogs();

    /**
     * Returns the account of this moderator.
     *
     * @return Moderator's account.
     */
    Accounts getAccount();

    /**
     * Returns the moderator role.
     *
     * @return Moderator role.
     */
    ModeratorsRoles getRole();
}