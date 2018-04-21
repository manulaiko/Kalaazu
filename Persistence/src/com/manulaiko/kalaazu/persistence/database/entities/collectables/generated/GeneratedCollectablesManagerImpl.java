package com.manulaiko.kalaazu.persistence.database.entities.collectables.generated;

import com.manulaiko.kalaazu.persistence.database.entities.collectables.Collectables;
import com.manulaiko.kalaazu.persistence.database.entities.collectables.CollectablesManager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.AbstractManager;
import com.speedment.runtime.field.Field;
import java.util.stream.Stream;

/**
 * The generated base implementation for the manager of every {@link
 * com.manulaiko.kalaazu.persistence.database.entities.collectables.Collectables} entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedCollectablesManagerImpl 
extends AbstractManager<Collectables> 
implements GeneratedCollectablesManager {
    
    private final TableIdentifier<Collectables> tableIdentifier;
    
    protected GeneratedCollectablesManagerImpl() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "collectables");
    }
    
    @Override
    public TableIdentifier<Collectables> getTableIdentifier() {
        return tableIdentifier;
    }
    
    @Override
    public Stream<Field<Collectables>> fields() {
        return CollectablesManager.FIELDS.stream();
    }
    
    @Override
    public Stream<Field<Collectables>> primaryKeyFields() {
        return Stream.of(
            Collectables.ID
        );
    }
}