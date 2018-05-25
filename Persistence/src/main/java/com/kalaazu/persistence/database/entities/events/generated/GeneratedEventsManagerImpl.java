package com.kalaazu.persistence.database.entities.events.generated;

import com.kalaazu.persistence.database.entities.Events;
import com.kalaazu.persistence.database.entities.events.EventsManager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.AbstractManager;
import com.speedment.runtime.field.Field;

import java.util.stream.Stream;

/**
 * The generated base implementation for the manager of every {@link
 * Events} entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedEventsManagerImpl
        extends AbstractManager<Events>
        implements GeneratedEventsManager {

    private final TableIdentifier<Events> tableIdentifier;

    protected GeneratedEventsManagerImpl() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "events");
    }

    @Override
    public TableIdentifier<Events> getTableIdentifier() {
        return tableIdentifier;
    }

    @Override
    public Stream<Field<Events>> fields() {
        return EventsManager.FIELDS.stream();
    }

    @Override
    public Stream<Field<Events>> primaryKeyFields() {
        return Stream.of(
                Events.ID
        );
    }
}