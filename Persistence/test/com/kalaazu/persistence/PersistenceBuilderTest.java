package com.kalaazu.persistence;

import com.kalaazu.eventsystem.EventManagerBuilder;
import com.speedment.runtime.core.ApplicationBuilder;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class PersistenceBuilderTest {
    @Test
    void build() {
        var eventManager = new EventManagerBuilder().build();

        var persistence = new PersistenceBuilder().setEventManager(eventManager)
                                                  .addLogType(ApplicationBuilder.LogType.APPLICATION_BUILDER)
                                                  .addLogType(ApplicationBuilder.LogType.CONNECTION)
                                                  .addLogType(ApplicationBuilder.LogType.PERSIST)
                                                  .addLogType(ApplicationBuilder.LogType.REMOVE)
                                                  .addLogType(ApplicationBuilder.LogType.STREAM)
                                                  .addLogType(ApplicationBuilder.LogType.STREAM_OPTIMIZER)
                                                  .addLogType(ApplicationBuilder.LogType.TRANSACTION)
                                                  .addLogType(ApplicationBuilder.LogType.UPDATE)
                                                  .build();

        assertNotNull(persistence);
    }
}