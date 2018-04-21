package com.manulaiko.kalaazu.persistence.database.entities.ships.generated;

import com.manulaiko.kalaazu.persistence.database.entities.items.Items;
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
 * com.manulaiko.kalaazu.persistence.database.entities.ships.Ships}-interface
 * representing entities of the {@code ships}-table in the database.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedShips {
    
    /**
     * This Field corresponds to the {@link Ships} field that can be obtained
     * using the {@link Ships#getId()} method.
     */
    IntField<Ships, Integer> ID = IntField.create(
        Identifier.ID,
        Ships::getId,
        Ships::setId,
        TypeMapper.primitive(),
        true
    );
    /**
     * This Field corresponds to the {@link Ships} field that can be obtained
     * using the {@link Ships#getItemsId()} method.
     */
    IntForeignKeyField<Ships, Integer, Items> ITEMS_ID = IntForeignKeyField.create(
        Identifier.ITEMS_ID,
        Ships::getItemsId,
        Ships::setItemsId,
        Items.ID,
        TypeMapper.primitive(),
        false
    );
    /**
     * This Field corresponds to the {@link Ships} field that can be obtained
     * using the {@link Ships#getHealth()} method.
     */
    IntField<Ships, Integer> HEALTH = IntField.create(
        Identifier.HEALTH,
        Ships::getHealth,
        Ships::setHealth,
        TypeMapper.primitive(),
        false
    );
    /**
     * This Field corresponds to the {@link Ships} field that can be obtained
     * using the {@link Ships#getSpeed()} method.
     */
    IntField<Ships, Integer> SPEED = IntField.create(
        Identifier.SPEED,
        Ships::getSpeed,
        Ships::setSpeed,
        TypeMapper.primitive(),
        false
    );
    /**
     * This Field corresponds to the {@link Ships} field that can be obtained
     * using the {@link Ships#getCargo()} method.
     */
    IntField<Ships, Integer> CARGO = IntField.create(
        Identifier.CARGO,
        Ships::getCargo,
        Ships::setCargo,
        TypeMapper.primitive(),
        false
    );
    /**
     * This Field corresponds to the {@link Ships} field that can be obtained
     * using the {@link Ships#getBatteries()} method.
     */
    IntField<Ships, Integer> BATTERIES = IntField.create(
        Identifier.BATTERIES,
        Ships::getBatteries,
        Ships::setBatteries,
        TypeMapper.primitive(),
        false
    );
    /**
     * This Field corresponds to the {@link Ships} field that can be obtained
     * using the {@link Ships#getRockets()} method.
     */
    IntField<Ships, Integer> ROCKETS = IntField.create(
        Identifier.ROCKETS,
        Ships::getRockets,
        Ships::setRockets,
        TypeMapper.primitive(),
        false
    );
    /**
     * This Field corresponds to the {@link Ships} field that can be obtained
     * using the {@link Ships#getLasers()} method.
     */
    IntField<Ships, Integer> LASERS = IntField.create(
        Identifier.LASERS,
        Ships::getLasers,
        Ships::setLasers,
        TypeMapper.primitive(),
        false
    );
    /**
     * This Field corresponds to the {@link Ships} field that can be obtained
     * using the {@link Ships#getHellstorms()} method.
     */
    IntField<Ships, Integer> HELLSTORMS = IntField.create(
        Identifier.HELLSTORMS,
        Ships::getHellstorms,
        Ships::setHellstorms,
        TypeMapper.primitive(),
        false
    );
    /**
     * This Field corresponds to the {@link Ships} field that can be obtained
     * using the {@link Ships#getGenerators()} method.
     */
    IntField<Ships, Integer> GENERATORS = IntField.create(
        Identifier.GENERATORS,
        Ships::getGenerators,
        Ships::setGenerators,
        TypeMapper.primitive(),
        false
    );
    /**
     * This Field corresponds to the {@link Ships} field that can be obtained
     * using the {@link Ships#getExtras()} method.
     */
    IntField<Ships, Integer> EXTRAS = IntField.create(
        Identifier.EXTRAS,
        Ships::getExtras,
        Ships::setExtras,
        TypeMapper.primitive(),
        false
    );
    /**
     * This Field corresponds to the {@link Ships} field that can be obtained
     * using the {@link Ships#getGfx()} method.
     */
    IntField<Ships, Integer> GFX = IntField.create(
        Identifier.GFX,
        Ships::getGfx,
        Ships::setGfx,
        TypeMapper.primitive(),
        false
    );
    
    /**
     * Returns the id of this Ships. The id field corresponds to the database
     * column kalaazu.kalaazu.ships.id.
     * 
     * @return the id of this Ships
     */
    int getId();
    
    /**
     * Returns the itemsId of this Ships. The itemsId field corresponds to the
     * database column kalaazu.kalaazu.ships.items_id.
     * 
     * @return the itemsId of this Ships
     */
    int getItemsId();
    
    /**
     * Returns the health of this Ships. The health field corresponds to the
     * database column kalaazu.kalaazu.ships.health.
     * 
     * @return the health of this Ships
     */
    int getHealth();
    
    /**
     * Returns the speed of this Ships. The speed field corresponds to the
     * database column kalaazu.kalaazu.ships.speed.
     * 
     * @return the speed of this Ships
     */
    int getSpeed();
    
    /**
     * Returns the cargo of this Ships. The cargo field corresponds to the
     * database column kalaazu.kalaazu.ships.cargo.
     * 
     * @return the cargo of this Ships
     */
    int getCargo();
    
    /**
     * Returns the batteries of this Ships. The batteries field corresponds to
     * the database column kalaazu.kalaazu.ships.batteries.
     * 
     * @return the batteries of this Ships
     */
    int getBatteries();
    
    /**
     * Returns the rockets of this Ships. The rockets field corresponds to the
     * database column kalaazu.kalaazu.ships.rockets.
     * 
     * @return the rockets of this Ships
     */
    int getRockets();
    
    /**
     * Returns the lasers of this Ships. The lasers field corresponds to the
     * database column kalaazu.kalaazu.ships.lasers.
     * 
     * @return the lasers of this Ships
     */
    int getLasers();
    
    /**
     * Returns the hellstorms of this Ships. The hellstorms field corresponds to
     * the database column kalaazu.kalaazu.ships.hellstorms.
     * 
     * @return the hellstorms of this Ships
     */
    int getHellstorms();
    
    /**
     * Returns the generators of this Ships. The generators field corresponds to
     * the database column kalaazu.kalaazu.ships.generators.
     * 
     * @return the generators of this Ships
     */
    int getGenerators();
    
    /**
     * Returns the extras of this Ships. The extras field corresponds to the
     * database column kalaazu.kalaazu.ships.extras.
     * 
     * @return the extras of this Ships
     */
    int getExtras();
    
    /**
     * Returns the gfx of this Ships. The gfx field corresponds to the database
     * column kalaazu.kalaazu.ships.gfx.
     * 
     * @return the gfx of this Ships
     */
    int getGfx();
    
    /**
     * Sets the id of this Ships. The id field corresponds to the database
     * column kalaazu.kalaazu.ships.id.
     * 
     * @param id to set of this Ships
     * @return   this Ships instance
     */
    Ships setId(int id);
    
    /**
     * Sets the itemsId of this Ships. The itemsId field corresponds to the
     * database column kalaazu.kalaazu.ships.items_id.
     * 
     * @param itemsId to set of this Ships
     * @return        this Ships instance
     */
    Ships setItemsId(int itemsId);
    
    /**
     * Sets the health of this Ships. The health field corresponds to the
     * database column kalaazu.kalaazu.ships.health.
     * 
     * @param health to set of this Ships
     * @return       this Ships instance
     */
    Ships setHealth(int health);
    
    /**
     * Sets the speed of this Ships. The speed field corresponds to the database
     * column kalaazu.kalaazu.ships.speed.
     * 
     * @param speed to set of this Ships
     * @return      this Ships instance
     */
    Ships setSpeed(int speed);
    
    /**
     * Sets the cargo of this Ships. The cargo field corresponds to the database
     * column kalaazu.kalaazu.ships.cargo.
     * 
     * @param cargo to set of this Ships
     * @return      this Ships instance
     */
    Ships setCargo(int cargo);
    
    /**
     * Sets the batteries of this Ships. The batteries field corresponds to the
     * database column kalaazu.kalaazu.ships.batteries.
     * 
     * @param batteries to set of this Ships
     * @return          this Ships instance
     */
    Ships setBatteries(int batteries);
    
    /**
     * Sets the rockets of this Ships. The rockets field corresponds to the
     * database column kalaazu.kalaazu.ships.rockets.
     * 
     * @param rockets to set of this Ships
     * @return        this Ships instance
     */
    Ships setRockets(int rockets);
    
    /**
     * Sets the lasers of this Ships. The lasers field corresponds to the
     * database column kalaazu.kalaazu.ships.lasers.
     * 
     * @param lasers to set of this Ships
     * @return       this Ships instance
     */
    Ships setLasers(int lasers);
    
    /**
     * Sets the hellstorms of this Ships. The hellstorms field corresponds to
     * the database column kalaazu.kalaazu.ships.hellstorms.
     * 
     * @param hellstorms to set of this Ships
     * @return           this Ships instance
     */
    Ships setHellstorms(int hellstorms);
    
    /**
     * Sets the generators of this Ships. The generators field corresponds to
     * the database column kalaazu.kalaazu.ships.generators.
     * 
     * @param generators to set of this Ships
     * @return           this Ships instance
     */
    Ships setGenerators(int generators);
    
    /**
     * Sets the extras of this Ships. The extras field corresponds to the
     * database column kalaazu.kalaazu.ships.extras.
     * 
     * @param extras to set of this Ships
     * @return       this Ships instance
     */
    Ships setExtras(int extras);
    
    /**
     * Sets the gfx of this Ships. The gfx field corresponds to the database
     * column kalaazu.kalaazu.ships.gfx.
     * 
     * @param gfx to set of this Ships
     * @return    this Ships instance
     */
    Ships setGfx(int gfx);
    
    /**
     * Queries the specified manager for the referenced Items. If no such Items
     * exists, an {@code NullPointerException} will be thrown.
     * 
     * @param foreignManager the manager to query for the entity
     * @return               the foreign entity referenced
     */
    Items findItemsId(Manager<Items> foreignManager);
    
    enum Identifier implements ColumnIdentifier<Ships> {
        
        ID         ("id"),
        ITEMS_ID   ("items_id"),
        HEALTH     ("health"),
        SPEED      ("speed"),
        CARGO      ("cargo"),
        BATTERIES  ("batteries"),
        ROCKETS    ("rockets"),
        LASERS     ("lasers"),
        HELLSTORMS ("hellstorms"),
        GENERATORS ("generators"),
        EXTRAS     ("extras"),
        GFX        ("gfx");
        
        private final String columnName;
        private final TableIdentifier<Ships> tableIdentifier;
        
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
            return "ships";
        }
        
        @Override
        public String getColumnName() {
            return this.columnName;
        }
        
        @Override
        public TableIdentifier<Ships> asTableIdentifier() {
            return this.tableIdentifier;
        }
    }
}