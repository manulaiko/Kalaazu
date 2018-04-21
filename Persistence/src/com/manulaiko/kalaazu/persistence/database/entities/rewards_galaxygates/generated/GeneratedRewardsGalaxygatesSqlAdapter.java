package com.manulaiko.kalaazu.persistence.database.entities.rewards_galaxygates.generated;

import com.manulaiko.kalaazu.persistence.database.entities.rewards_galaxygates.RewardsGalaxygates;
import com.manulaiko.kalaazu.persistence.database.entities.rewards_galaxygates.RewardsGalaxygatesImpl;
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
 * com.manulaiko.kalaazu.persistence.database.entities.rewards_galaxygates.RewardsGalaxygates}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedRewardsGalaxygatesSqlAdapter {
    
    private final TableIdentifier<RewardsGalaxygates> tableIdentifier;
    
    protected GeneratedRewardsGalaxygatesSqlAdapter() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "rewards_galaxygates");
    }
    
    @ExecuteBefore(RESOLVED)
    void installMethodName(@WithState(RESOLVED) SqlStreamSupplierComponent streamSupplierComponent,
            @WithState(RESOLVED) SqlPersistenceComponent persistenceComponent) {
        streamSupplierComponent.install(tableIdentifier, this::apply);
        persistenceComponent.install(tableIdentifier);
    }
    
    protected RewardsGalaxygates apply(ResultSet resultSet) throws SpeedmentException {
        final RewardsGalaxygates entity = createEntity();
        try {
            entity.setId(            resultSet.getInt(1) );
            entity.setGalaxygatesId( resultSet.getInt(2) );
            entity.setRewardsId(     resultSet.getInt(3) );
        } catch (final SQLException sqle) {
            throw new SpeedmentException(sqle);
        }
        return entity;
    }
    
    protected RewardsGalaxygatesImpl createEntity() {
        return new RewardsGalaxygatesImpl();
    }
}