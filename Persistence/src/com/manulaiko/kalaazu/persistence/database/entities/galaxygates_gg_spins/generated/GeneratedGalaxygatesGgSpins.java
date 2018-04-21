package com.manulaiko.kalaazu.persistence.database.entities.galaxygates_gg_spins.generated;

import com.manulaiko.kalaazu.persistence.database.entities.galaxygates.Galaxygates;
import com.manulaiko.kalaazu.persistence.database.entities.galaxygates_gg_spins.GalaxygatesGgSpins;
import com.manulaiko.kalaazu.persistence.database.entities.galaxygates_spins.GalaxygatesSpins;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.ColumnIdentifier;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.Manager;
import com.speedment.runtime.field.IntField;
import com.speedment.runtime.field.IntForeignKeyField;
import com.speedment.runtime.typemapper.TypeMapper;

/**
 * The generated base for the {@link
 * com.manulaiko.kalaazu.persistence.database.entities.galaxygates_gg_spins.GalaxygatesGgSpins}-interface
 * representing entities of the {@code galaxygates_gg_spins}-table in the
 * database.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedGalaxygatesGgSpins {
    
    /**
     * This Field corresponds to the {@link GalaxygatesGgSpins} field that can
     * be obtained using the {@link GalaxygatesGgSpins#getId()} method.
     */
    IntField<GalaxygatesGgSpins, Integer> ID = IntField.create(
        Identifier.ID,
        GalaxygatesGgSpins::getId,
        GalaxygatesGgSpins::setId,
        TypeMapper.primitive(),
        true
    );
    /**
     * This Field corresponds to the {@link GalaxygatesGgSpins} field that can
     * be obtained using the {@link GalaxygatesGgSpins#getGalaxygatesId()}
     * method.
     */
    IntForeignKeyField<GalaxygatesGgSpins, Integer, Galaxygates> GALAXYGATES_ID = IntForeignKeyField.create(
        Identifier.GALAXYGATES_ID,
        GalaxygatesGgSpins::getGalaxygatesId,
        GalaxygatesGgSpins::setGalaxygatesId,
        Galaxygates.ID,
        TypeMapper.primitive(),
        false
    );
    /**
     * This Field corresponds to the {@link GalaxygatesGgSpins} field that can
     * be obtained using the {@link GalaxygatesGgSpins#getGalaxygatesSpinsId()}
     * method.
     */
    IntForeignKeyField<GalaxygatesGgSpins, Integer, GalaxygatesSpins> GALAXYGATES_SPINS_ID = IntForeignKeyField.create(
        Identifier.GALAXYGATES_SPINS_ID,
        GalaxygatesGgSpins::getGalaxygatesSpinsId,
        GalaxygatesGgSpins::setGalaxygatesSpinsId,
        GalaxygatesSpins.ID,
        TypeMapper.primitive(),
        false
    );
    
    /**
     * Returns the id of this GalaxygatesGgSpins. The id field corresponds to
     * the database column kalaazu.kalaazu.galaxygates_gg_spins.id.
     * 
     * @return the id of this GalaxygatesGgSpins
     */
    int getId();
    
    /**
     * Returns the galaxygatesId of this GalaxygatesGgSpins. The galaxygatesId
     * field corresponds to the database column
     * kalaazu.kalaazu.galaxygates_gg_spins.galaxygates_id.
     * 
     * @return the galaxygatesId of this GalaxygatesGgSpins
     */
    int getGalaxygatesId();
    
    /**
     * Returns the galaxygatesSpinsId of this GalaxygatesGgSpins. The
     * galaxygatesSpinsId field corresponds to the database column
     * kalaazu.kalaazu.galaxygates_gg_spins.galaxygates_spins_id.
     * 
     * @return the galaxygatesSpinsId of this GalaxygatesGgSpins
     */
    int getGalaxygatesSpinsId();
    
    /**
     * Sets the id of this GalaxygatesGgSpins. The id field corresponds to the
     * database column kalaazu.kalaazu.galaxygates_gg_spins.id.
     * 
     * @param id to set of this GalaxygatesGgSpins
     * @return   this GalaxygatesGgSpins instance
     */
    GalaxygatesGgSpins setId(int id);
    
    /**
     * Sets the galaxygatesId of this GalaxygatesGgSpins. The galaxygatesId
     * field corresponds to the database column
     * kalaazu.kalaazu.galaxygates_gg_spins.galaxygates_id.
     * 
     * @param galaxygatesId to set of this GalaxygatesGgSpins
     * @return              this GalaxygatesGgSpins instance
     */
    GalaxygatesGgSpins setGalaxygatesId(int galaxygatesId);
    
    /**
     * Sets the galaxygatesSpinsId of this GalaxygatesGgSpins. The
     * galaxygatesSpinsId field corresponds to the database column
     * kalaazu.kalaazu.galaxygates_gg_spins.galaxygates_spins_id.
     * 
     * @param galaxygatesSpinsId to set of this GalaxygatesGgSpins
     * @return                   this GalaxygatesGgSpins instance
     */
    GalaxygatesGgSpins setGalaxygatesSpinsId(int galaxygatesSpinsId);
    
    /**
     * Queries the specified manager for the referenced Galaxygates. If no such
     * Galaxygates exists, an {@code NullPointerException} will be thrown.
     * 
     * @param foreignManager the manager to query for the entity
     * @return               the foreign entity referenced
     */
    Galaxygates findGalaxygatesId(Manager<Galaxygates> foreignManager);
    
    /**
     * Queries the specified manager for the referenced GalaxygatesSpins. If no
     * such GalaxygatesSpins exists, an {@code NullPointerException} will be
     * thrown.
     * 
     * @param foreignManager the manager to query for the entity
     * @return               the foreign entity referenced
     */
    GalaxygatesSpins findGalaxygatesSpinsId(Manager<GalaxygatesSpins> foreignManager);
    
    enum Identifier implements ColumnIdentifier<GalaxygatesGgSpins> {
        
        ID                   ("id"),
        GALAXYGATES_ID       ("galaxygates_id"),
        GALAXYGATES_SPINS_ID ("galaxygates_spins_id");
        
        private final String columnName;
        private final TableIdentifier<GalaxygatesGgSpins> tableIdentifier;
        
        Identifier(String columnName) {
            this.columnName      = columnName;
            this.tableIdentifier = TableIdentifier.of(    getDbmsName(), 
                getSchemaName(), 
                getTableName());
        }
        
        @Override
        public String getDbmsName() {
            return "kalaazu";
        }
        
        @Override
        public String getSchemaName() {
            return "kalaazu";
        }
        
        @Override
        public String getTableName() {
            return "galaxygates_gg_spins";
        }
        
        @Override
        public String getColumnName() {
            return this.columnName;
        }
        
        @Override
        public TableIdentifier<GalaxygatesGgSpins> asTableIdentifier() {
            return this.tableIdentifier;
        }
    }
}