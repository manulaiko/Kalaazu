package com.kalaazu.persistence.database.entities.techfactory_drones.generated;

import com.kalaazu.persistence.database.entities.TechfactoryDrones;
import com.kalaazu.persistence.database.entities.techfactory_drones.TechfactoryDronesManager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.AbstractManager;
import com.speedment.runtime.field.Field;

import java.util.stream.Stream;

/**
 * The generated base implementation for the manager of every {@link
 * TechfactoryDrones}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedTechfactoryDronesManagerImpl
        extends AbstractManager<TechfactoryDrones>
        implements GeneratedTechfactoryDronesManager {

    private final TableIdentifier<TechfactoryDrones> tableIdentifier;

    protected GeneratedTechfactoryDronesManagerImpl() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "techfactory_drones");
    }

    @Override
    public TableIdentifier<TechfactoryDrones> getTableIdentifier() {
        return tableIdentifier;
    }

    @Override
    public Stream<Field<TechfactoryDrones>> fields() {
        return TechfactoryDronesManager.FIELDS.stream();
    }

    @Override
    public Stream<Field<TechfactoryDrones>> primaryKeyFields() {
        return Stream.of(
                TechfactoryDrones.ID
        );
    }
}