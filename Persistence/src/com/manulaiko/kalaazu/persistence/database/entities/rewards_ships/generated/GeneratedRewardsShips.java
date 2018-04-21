package com.manulaiko.kalaazu.persistence.database.entities.rewards_ships.generated;

import com.manulaiko.kalaazu.persistence.database.entities.rewards.Rewards;
import com.manulaiko.kalaazu.persistence.database.entities.rewards_ships.RewardsShips;
import com.manulaiko.kalaazu.persistence.database.entities.ships.Ships;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.ColumnIdentifier;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.Manager;
import com.speedment.runtime.field.IntField;
import com.speedment.runtime.field.IntForeignKeyField;
import com.speedment.runtime.typemapper.TypeMapper;

/**
 * The generated base for the {@link
 * com.manulaiko.kalaazu.persistence.database.entities.rewards_ships.RewardsShips}-interface
 * representing entities of the {@code rewards_ships}-table in the database.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedRewardsShips {
    
    /**
     * This Field corresponds to the {@link RewardsShips} field that can be
     * obtained using the {@link RewardsShips#getId()} method.
     */
    IntField<RewardsShips, Integer> ID = IntField.create(
        Identifier.ID,
        RewardsShips::getId,
        RewardsShips::setId,
        TypeMapper.primitive(),
        true
    );
    /**
     * This Field corresponds to the {@link RewardsShips} field that can be
     * obtained using the {@link RewardsShips#getShipsId()} method.
     */
    IntForeignKeyField<RewardsShips, Integer, Ships> SHIPS_ID = IntForeignKeyField.create(
        Identifier.SHIPS_ID,
        RewardsShips::getShipsId,
        RewardsShips::setShipsId,
        Ships.ID,
        TypeMapper.primitive(),
        false
    );
    /**
     * This Field corresponds to the {@link RewardsShips} field that can be
     * obtained using the {@link RewardsShips#getRewardsId()} method.
     */
    IntForeignKeyField<RewardsShips, Integer, Rewards> REWARDS_ID = IntForeignKeyField.create(
        Identifier.REWARDS_ID,
        RewardsShips::getRewardsId,
        RewardsShips::setRewardsId,
        Rewards.ID,
        TypeMapper.primitive(),
        false
    );
    
    /**
     * Returns the id of this RewardsShips. The id field corresponds to the
     * database column kalaazu.kalaazu.rewards_ships.id.
     * 
     * @return the id of this RewardsShips
     */
    int getId();
    
    /**
     * Returns the shipsId of this RewardsShips. The shipsId field corresponds
     * to the database column kalaazu.kalaazu.rewards_ships.ships_id.
     * 
     * @return the shipsId of this RewardsShips
     */
    int getShipsId();
    
    /**
     * Returns the rewardsId of this RewardsShips. The rewardsId field
     * corresponds to the database column
     * kalaazu.kalaazu.rewards_ships.rewards_id.
     * 
     * @return the rewardsId of this RewardsShips
     */
    int getRewardsId();
    
    /**
     * Sets the id of this RewardsShips. The id field corresponds to the
     * database column kalaazu.kalaazu.rewards_ships.id.
     * 
     * @param id to set of this RewardsShips
     * @return   this RewardsShips instance
     */
    RewardsShips setId(int id);
    
    /**
     * Sets the shipsId of this RewardsShips. The shipsId field corresponds to
     * the database column kalaazu.kalaazu.rewards_ships.ships_id.
     * 
     * @param shipsId to set of this RewardsShips
     * @return        this RewardsShips instance
     */
    RewardsShips setShipsId(int shipsId);
    
    /**
     * Sets the rewardsId of this RewardsShips. The rewardsId field corresponds
     * to the database column kalaazu.kalaazu.rewards_ships.rewards_id.
     * 
     * @param rewardsId to set of this RewardsShips
     * @return          this RewardsShips instance
     */
    RewardsShips setRewardsId(int rewardsId);
    
    /**
     * Queries the specified manager for the referenced Ships. If no such Ships
     * exists, an {@code NullPointerException} will be thrown.
     * 
     * @param foreignManager the manager to query for the entity
     * @return               the foreign entity referenced
     */
    Ships findShipsId(Manager<Ships> foreignManager);
    
    /**
     * Queries the specified manager for the referenced Rewards. If no such
     * Rewards exists, an {@code NullPointerException} will be thrown.
     * 
     * @param foreignManager the manager to query for the entity
     * @return               the foreign entity referenced
     */
    Rewards findRewardsId(Manager<Rewards> foreignManager);
    
    enum Identifier implements ColumnIdentifier<RewardsShips> {
        
        ID         ("id"),
        SHIPS_ID   ("ships_id"),
        REWARDS_ID ("rewards_id");
        
        private final String columnName;
        private final TableIdentifier<RewardsShips> tableIdentifier;
        
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
            return "rewards_ships";
        }
        
        @Override
        public String getColumnName() {
            return this.columnName;
        }
        
        @Override
        public TableIdentifier<RewardsShips> asTableIdentifier() {
            return this.tableIdentifier;
        }
    }
}