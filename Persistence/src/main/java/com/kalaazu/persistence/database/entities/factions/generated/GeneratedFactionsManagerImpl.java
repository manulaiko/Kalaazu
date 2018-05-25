package com.kalaazu.persistence.database.entities.factions.generated;

import com.kalaazu.persistence.database.entities.Factions;
import com.kalaazu.persistence.database.entities.factions.FactionsManager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.AbstractManager;
import com.speedment.runtime.field.Field;

import java.util.stream.Stream;

/**
 * The generated base implementation for the manager of every {@link
 * Factions}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedFactionsManagerImpl
        extends AbstractManager<Factions>
        implements GeneratedFactionsManager {

    private final TableIdentifier<Factions> tableIdentifier;

    protected GeneratedFactionsManagerImpl() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "factions");
    }

    @Override
    public TableIdentifier<Factions> getTableIdentifier() {
        return tableIdentifier;
    }

    @Override
    public Stream<Field<Factions>> fields() {
        return FactionsManager.FIELDS.stream();
    }

    @Override
    public Stream<Field<Factions>> primaryKeyFields() {
        return Stream.of(
                Factions.ID
        );
    }
}