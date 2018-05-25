package com.kalaazu.persistence.database.entities.rewards.generated;

import com.kalaazu.persistence.database.entities.Items;
import com.kalaazu.persistence.database.entities.Manager;
import com.kalaazu.persistence.database.entities.Rewards;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.ColumnIdentifier;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.util.OptionalUtil;
import com.speedment.runtime.field.*;
import com.speedment.runtime.typemapper.TypeMapper;

import java.util.Optional;

/**
 * The generated base for the {@link
 * Rewards}-interface
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
    ShortField<Rewards, Short> ID = ShortField.create(
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
    ShortForeignKeyField<Rewards, Short, Items> ITEMS_ID = ShortForeignKeyField.create(
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
     * using the {@link Rewards#getProbability()} method.
     */
    DoubleField<Rewards, Double> PROBABILITY = DoubleField.create(
            Identifier.PROBABILITY,
            Rewards::getProbability,
            Rewards::setProbability,
            TypeMapper.primitive(),
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
    Short getId();

    /**
     * Returns the itemsId of this Rewards. The itemsId field corresponds to the
     * database column kalaazu.kalaazu.rewards.items_id.
     *
     * @return the itemsId of this Rewards
     */
    short getItemsId();

    /**
     * Returns the amount of this Rewards. The amount field corresponds to the
     * database column kalaazu.kalaazu.rewards.amount.
     *
     * @return the amount of this Rewards
     */
    int getAmount();

    /**
     * Returns the probability of this Rewards. The probability field
     * corresponds to the database column kalaazu.kalaazu.rewards.probability.
     *
     * @return the probability of this Rewards
     */
    double getProbability();

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
     *
     * @return this Rewards instance
     */
    Rewards setId(short id);

    /**
     * Sets the itemsId of this Rewards. The itemsId field corresponds to the
     * database column kalaazu.kalaazu.rewards.items_id.
     *
     * @param itemsId to set of this Rewards
     *
     * @return this Rewards instance
     */
    Rewards setItemsId(short itemsId);

    /**
     * Sets the amount of this Rewards. The amount field corresponds to the
     * database column kalaazu.kalaazu.rewards.amount.
     *
     * @param amount to set of this Rewards
     *
     * @return this Rewards instance
     */
    Rewards setAmount(int amount);

    /**
     * Sets the probability of this Rewards. The probability field corresponds
     * to the database column kalaazu.kalaazu.rewards.probability.
     *
     * @param probability to set of this Rewards
     *
     * @return this Rewards instance
     */
    Rewards setProbability(double probability);

    /**
     * Sets the comment of this Rewards. The comment field corresponds to the
     * database column kalaazu.kalaazu.rewards.comment.
     *
     * @param comment to set of this Rewards
     *
     * @return this Rewards instance
     */
    Rewards setComment(String comment);

    /**
     * Queries the specified manager for the referenced Items. If no such Items
     * exists, an {@code NullPointerException} will be thrown.
     *
     * @param foreignManager the manager to query for the entity
     *
     * @return the foreign entity referenced
     */
    Items findItemsId(Manager<Items> foreignManager);

    enum Identifier implements ColumnIdentifier<Rewards> {

        ID("id"),
        ITEMS_ID("items_id"),
        AMOUNT("amount"),
        PROBABILITY("probability"),
        COMMENT("comment");

        private final String columnName;

        private final TableIdentifier<Rewards> tableIdentifier;

        Identifier(String columnName) {
            this.columnName = columnName;
            this.tableIdentifier = TableIdentifier.of(
                    getDbmsName(),
                    getSchemaName(),
                    getTableName()
            );
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