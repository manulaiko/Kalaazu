package com.kalaazu.persistence.database.entities.moderators_logs;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Moderators;
import com.kalaazu.persistence.database.entities.ModeratorsLogs;
import com.kalaazu.persistence.database.entities.moderators_logs.generated.GeneratedModeratorsLogsImpl;

/**
 * The default implementation of the {@link
 * ModeratorsLogs}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class ModeratorsLogsImpl
        extends GeneratedModeratorsLogsImpl
        implements ModeratorsLogs {
    /**
     * The moderator.
     */
    private Moderators moderator;

    @Override
    public Moderators moderator() {
        if (this.moderator != null) {
            return this.moderator;
        }

        this.moderator = super.findModeratorsId(
                Database.instance()
                        .db()
                        .manager(Moderators.class)
        );

        return this.moderator;
    }
}