package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.moderators_logs.generated.GeneratedModeratorsLogs;

/**
 * Moderators' logs table.
 * =======================
 *
 * Contains the logged events produced by a moderator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface ModeratorsLogs extends GeneratedModeratorsLogs, Entity<Integer> {
    /**
     * Returns the moderator.
     *
     * @return The moderator.
     */
    Moderators getModerator();
}