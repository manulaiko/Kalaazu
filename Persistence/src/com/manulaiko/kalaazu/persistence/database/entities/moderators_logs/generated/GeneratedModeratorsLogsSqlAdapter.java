package com.manulaiko.kalaazu.persistence.database.entities.moderators_logs.generated;

import com.manulaiko.kalaazu.persistence.database.entities.moderators_logs.ModeratorsLogs;
import com.manulaiko.kalaazu.persistence.database.entities.moderators_logs.ModeratorsLogsImpl;
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
 * com.manulaiko.kalaazu.persistence.database.entities.moderators_logs.ModeratorsLogs}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedModeratorsLogsSqlAdapter {
    
    private final TableIdentifier<ModeratorsLogs> tableIdentifier;
    
    protected GeneratedModeratorsLogsSqlAdapter() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "moderators_logs");
    }
    
    @ExecuteBefore(RESOLVED)
    void installMethodName(@WithState(RESOLVED) SqlStreamSupplierComponent streamSupplierComponent,
            @WithState(RESOLVED) SqlPersistenceComponent persistenceComponent) {
        streamSupplierComponent.install(tableIdentifier, this::apply);
        persistenceComponent.install(tableIdentifier);
    }
    
    protected ModeratorsLogs apply(ResultSet resultSet) throws SpeedmentException {
        final ModeratorsLogs entity = createEntity();
        try {
            entity.setId(           resultSet.getInt(1)       );
            entity.setModeratorsId( resultSet.getInt(2)       );
            entity.setDate(         resultSet.getTimestamp(3) );
            entity.setType(         resultSet.getString(4)    );
            entity.setText(         resultSet.getString(5)    );
        } catch (final SQLException sqle) {
            throw new SpeedmentException(sqle);
        }
        return entity;
    }
    
    protected ModeratorsLogsImpl createEntity() {
        return new ModeratorsLogsImpl();
    }
}