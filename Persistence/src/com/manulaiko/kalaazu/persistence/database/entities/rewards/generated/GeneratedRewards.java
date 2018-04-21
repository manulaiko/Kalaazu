package com.manulaiko.kalaazu.persistence.database.entities.rewards.generated;

import com.manulaiko.kalaazu.persistence.database.entities.items.Items;
import com.manulaiko.kalaazu.persistence.database.entities.rewards.Rewards;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.ColumnIdentifier;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.Manager;
import com.speedment.runtime.core.util.OptionalUtil;
import com.speedment.runtime.field.ComparableField;
import com.speedment.runtime.field.IntField;
import com.speedment.runtime.field.IntForeignKeyField;
import com.speedment.runtime.field.StringField;
import com.speedment.runtime.typemapper.TypeMapper;
import java.math.BigDecimal;
import java.util.Optional;

/**
 * The generated base for the {@link
 * com.manulaiko.kalaazu.persistence.database.entities.rewards.Rewards}-interface
 * representing entities of the {@code rewards}-table in the database.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedRewards {
    
    /**
     * This Field corresponds to the {@link Rewards} field that can be obtained
     * using the {@link Rewards#getId()} method.
     */
    IntField<Rewards, Integer> ID = IntField.create(
        Identifier.ID,
        Rewards::getId,
        Rewards::setId,
        TypeMapper.primitive(),
        true
    );
    /**
     * This Field corresponds to the {@link Rewards} field that can be obtained
     * using the {@link Rewards#getItemsId()} method.
     */
    IntForeignKeyField<Rewards, Integer, Items> ITEMS_ID = IntForeignKeyField.create(
        Identifier.ITEMS_ID,
        Rewards::getItemsId,
        Rewards::setItemsId,
        Items.ID,
        TypeMapper.primitive(),
        false
    );
    /**
     * This Field corresponds to the {@link Rewards} field that can be obtained
     * using the {@link Rewards#getAmount()} method.
     */
    IntField<Rewards, Integer> AMOUNT = IntField.create(
        Identifier.AMOUNT,
        Rewards::getAmount,
        Rewards::setAmount,
        TypeMapper.primitive(),
        false
    );
    /**
     * This Field corresponds to the {@link Rewards} field that can be obtained
     * using the {@link Rewards#getReward()} method.
     */
    ComparableField<Rewards, BigDecimal, BigDecimal> REWARD = ComparableField.create(
        Identifier.REWARD,
        Rewards::getReward,
        Rewards::setReward,
        TypeMapper.identity(),
        false
    );
    /**
     * This Field corresponds to the {@link Rewards} field that can be obtained
     * using the {@link Rewards#getProbability()} method.
     */
    ComparableField<Rewards, BigDecimal, BigDecimal> PROBABILITY = ComparableField.create(
        Identifier.PROBABILITY,
        Rewards::getProbability,
        Rewards::setProbability,
        TypeMapper.identity(),
        false
    );
    /**
     * This Field corresponds to the {@link Rewards} field that can be obtained
     * using the {@link Rewards#getComment()} method.
     */
    StringField<Rewards, String> COMMENT = StringField.create(
        Identifier.COMMENT,
        o -> OptionalUtil.unwrap(o.getComment()),
        Rewards::setComment,
        TypeMapper.identity(),
        false
    );
    
    /**
     * Returns the id of this Rewards. The id field corresponds to the database
     * column kalaazu.kalaazu.rewards.id.
     * 
     * @return the id of this Rewards
     */
    int getId();
    
    /**
     * Returns the itemsId of this Rewards. The itemsId field corresponds to the
     * database column kalaazu.kalaazu.rewards.items_id.
     * 
     * @return the itemsId of this Rewards
     */
    int getItemsId();
    
    /**
     * Returns the amount of this Rewards. The amount field corresponds to the
     * database column kalaazu.kalaazu.rewards.amount.
     * 
     * @return the amount of this Rewards
     */
    int getAmount();
    
    /**
     * Returns the reward of this Rewards. The reward field corresponds to the
     * database column kalaazu.kalaazu.rewards.reward.
     * 
     * @return the reward of this Rewards
     */
    BigDecimal getReward();
    
    /**
     * Returns the probability of this Rewards. The probability field
     * corresponds to the database column kalaazu.kalaazu.rewards.probability.
     * 
     * @return the probability of this Rewards
     */
    BigDecimal getProbability();
    
    /**
     * Returns the comment of this Rewards. The comment field corresponds to the
     * database column kalaazu.kalaazu.rewards.comment.
     * 
     * @return the comment of this Rewards
     */
    Optional<String> getComment();
    
    /**
     * Sets the id of this Rewards. The id field corresponds to the database
     * column kalaazu.kalaazu.rewards.id.
     * 
     * @param id to set of this Rewards
     * @return   this Rewards instance
     */
    Rewards setId(int id);
    
    /**
     * Sets the itemsId of this Rewards. The itemsId field corresponds to the
     * database column kalaazu.kalaazu.rewards.items_id.
     * 
     * @param itemsId to set of this Rewards
     * @return        this Rewards instance
     */
    Rewards setItemsId(int itemsId);
    
    /**
     * Sets the amount of this Rewards. The amount field corresponds to the
     * database column kalaazu.kalaazu.rewards.amount.
     * 
     * @param amount to set of this Rewards
     * @return       this Rewards instance
     */
    Rewards setAmount(int amount);
    
    /**
     * Sets the reward of this Rewards. The reward field corresponds to the
     * database column kalaazu.kalaazu.rewards.reward.
     * 
     * @param reward to set of this Rewards
     * @return       this Rewards instance
     */
    Rewards setReward(BigDecimal reward);
    
    /**
     * Sets the probability of this Rewards. The probability field corresponds
     * to the database column kalaazu.kalaazu.rewards.probability.
     * 
     * @param probability to set of this Rewards
     * @return            this Rewards instance
     */
    Rewards setProbability(BigDecimal probability);
    
    /**
     * Sets the comment of this Rewards. The comment field corresponds to the
     * database column kalaazu.kalaazu.rewards.comment.
     * 
     * @param comment to set of this Rewards
     * @return        this Rewards instance
     */
    Rewards setComment(String comment);
    
    /**
     * Queries the specified manager for the referenced Items. If no such Items
     * exists, an {@code NullPointerException} will be thrown.
     * 
     * @param foreignManager the manager to query for the entity
     * @return               the foreign entity referenced
     */
    Items findItemsId(Manager<Items> foreignManager);
    
    enum Identifier implements ColumnIdentifier<Rewards> {
        
        ID          ("id"),
        ITEMS_ID    ("items_id"),
        AMOUNT      ("amount"),
        REWARD      ("reward"),
        PROBABILITY ("probability"),
        COMMENT     ("comment");
        
        private final String columnName;
        private final TableIdentifier<Rewards> tableIdentifier;
        
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
            return "rewards";
        }
        
        @Override
        public String getColumnName() {
            return this.columnName;
        }
        
        @Override
        public TableIdentifier<Rewards> asTableIdentifier() {
            return this.tableIdentifier;
        }
    }
}