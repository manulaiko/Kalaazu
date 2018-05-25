package com.kalaazu.persistence.database.entities.factions.generated;

import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.database.entities.Factions;
import com.kalaazu.persistence.database.entities.factions.FactionsImpl;
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
 * Factions}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedFactionsSqlAdapter {

    private final TableIdentifier<Factions> tableIdentifier;

    private SqlTypeMapperHelper<Integer, Boolean> isPublicHelper;

    private SqlTypeMapperHelper<Long, Vector2> lowMapsPositionHelper;

    private SqlTypeMapperHelper<Long, Vector2> highMapsPositionHelper;

    protected GeneratedFactionsSqlAdapter() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "factions");
    }

    @ExecuteBefore(RESOLVED)
    void installMethodName(
            @WithState(RESOLVED) SqlStreamSupplierComponent streamSupplierComponent,
            @WithState(RESOLVED) SqlPersistenceComponent persistenceComponent
    ) {
        streamSupplierComponent.install(tableIdentifier, this::apply);
        persistenceComponent.install(tableIdentifier);
    }

    protected Factions apply(ResultSet resultSet) throws SpeedmentException {
        final Factions entity = createEntity();
        try {
            entity.setId(resultSet.getByte(1));
            entity.setName(resultSet.getString(2));
            entity.setTag(resultSet.getString(3));
            entity.setDescription(resultSet.getString(4));
            entity.setIsPublic(isPublicHelper.apply(resultSet.getInt(5)));
            entity.setLowMapsId(resultSet.getByte(6));
            entity.setLowMapsPosition(lowMapsPositionHelper.apply(resultSet.getLong(7)));
            entity.setHighMapsId(resultSet.getByte(8));
            entity.setHighMapsPosition(highMapsPositionHelper.apply(resultSet.getLong(9)));
        } catch (final SQLException sqle) {
            throw new SpeedmentException(sqle);
        }
        return entity;
    }

    protected FactionsImpl createEntity() {
        return new FactionsImpl();
    }

    @ExecuteBefore(RESOLVED)
    void createHelpers(ProjectComponent projectComponent) {
        final Project project = projectComponent.getProject();
        isPublicHelper = SqlTypeMapperHelper.create(project, Factions.IS_PUBLIC, Factions.class);
        lowMapsPositionHelper = SqlTypeMapperHelper.create(project, Factions.LOW_MAPS_POSITION, Factions.class);
        highMapsPositionHelper = SqlTypeMapperHelper.create(project, Factions.HIGH_MAPS_POSITION, Factions.class);
    }
}