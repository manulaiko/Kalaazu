package com.kalaazu.persistence.database.entities.techfactory_drones.generated;

import com.kalaazu.persistence.database.entities.TechfactoryDrones;
import com.kalaazu.persistence.database.entities.techfactory_drones.TechfactoryDronesImpl;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.common.injector.annotation.ExecuteBefore;
import com.speedment.common.injector.annotation.WithState;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.component.sql.SqlPersistenceComponent;
import com.speedment.runtime.core.component.sql.SqlStreamSupplierComponent;
import com.speedment.runtime.core.exception.SpeedmentException;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.speedment.common.injector.State.RESOLVED;

/**
 * The generated Sql Adapter for a {@link
 * TechfactoryDrones}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedTechfactoryDronesSqlAdapter {

    private final TableIdentifier<TechfactoryDrones> tableIdentifier;

    protected GeneratedTechfactoryDronesSqlAdapter() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "techfactory_drones");
    }

    @ExecuteBefore(RESOLVED)
    void installMethodName(
            @WithState(RESOLVED) SqlStreamSupplierComponent streamSupplierComponent,
            @WithState(RESOLVED) SqlPersistenceComponent persistenceComponent
    ) {
        streamSupplierComponent.install(tableIdentifier, this::apply);
        persistenceComponent.install(tableIdentifier);
    }

    protected TechfactoryDrones apply(ResultSet resultSet) throws SpeedmentException {
        final TechfactoryDrones entity = createEntity();
        try {
            entity.setId(resultSet.getByte(1));
            entity.setName(resultSet.getString(2));
            entity.setDescription(resultSet.getString(3));
            entity.setTime(resultSet.getByte(4));
            entity.setParts(resultSet.getByte(5));
            entity.setPrice(resultSet.getInt(6));
            entity.setFactor(resultSet.getByte(7));
        } catch (final SQLException sqle) {
            throw new SpeedmentException(sqle);
        }
        return entity;
    }

    protected TechfactoryDronesImpl createEntity() {
        return new TechfactoryDronesImpl();
    }
}