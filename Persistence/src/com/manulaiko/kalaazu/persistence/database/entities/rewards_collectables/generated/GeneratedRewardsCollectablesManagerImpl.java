package com.manulaiko.kalaazu.persistence.database.entities.rewards_collectables.generated;

import com.manulaiko.kalaazu.persistence.database.entities.rewards_collectables.RewardsCollectables;
import com.manulaiko.kalaazu.persistence.database.entities.rewards_collectables.RewardsCollectablesManager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.AbstractManager;
import com.speedment.runtime.field.Field;
import java.util.stream.Stream;

/**
 * The generated base implementation for the manager of every {@link
 * com.manulaiko.kalaazu.persistence.database.entities.rewards_collectables.RewardsCollectables}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedRewardsCollectablesManagerImpl 
extends AbstractManager<RewardsCollectables> 
implements GeneratedRewardsCollectablesManager {
    
    private final TableIdentifier<RewardsCollectables> tableIdentifier;
    
    protected GeneratedRewardsCollectablesManagerImpl() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "rewards_collectables");
    }
    
    @Override
    public TableIdentifier<RewardsCollectables> getTableIdentifier() {
        return tableIdentifier;
    }
    
    @Override
    public Stream<Field<RewardsCollectables>> fields() {
        return RewardsCollectablesManager.FIELDS.stream();
    }
    
    @Override
    public Stream<Field<RewardsCollectables>> primaryKeyFields() {
        return Stream.of(
            RewardsCollectables.ID
        );
    }
}