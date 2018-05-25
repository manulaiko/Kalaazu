package com.kalaazu.persistence.database.entities.collectables.generated;

import com.kalaazu.persistence.database.entities.Collectables;
import com.kalaazu.persistence.database.entities.collectables.CollectablesImpl;
import com.kalaazu.persistence.database.mappers.CollectableType;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.common.injector.annotation.ExecuteBefore;
import com.speedment.common.injector.annotation.WithState;
import com.speedment.runtime.config.Project;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.component.ProjectComponent;
import com.speedment.runtime.core.component.sql.SqlPersistenceComponent;
import com.speedment.runtime.core.component.sql.SqlStreamSupplierComponent;
import com.speedment.runtime.core.component.sql.SqlTypeMapperHelper;
import com.speedment.runtime.core.exception.SpeedmentException;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.speedment.common.injector.State.RESOLVED;

/**
 * The generated Sql Adapter for a {@link
 * Collectables}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedCollectablesSqlAdapter {

    private final TableIdentifier<Collectables> tableIdentifier;

    private SqlTypeMapperHelper<Byte, CollectableType> typeHelper;

    protected GeneratedCollectablesSqlAdapter() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "collectables");
    }

    @ExecuteBefore(RESOLVED)
    void installMethodName(
            @WithState(RESOLVED) SqlStreamSupplierComponent streamSupplierComponent,
            @WithState(RESOLVED) SqlPersistenceComponent persistenceComponent
    ) {
        streamSupplierComponent.install(tableIdentifier, this::apply);
        persistenceComponent.install(tableIdentifier);
    }

    protected Collectables apply(ResultSet resultSet) throws SpeedmentException {
        final Collectables entity = createEntity();
        try {
            entity.setId(resultSet.getByte(1));
            entity.setGfx(resultSet.getByte(2));
            entity.setType(typeHelper.apply(resultSet.getByte(3)));
            entity.setName(resultSet.getString(4));
        } catch (final SQLException sqle) {
            throw new SpeedmentException(sqle);
        }
        return entity;
    }

    protected CollectablesImpl createEntity() {
        return new CollectablesImpl();
    }

    @ExecuteBefore(RESOLVED)
    void createHelpers(ProjectComponent projectComponent) {
        final Project project = projectComponent.getProject();
        typeHelper = SqlTypeMapperHelper.create(project, Collectables.TYPE, Collectables.class);
    }
}