package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.server_logs.generated.GeneratedServerLogs;

/**
 * Server logs table.
 * ==================
 *
 * Contains the logs of certain events that happen
 * in the server and need their attendance.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface ServerLogs extends GeneratedServerLogs, Entity<Integer> {
}