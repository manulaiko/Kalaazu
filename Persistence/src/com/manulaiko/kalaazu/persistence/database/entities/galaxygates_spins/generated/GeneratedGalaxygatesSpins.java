package com.manulaiko.kalaazu.persistence.database.entities.galaxygates_spins.generated;

import com.manulaiko.kalaazu.persistence.database.entities.galaxygates_spins.GalaxygatesSpins;
import com.manulaiko.kalaazu.persistence.database.entities.items.Items;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.ColumnIdentifier;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.Manager;
import com.speedment.runtime.field.ComparableField;
import com.speedment.runtime.field.IntField;
import com.speedment.runtime.field.IntForeignKeyField;
import com.speedment.runtime.field.StringField;
import com.speedment.runtime.typemapper.TypeMapper;
import java.math.BigDecimal;

/**
 * The generated base for the {@link
 * com.manulaiko.kalaazu.persistence.database.entities.galaxygates_spins.GalaxygatesSpins}-interface
 * representing entities of the {@code galaxygates_spins}-table in the database.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedGalaxygatesSpins {
    
    /**
     * This Field corresponds to the {@link GalaxygatesSpins} field that can be
     * obtained using the {@link GalaxygatesSpins#getId()} method.
     */
    IntField<GalaxygatesSpins, Integer> ID = IntField.create(
        Identifier.ID,
        GalaxygatesSpins::getId,
        GalaxygatesSpins::setId,
        TypeMapper.primitive(),
        true
    );
    /**
     * This Field corresponds to the {@link GalaxygatesSpins} field that can be
     * obtained using the {@link GalaxygatesSpins#getType()} method.
     */
    StringField<GalaxygatesSpins, String> TYPE = StringField.create(
        Identifier.TYPE,
        GalaxygatesSpins::getType,
        GalaxygatesSpins::setType,
        TypeMapper.identity(),
        false
    );
    /**
     * This Field corresponds to the {@link GalaxygatesSpins} field that can be
     * obtained using the {@link GalaxygatesSpins#getProbability()} method.
     */
    ComparableField<GalaxygatesSpins, BigDecimal, BigDecimal> PROBABILITY = ComparableField.create(
        Identifier.PROBABILITY,
        GalaxygatesSpins::getProbability,
        GalaxygatesSpins::setProbability,
        TypeMapper.identity(),
        false
    );
    /**
     * This Field corresponds to the {@link GalaxygatesSpins} field that can be
     * obtained using the {@link GalaxygatesSpins#getItemsId()} method.
     */
    IntForeignKeyField<GalaxygatesSpins, Integer, Items> ITEMS_ID = IntForeignKeyField.create(
        Identifier.ITEMS_ID,
        GalaxygatesSpins::getItemsId,
        GalaxygatesSpins::setItemsId,
        Items.ID,
        TypeMapper.primitive(),
        false
    );
    /**
     * This Field corresponds to the {@link GalaxygatesSpins} field that can be
     * obtained using the {@link GalaxygatesSpins#getAmount()} method.
     */
    IntField<GalaxygatesSpins, Integer> AMOUNT = IntField.create(
        Identifier.AMOUNT,
        GalaxygatesSpins::getAmount,
        GalaxygatesSpins::setAmount,
        TypeMapper.primitive(),
        false
    );
    
    /**
     * Returns the id of this GalaxygatesSpins. The id field corresponds to the
     * database column kalaazu.kalaazu.galaxygates_spins.id.
     * 
     * @return the id of this GalaxygatesSpins
     */
    int getId();
    
    /**
     * Returns the type of this GalaxygatesSpins. The type field corresponds to
     * the database column kalaazu.kalaazu.galaxygates_spins.type.
     * 
     * @return the type of this GalaxygatesSpins
     */
    String getType();
    
    /**
     * Returns the probability of this GalaxygatesSpins. The probability field
     * corresponds to the database column
     * kalaazu.kalaazu.galaxygates_spins.probability.
     * 
     * @return the probability of this GalaxygatesSpins
     */
    BigDecimal getProbability();
    
    /**
     * Returns the itemsId of this GalaxygatesSpins. The itemsId field
     * corresponds to the database column
     * kalaazu.kalaazu.galaxygates_spins.items_id.
     * 
     * @return the itemsId of this GalaxygatesSpins
     */
    int getItemsId();
    
    /**
     * Returns the amount of this GalaxygatesSpins. The amount field corresponds
     * to the database column kalaazu.kalaazu.galaxygates_spins.amount.
     * 
     * @return the amount of this GalaxygatesSpins
     */
    int getAmount();
    
    /**
     * Sets the id of this GalaxygatesSpins. The id field corresponds to the
     * database column kalaazu.kalaazu.galaxygates_spins.id.
     * 
     * @param id to set of this GalaxygatesSpins
     * @return   this GalaxygatesSpins instance
     */
    GalaxygatesSpins setId(int id);
    
    /**
     * Sets the type of this GalaxygatesSpins. The type field corresponds to the
     * database column kalaazu.kalaazu.galaxygates_spins.type.
     * 
     * @param type to set of this GalaxygatesSpins
     * @return     this GalaxygatesSpins instance
     */
    GalaxygatesSpins setType(String type);
    
    /**
     * Sets the probability of this GalaxygatesSpins. The probability field
     * corresponds to the database column
     * kalaazu.kalaazu.galaxygates_spins.probability.
     * 
     * @param probability to set of this GalaxygatesSpins
     * @return            this GalaxygatesSpins instance
     */
    GalaxygatesSpins setProbability(BigDecimal probability);
    
    /**
     * Sets the itemsId of this GalaxygatesSpins. The itemsId field corresponds
     * to the database column kalaazu.kalaazu.galaxygates_spins.items_id.
     * 
     * @param itemsId to set of this GalaxygatesSpins
     * @return        this GalaxygatesSpins instance
     */
    GalaxygatesSpins setItemsId(int itemsId);
    
    /**
     * Sets the amount of this GalaxygatesSpins. The amount field corresponds to
     * the database column kalaazu.kalaazu.galaxygates_spins.amount.
     * 
     * @param amount to set of this GalaxygatesSpins
     * @return       this GalaxygatesSpins instance
     */
    GalaxygatesSpins setAmount(int amount);
    
    /**
     * Queries the specified manager for the referenced Items. If no such Items
     * exists, an {@code NullPointerException} will be thrown.
     * 
     * @param foreignManager the manager to query for the entity
     * @return               the foreign entity referenced
     */
    Items findItemsId(Manager<Items> foreignManager);
    
    enum Identifier implements ColumnIdentifier<GalaxygatesSpins> {
        
        ID          ("id"),
        TYPE        ("type"),
        PROBABILITY ("probability"),
        ITEMS_ID    ("items_id"),
        AMOUNT      ("amount");
        
        private final String columnName;
        private final TableIdentifier<GalaxygatesSpins> tableIdentifier;
        
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
            return "galaxygates_spins";
        }
        
        @Override
        public String getColumnName() {
            return this.columnName;
        }
        
        @Override
        public TableIdentifier<GalaxygatesSpins> asTableIdentifier() {
            return this.tableIdentifier;
        }
    }
}