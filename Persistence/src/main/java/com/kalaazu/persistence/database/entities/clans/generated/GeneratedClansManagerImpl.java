package com.kalaazu.persistence.database.entities.clans.generated;

import com.kalaazu.persistence.database.entities.Clans;
import com.kalaazu.persistence.database.entities.clans.ClansManager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.AbstractManager;
import com.speedment.runtime.field.Field;

import java.util.stream.Stream;

/**
 * The generated base implementation for the manager of every {@link
 * Clans} entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedClansManagerImpl
        extends AbstractManager<Clans>
        implements GeneratedClansManager {

    private final TableIdentifier<Clans> tableIdentifier;

    protected GeneratedClansManagerImpl() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "clans");
    }

    @Override
    public TableIdentifier<Clans> getTableIdentifier() {
        return tableIdentifier;
    }

    @Override
    public Stream<Field<Clans>> fields() {
        return ClansManager.FIELDS.stream();
    }

    @Override
    public Stream<Field<Clans>> primaryKeyFields() {
        return Stream.of(
                Clans.ID
        );
    }
}