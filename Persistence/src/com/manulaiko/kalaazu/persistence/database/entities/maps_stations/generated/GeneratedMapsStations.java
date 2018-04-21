package com.manulaiko.kalaazu.persistence.database.entities.maps_stations.generated;

import com.manulaiko.kalaazu.persistence.database.entities.factions.Factions;
import com.manulaiko.kalaazu.persistence.database.entities.maps.Maps;
import com.manulaiko.kalaazu.persistence.database.entities.maps_stations.MapsStations;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.ColumnIdentifier;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.Manager;
import com.speedment.runtime.core.util.OptionalUtil;
import com.speedment.runtime.field.ComparableForeignKeyField;
import com.speedment.runtime.field.IntField;
import com.speedment.runtime.field.StringField;
import com.speedment.runtime.typemapper.TypeMapper;
import java.util.Optional;
import java.util.OptionalInt;

/**
 * The generated base for the {@link
 * com.manulaiko.kalaazu.persistence.database.entities.maps_stations.MapsStations}-interface
 * representing entities of the {@code maps_stations}-table in the database.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedMapsStations {
    
    /**
     * This Field corresponds to the {@link MapsStations} field that can be
     * obtained using the {@link MapsStations#getId()} method.
     */
    IntField<MapsStations, Integer> ID = IntField.create(
        Identifier.ID,
        MapsStations::getId,
        MapsStations::setId,
        TypeMapper.primitive(),
        true
    );
    /**
     * This Field corresponds to the {@link MapsStations} field that can be
     * obtained using the {@link MapsStations#getPosition()} method.
     */
    StringField<MapsStations, String> POSITION = StringField.create(
        Identifier.POSITION,
        MapsStations::getPosition,
        MapsStations::setPosition,
        TypeMapper.identity(),
        false
    );
    /**
     * This Field corresponds to the {@link MapsStations} field that can be
     * obtained using the {@link MapsStations#getMapsId()} method.
     */
    ComparableForeignKeyField<MapsStations, Integer, Integer, Maps> MAPS_ID = ComparableForeignKeyField.create(
        Identifier.MAPS_ID,
        o -> OptionalUtil.unwrap(o.getMapsId()),
        MapsStations::setMapsId,
        Maps.ID,
        TypeMapper.identity(),
        false
    );
    /**
     * This Field corresponds to the {@link MapsStations} field that can be
     * obtained using the {@link MapsStations#getFactionsId()} method.
     */
    ComparableForeignKeyField<MapsStations, Integer, Integer, Factions> FACTIONS_ID = ComparableForeignKeyField.create(
        Identifier.FACTIONS_ID,
        o -> OptionalUtil.unwrap(o.getFactionsId()),
        MapsStations::setFactionsId,
        Factions.ID,
        TypeMapper.identity(),
        false
    );
    
    /**
     * Returns the id of this MapsStations. The id field corresponds to the
     * database column kalaazu.kalaazu.maps_stations.id.
     * 
     * @return the id of this MapsStations
     */
    int getId();
    
    /**
     * Returns the position of this MapsStations. The position field corresponds
     * to the database column kalaazu.kalaazu.maps_stations.position.
     * 
     * @return the position of this MapsStations
     */
    String getPosition();
    
    /**
     * Returns the mapsId of this MapsStations. The mapsId field corresponds to
     * the database column kalaazu.kalaazu.maps_stations.maps_id.
     * 
     * @return the mapsId of this MapsStations
     */
    OptionalInt getMapsId();
    
    /**
     * Returns the factionsId of this MapsStations. The factionsId field
     * corresponds to the database column
     * kalaazu.kalaazu.maps_stations.factions_id.
     * 
     * @return the factionsId of this MapsStations
     */
    OptionalInt getFactionsId();
    
    /**
     * Sets the id of this MapsStations. The id field corresponds to the
     * database column kalaazu.kalaazu.maps_stations.id.
     * 
     * @param id to set of this MapsStations
     * @return   this MapsStations instance
     */
    MapsStations setId(int id);
    
    /**
     * Sets the position of this MapsStations. The position field corresponds to
     * the database column kalaazu.kalaazu.maps_stations.position.
     * 
     * @param position to set of this MapsStations
     * @return         this MapsStations instance
     */
    MapsStations setPosition(String position);
    
    /**
     * Sets the mapsId of this MapsStations. The mapsId field corresponds to the
     * database column kalaazu.kalaazu.maps_stations.maps_id.
     * 
     * @param mapsId to set of this MapsStations
     * @return       this MapsStations instance
     */
    MapsStations setMapsId(Integer mapsId);
    
    /**
     * Sets the factionsId of this MapsStations. The factionsId field
     * corresponds to the database column
     * kalaazu.kalaazu.maps_stations.factions_id.
     * 
     * @param factionsId to set of this MapsStations
     * @return           this MapsStations instance
     */
    MapsStations setFactionsId(Integer factionsId);
    
    /**
     * Queries the specified manager for the referenced Maps. If no such Maps
     * exists, an {@code NullPointerException} will be thrown.
     * 
     * @param foreignManager the manager to query for the entity
     * @return               the foreign entity referenced
     */
    Optional<Maps> findMapsId(Manager<Maps> foreignManager);
    
    /**
     * Queries the specified manager for the referenced Factions. If no such
     * Factions exists, an {@code NullPointerException} will be thrown.
     * 
     * @param foreignManager the manager to query for the entity
     * @return               the foreign entity referenced
     */
    Optional<Factions> findFactionsId(Manager<Factions> foreignManager);
    
    enum Identifier implements ColumnIdentifier<MapsStations> {
        
        ID          ("id"),
        POSITION    ("position"),
        MAPS_ID     ("maps_id"),
        FACTIONS_ID ("factions_id");
        
        private final String columnName;
        private final TableIdentifier<MapsStations> tableIdentifier;
        
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
            return "maps_stations";
        }
        
        @Override
        public String getColumnName() {
            return this.columnName;
        }
        
        @Override
        public TableIdentifier<MapsStations> asTableIdentifier() {
            return this.tableIdentifier;
        }
    }
}