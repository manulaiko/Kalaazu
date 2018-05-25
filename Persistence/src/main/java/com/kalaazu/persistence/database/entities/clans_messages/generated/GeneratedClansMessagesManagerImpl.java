package com.kalaazu.persistence.database.entities.clans_messages.generated;

import com.kalaazu.persistence.database.entities.ClansMessages;
import com.kalaazu.persistence.database.entities.clans_messages.ClansMessagesManager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.AbstractManager;
import com.speedment.runtime.field.Field;

import java.util.stream.Stream;

/**
 * The generated base implementation for the manager of every {@link
 * ClansMessages}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedClansMessagesManagerImpl
        extends AbstractManager<ClansMessages>
        implements GeneratedClansMessagesManager {

    private final TableIdentifier<ClansMessages> tableIdentifier;

    protected GeneratedClansMessagesManagerImpl() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "clans_messages");
    }

    @Override
    public TableIdentifier<ClansMessages> getTableIdentifier() {
        return tableIdentifier;
    }

    @Override
    public Stream<Field<ClansMessages>> fields() {
        return ClansMessagesManager.FIELDS.stream();
    }

    @Override
    public Stream<Field<ClansMessages>> primaryKeyFields() {
        return Stream.of(
                ClansMessages.ID
        );
    }
}