package com.manulaiko.kalaazu.persistence.database.entities.galaxygates_spins.generated;

import com.manulaiko.kalaazu.persistence.database.entities.galaxygates_spins.GalaxygatesSpins;
import com.manulaiko.kalaazu.persistence.database.entities.galaxygates_spins.GalaxygatesSpinsManager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.AbstractManager;
import com.speedment.runtime.field.Field;
import java.util.stream.Stream;

/**
 * The generated base implementation for the manager of every {@link
 * com.manulaiko.kalaazu.persistence.database.entities.galaxygates_spins.GalaxygatesSpins}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedGalaxygatesSpinsManagerImpl 
extends AbstractManager<GalaxygatesSpins> 
implements GeneratedGalaxygatesSpinsManager {
    
    private final TableIdentifier<GalaxygatesSpins> tableIdentifier;
    
    protected GeneratedGalaxygatesSpinsManagerImpl() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "galaxygates_spins");
    }
    
    @Override
    public TableIdentifier<GalaxygatesSpins> getTableIdentifier() {
        return tableIdentifier;
    }
    
    @Override
    public Stream<Field<GalaxygatesSpins>> fields() {
        return GalaxygatesSpinsManager.FIELDS.stream();
    }
    
    @Override
    public Stream<Field<GalaxygatesSpins>> primaryKeyFields() {
        return Stream.of(
            GalaxygatesSpins.ID
        );
    }
}