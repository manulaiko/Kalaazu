package com.kalaazu.persistence.database.entities.server_logs.generated;

import com.kalaazu.persistence.database.entities.Manager;
import com.kalaazu.persistence.database.entities.ServerLogs;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.field.Field;

import java.util.List;

import static java.util.Arrays.asList;
import static java.util.Collections.unmodifiableList;

/**
 * The generated base interface for the manager of every {@link
 * ServerLogs}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedServerLogsManager extends Manager<ServerLogs> {

    List<Field<ServerLogs>> FIELDS = unmodifiableList(asList(
            ServerLogs.ID,
            ServerLogs.DATE,
            ServerLogs.LEVEL,
            ServerLogs.TYPE,
            ServerLogs.CONTEXT
    ));

    @Override
    default Class<ServerLogs> getEntityClass() {
        return ServerLogs.class;
    }
}