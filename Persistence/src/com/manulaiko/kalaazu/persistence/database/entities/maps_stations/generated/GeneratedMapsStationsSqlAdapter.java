package com.manulaiko.kalaazu.persistence.database.entities.maps_stations.generated;

import com.manulaiko.kalaazu.persistence.database.entities.maps_stations.MapsStations;
import com.manulaiko.kalaazu.persistence.database.entities.maps_stations.MapsStationsImpl;
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
import static com.speedment.runtime.core.internal.util.sql.ResultSetUtil.*;

/**
 * The generated Sql Adapter for a {@link
 * com.manulaiko.kalaazu.persistence.database.entities.maps_stations.MapsStations}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedMapsStationsSqlAdapter {
    
    private final TableIdentifier<MapsStations> tableIdentifier;
    
    protected GeneratedMapsStationsSqlAdapter() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "maps_stations");
    }
    
    @ExecuteBefore(RESOLVED)
    void installMethodName(@WithState(RESOLVED) SqlStreamSupplierComponent streamSupplierComponent,
            @WithState(RESOLVED) SqlPersistenceComponent persistenceComponent) {
        streamSupplierComponent.install(tableIdentifier, this::apply);
        persistenceComponent.install(tableIdentifier);
    }
    
    protected MapsStations apply(ResultSet resultSet) throws SpeedmentException {
        final MapsStations entity = createEntity();
        try {
            entity.setId(         resultSet.getInt(1)    );
            entity.setPosition(   resultSet.getString(2) );
            entity.setMapsId(     getInt(resultSet, 3)   );
            entity.setFactionsId( getInt(resultSet, 4)   );
        } catch (final SQLException sqle) {
            throw new SpeedmentException(sqle);
        }
        return entity;
    }
    
    protected MapsStationsImpl createEntity() {
        return new MapsStationsImpl();
    }
}