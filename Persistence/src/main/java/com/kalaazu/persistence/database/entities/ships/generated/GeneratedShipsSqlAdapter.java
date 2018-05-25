package com.kalaazu.persistence.database.entities.ships.generated;

import com.kalaazu.persistence.database.entities.Ships;
import com.kalaazu.persistence.database.entities.ships.ShipsImpl;
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
 * Ships} entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedShipsSqlAdapter {

    private final TableIdentifier<Ships> tableIdentifier;

    protected GeneratedShipsSqlAdapter() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "ships");
    }

    @ExecuteBefore(RESOLVED)
    void installMethodName(
            @WithState(RESOLVED) SqlStreamSupplierComponent streamSupplierComponent,
            @WithState(RESOLVED) SqlPersistenceComponent persistenceComponent
    ) {
        streamSupplierComponent.install(tableIdentifier, this::apply);
        persistenceComponent.install(tableIdentifier);
    }

    protected Ships apply(ResultSet resultSet) throws SpeedmentException {
        final Ships entity = createEntity();
        try {
            entity.setId(resultSet.getByte(1));
            entity.setItemsId(resultSet.getShort(2));
            entity.setHealth(resultSet.getInt(3));
            entity.setSpeed(resultSet.getShort(4));
            entity.setCargo(resultSet.getShort(5));
            entity.setBatteries(resultSet.getShort(6));
            entity.setRockets(resultSet.getShort(7));
            entity.setLasers(resultSet.getByte(8));
            entity.setHellstorms(resultSet.getByte(9));
            entity.setGenerators(resultSet.getByte(10));
            entity.setExtras(resultSet.getByte(11));
            entity.setGfx(resultSet.getByte(12));
        } catch (final SQLException sqle) {
            throw new SpeedmentException(sqle);
        }
        return entity;
    }

    protected ShipsImpl createEntity() {
        return new ShipsImpl();
    }
}