package com.manulaiko.kalaazu.persistence.database.entities.galaxygates_stages_spawns.generated;

import com.manulaiko.kalaazu.persistence.database.entities.galaxygates_stages_spawns.GalaxygatesStagesSpawns;
import com.manulaiko.kalaazu.persistence.database.entities.galaxygates_stages_spawns.GalaxygatesStagesSpawnsManager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.AbstractManager;
import com.speedment.runtime.field.Field;
import java.util.stream.Stream;

/**
 * The generated base implementation for the manager of every {@link
 * com.manulaiko.kalaazu.persistence.database.entities.galaxygates_stages_spawns.GalaxygatesStagesSpawns}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedGalaxygatesStagesSpawnsManagerImpl 
extends AbstractManager<GalaxygatesStagesSpawns> 
implements GeneratedGalaxygatesStagesSpawnsManager {
    
    private final TableIdentifier<GalaxygatesStagesSpawns> tableIdentifier;
    
    protected GeneratedGalaxygatesStagesSpawnsManagerImpl() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "galaxygates_stages_spawns");
    }
    
    @Override
    public TableIdentifier<GalaxygatesStagesSpawns> getTableIdentifier() {
        return tableIdentifier;
    }
    
    @Override
    public Stream<Field<GalaxygatesStagesSpawns>> fields() {
        return GalaxygatesStagesSpawnsManager.FIELDS.stream();
    }
    
    @Override
    public Stream<Field<GalaxygatesStagesSpawns>> primaryKeyFields() {
        return Stream.of(
            GalaxygatesStagesSpawns.ID
        );
    }
}