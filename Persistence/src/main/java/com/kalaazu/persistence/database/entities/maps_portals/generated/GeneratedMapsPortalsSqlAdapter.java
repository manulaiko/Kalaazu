package com.kalaazu.persistence.database.entities.maps_portals.generated;

import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.database.entities.MapsPortals;
import com.kalaazu.persistence.database.entities.maps_portals.MapsPortalsImpl;
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
 * MapsPortals}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedMapsPortalsSqlAdapter {

    private final TableIdentifier<MapsPortals> tableIdentifier;

    private SqlTypeMapperHelper<Long, Vector2> positionHelper;

    private SqlTypeMapperHelper<Long, Vector2> targetPositionHelper;

    private SqlTypeMapperHelper<Integer, Boolean> isVisibleHelper;

    private SqlTypeMapperHelper<Integer, Boolean> isWorkingHelper;

    protected GeneratedMapsPortalsSqlAdapter() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "maps_portals");
    }

    @ExecuteBefore(RESOLVED)
    void installMethodName(
            @WithState(RESOLVED) SqlStreamSupplierComponent streamSupplierComponent,
            @WithState(RESOLVED) SqlPersistenceComponent persistenceComponent
    ) {
        streamSupplierComponent.install(tableIdentifier, this::apply);
        persistenceComponent.install(tableIdentifier);
    }

    protected MapsPortals apply(ResultSet resultSet) throws SpeedmentException {
        final MapsPortals entity = createEntity();
        try {
            entity.setId(resultSet.getByte(1));
            entity.setLevelsId(resultSet.getByte(2));
            entity.setMapsId(resultSet.getByte(3));
            entity.setPosition(positionHelper.apply(resultSet.getLong(4)));
            entity.setTargetMapsId(resultSet.getByte(5));
            entity.setTargetPosition(targetPositionHelper.apply(resultSet.getLong(6)));
            entity.setIsVisible(isVisibleHelper.apply(resultSet.getInt(7)));
            entity.setIsWorking(isWorkingHelper.apply(resultSet.getInt(8)));
            entity.setGfx(resultSet.getByte(9));
        } catch (final SQLException sqle) {
            throw new SpeedmentException(sqle);
        }
        return entity;
    }

    protected MapsPortalsImpl createEntity() {
        return new MapsPortalsImpl();
    }

    @ExecuteBefore(RESOLVED)
    void createHelpers(ProjectComponent projectComponent) {
        final Project project = projectComponent.getProject();
        positionHelper = SqlTypeMapperHelper.create(project, MapsPortals.POSITION, MapsPortals.class);
        targetPositionHelper = SqlTypeMapperHelper.create(project, MapsPortals.TARGET_POSITION, MapsPortals.class);
        isVisibleHelper = SqlTypeMapperHelper.create(project, MapsPortals.IS_VISIBLE, MapsPortals.class);
        isWorkingHelper = SqlTypeMapperHelper.create(project, MapsPortals.IS_WORKING, MapsPortals.class);
    }
}