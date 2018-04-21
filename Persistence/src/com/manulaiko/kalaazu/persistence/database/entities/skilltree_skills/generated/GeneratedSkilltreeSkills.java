package com.manulaiko.kalaazu.persistence.database.entities.skilltree_skills.generated;

import com.manulaiko.kalaazu.persistence.database.entities.skilltree_skills.SkilltreeSkills;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.ColumnIdentifier;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.field.BooleanField;
import com.speedment.runtime.field.ComparableField;
import com.speedment.runtime.field.IntField;
import com.speedment.runtime.field.StringField;
import com.speedment.runtime.typemapper.TypeMapper;
import java.math.BigDecimal;

/**
 * The generated base for the {@link
 * com.manulaiko.kalaazu.persistence.database.entities.skilltree_skills.SkilltreeSkills}-interface
 * representing entities of the {@code skilltree_skills}-table in the database.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedSkilltreeSkills {
    
    /**
     * This Field corresponds to the {@link SkilltreeSkills} field that can be
     * obtained using the {@link SkilltreeSkills#getId()} method.
     */
    IntField<SkilltreeSkills, Integer> ID = IntField.create(
        Identifier.ID,
        SkilltreeSkills::getId,
        SkilltreeSkills::setId,
        TypeMapper.primitive(),
        true
    );
    /**
     * This Field corresponds to the {@link SkilltreeSkills} field that can be
     * obtained using the {@link SkilltreeSkills#getName()} method.
     */
    StringField<SkilltreeSkills, String> NAME = StringField.create(
        Identifier.NAME,
        SkilltreeSkills::getName,
        SkilltreeSkills::setName,
        TypeMapper.identity(),
        false
    );
    /**
     * This Field corresponds to the {@link SkilltreeSkills} field that can be
     * obtained using the {@link SkilltreeSkills#getDescription()} method.
     */
    StringField<SkilltreeSkills, String> DESCRIPTION = StringField.create(
        Identifier.DESCRIPTION,
        SkilltreeSkills::getDescription,
        SkilltreeSkills::setDescription,
        TypeMapper.identity(),
        false
    );
    /**
     * This Field corresponds to the {@link SkilltreeSkills} field that can be
     * obtained using the {@link SkilltreeSkills#getCategory()} method.
     */
    IntField<SkilltreeSkills, Integer> CATEGORY = IntField.create(
        Identifier.CATEGORY,
        SkilltreeSkills::getCategory,
        SkilltreeSkills::setCategory,
        TypeMapper.primitive(),
        false
    );
    /**
     * This Field corresponds to the {@link SkilltreeSkills} field that can be
     * obtained using the {@link SkilltreeSkills#getIsAdvanced()} method.
     */
    BooleanField<SkilltreeSkills, Boolean> IS_ADVANCED = BooleanField.create(
        Identifier.IS_ADVANCED,
        SkilltreeSkills::getIsAdvanced,
        SkilltreeSkills::setIsAdvanced,
        TypeMapper.primitive(),
        false
    );
    /**
     * This Field corresponds to the {@link SkilltreeSkills} field that can be
     * obtained using the {@link SkilltreeSkills#getBonusType()} method.
     */
    StringField<SkilltreeSkills, String> BONUS_TYPE = StringField.create(
        Identifier.BONUS_TYPE,
        SkilltreeSkills::getBonusType,
        SkilltreeSkills::setBonusType,
        TypeMapper.identity(),
        false
    );
    /**
     * This Field corresponds to the {@link SkilltreeSkills} field that can be
     * obtained using the {@link SkilltreeSkills#getBonusAmount()} method.
     */
    IntField<SkilltreeSkills, Integer> BONUS_AMOUNT = IntField.create(
        Identifier.BONUS_AMOUNT,
        SkilltreeSkills::getBonusAmount,
        SkilltreeSkills::setBonusAmount,
        TypeMapper.primitive(),
        false
    );
    /**
     * This Field corresponds to the {@link SkilltreeSkills} field that can be
     * obtained using the {@link SkilltreeSkills#getBonusFactor()} method.
     */
    ComparableField<SkilltreeSkills, BigDecimal, BigDecimal> BONUS_FACTOR = ComparableField.create(
        Identifier.BONUS_FACTOR,
        SkilltreeSkills::getBonusFactor,
        SkilltreeSkills::setBonusFactor,
        TypeMapper.identity(),
        false
    );
    
    /**
     * Returns the id of this SkilltreeSkills. The id field corresponds to the
     * database column kalaazu.kalaazu.skilltree_skills.id.
     * 
     * @return the id of this SkilltreeSkills
     */
    int getId();
    
    /**
     * Returns the name of this SkilltreeSkills. The name field corresponds to
     * the database column kalaazu.kalaazu.skilltree_skills.name.
     * 
     * @return the name of this SkilltreeSkills
     */
    String getName();
    
    /**
     * Returns the description of this SkilltreeSkills. The description field
     * corresponds to the database column
     * kalaazu.kalaazu.skilltree_skills.description.
     * 
     * @return the description of this SkilltreeSkills
     */
    String getDescription();
    
    /**
     * Returns the category of this SkilltreeSkills. The category field
     * corresponds to the database column
     * kalaazu.kalaazu.skilltree_skills.category.
     * 
     * @return the category of this SkilltreeSkills
     */
    int getCategory();
    
    /**
     * Returns the isAdvanced of this SkilltreeSkills. The isAdvanced field
     * corresponds to the database column
     * kalaazu.kalaazu.skilltree_skills.is_advanced.
     * 
     * @return the isAdvanced of this SkilltreeSkills
     */
    boolean getIsAdvanced();
    
    /**
     * Returns the bonusType of this SkilltreeSkills. The bonusType field
     * corresponds to the database column
     * kalaazu.kalaazu.skilltree_skills.bonus_type.
     * 
     * @return the bonusType of this SkilltreeSkills
     */
    String getBonusType();
    
    /**
     * Returns the bonusAmount of this SkilltreeSkills. The bonusAmount field
     * corresponds to the database column
     * kalaazu.kalaazu.skilltree_skills.bonus_amount.
     * 
     * @return the bonusAmount of this SkilltreeSkills
     */
    int getBonusAmount();
    
    /**
     * Returns the bonusFactor of this SkilltreeSkills. The bonusFactor field
     * corresponds to the database column
     * kalaazu.kalaazu.skilltree_skills.bonus_factor.
     * 
     * @return the bonusFactor of this SkilltreeSkills
     */
    BigDecimal getBonusFactor();
    
    /**
     * Sets the id of this SkilltreeSkills. The id field corresponds to the
     * database column kalaazu.kalaazu.skilltree_skills.id.
     * 
     * @param id to set of this SkilltreeSkills
     * @return   this SkilltreeSkills instance
     */
    SkilltreeSkills setId(int id);
    
    /**
     * Sets the name of this SkilltreeSkills. The name field corresponds to the
     * database column kalaazu.kalaazu.skilltree_skills.name.
     * 
     * @param name to set of this SkilltreeSkills
     * @return     this SkilltreeSkills instance
     */
    SkilltreeSkills setName(String name);
    
    /**
     * Sets the description of this SkilltreeSkills. The description field
     * corresponds to the database column
     * kalaazu.kalaazu.skilltree_skills.description.
     * 
     * @param description to set of this SkilltreeSkills
     * @return            this SkilltreeSkills instance
     */
    SkilltreeSkills setDescription(String description);
    
    /**
     * Sets the category of this SkilltreeSkills. The category field corresponds
     * to the database column kalaazu.kalaazu.skilltree_skills.category.
     * 
     * @param category to set of this SkilltreeSkills
     * @return         this SkilltreeSkills instance
     */
    SkilltreeSkills setCategory(int category);
    
    /**
     * Sets the isAdvanced of this SkilltreeSkills. The isAdvanced field
     * corresponds to the database column
     * kalaazu.kalaazu.skilltree_skills.is_advanced.
     * 
     * @param isAdvanced to set of this SkilltreeSkills
     * @return           this SkilltreeSkills instance
     */
    SkilltreeSkills setIsAdvanced(boolean isAdvanced);
    
    /**
     * Sets the bonusType of this SkilltreeSkills. The bonusType field
     * corresponds to the database column
     * kalaazu.kalaazu.skilltree_skills.bonus_type.
     * 
     * @param bonusType to set of this SkilltreeSkills
     * @return          this SkilltreeSkills instance
     */
    SkilltreeSkills setBonusType(String bonusType);
    
    /**
     * Sets the bonusAmount of this SkilltreeSkills. The bonusAmount field
     * corresponds to the database column
     * kalaazu.kalaazu.skilltree_skills.bonus_amount.
     * 
     * @param bonusAmount to set of this SkilltreeSkills
     * @return            this SkilltreeSkills instance
     */
    SkilltreeSkills setBonusAmount(int bonusAmount);
    
    /**
     * Sets the bonusFactor of this SkilltreeSkills. The bonusFactor field
     * corresponds to the database column
     * kalaazu.kalaazu.skilltree_skills.bonus_factor.
     * 
     * @param bonusFactor to set of this SkilltreeSkills
     * @return            this SkilltreeSkills instance
     */
    SkilltreeSkills setBonusFactor(BigDecimal bonusFactor);
    
    enum Identifier implements ColumnIdentifier<SkilltreeSkills> {
        
        ID           ("id"),
        NAME         ("name"),
        DESCRIPTION  ("description"),
        CATEGORY     ("category"),
        IS_ADVANCED  ("is_advanced"),
        BONUS_TYPE   ("bonus_type"),
        BONUS_AMOUNT ("bonus_amount"),
        BONUS_FACTOR ("bonus_factor");
        
        private final String columnName;
        private final TableIdentifier<SkilltreeSkills> tableIdentifier;
        
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
            return "skilltree_skills";
        }
        
        @Override
        public String getColumnName() {
            return this.columnName;
        }
        
        @Override
        public TableIdentifier<SkilltreeSkills> asTableIdentifier() {
            return this.tableIdentifier;
        }
    }
}