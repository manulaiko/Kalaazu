package com.kalaazu.persistence.database.entities.rewards_collectables.generated;

import com.kalaazu.persistence.database.entities.Collectables;
import com.kalaazu.persistence.database.entities.Manager;
import com.kalaazu.persistence.database.entities.Rewards;
import com.kalaazu.persistence.database.entities.RewardsCollectables;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.ColumnIdentifier;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.field.ByteForeignKeyField;
import com.speedment.runtime.field.ShortField;
import com.speedment.runtime.field.ShortForeignKeyField;
import com.speedment.runtime.typemapper.TypeMapper;

/**
 * The generated base for the {@link
 * RewardsCollectables}-interface
 * representing entities of the {@code rewards_collectables}-table in the
 * database.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedRewardsCollectables {

    /**
     * This Field corresponds to the {@link RewardsCollectables} field that can
     * be obtained using the {@link RewardsCollectables#getId()} method.
     */
    ShortField<RewardsCollectables, Short> ID = ShortField.create(
            Identifier.ID,
            RewardsCollectables::getId,
            RewardsCollectables::setId,
            TypeMapper.primitive(),
            true
    );

    /**
     * This Field corresponds to the {@link RewardsCollectables} field that can
     * be obtained using the {@link RewardsCollectables#getCollectablesId()}
     * method.
     */
    ByteForeignKeyField<RewardsCollectables, Byte, Collectables> COLLECTABLES_ID = ByteForeignKeyField.create(
            Identifier.COLLECTABLES_ID,
            RewardsCollectables::getCollectablesId,
            RewardsCollectables::setCollectablesId,
            Collectables.ID,
            TypeMapper.primitive(),
            false
    );

    /**
     * This Field corresponds to the {@link RewardsCollectables} field that can
     * be obtained using the {@link RewardsCollectables#getRewardsId()} method.
     */
    ShortForeignKeyField<RewardsCollectables, Short, Rewards> REWARDS_ID = ShortForeignKeyField.create(
            Identifier.REWARDS_ID,
            RewardsCollectables::getRewardsId,
            RewardsCollectables::setRewardsId,
            Rewards.ID,
            TypeMapper.primitive(),
            false
    );

    /**
     * Returns the id of this RewardsCollectables. The id field corresponds to
     * the database column kalaazu.kalaazu.rewards_collectables.id.
     *
     * @return the id of this RewardsCollectables
     */
    Short getId();

    /**
     * Returns the collectablesId of this RewardsCollectables. The
     * collectablesId field corresponds to the database column
     * kalaazu.kalaazu.rewards_collectables.collectables_id.
     *
     * @return the collectablesId of this RewardsCollectables
     */
    byte getCollectablesId();

    /**
     * Returns the rewardsId of this RewardsCollectables. The rewardsId field
     * corresponds to the database column
     * kalaazu.kalaazu.rewards_collectables.rewards_id.
     *
     * @return the rewardsId of this RewardsCollectables
     */
    short getRewardsId();

    /**
     * Sets the id of this RewardsCollectables. The id field corresponds to the
     * database column kalaazu.kalaazu.rewards_collectables.id.
     *
     * @param id to set of this RewardsCollectables
     *
     * @return this RewardsCollectables instance
     */
    RewardsCollectables setId(short id);

    /**
     * Sets the collectablesId of this RewardsCollectables. The collectablesId
     * field corresponds to the database column
     * kalaazu.kalaazu.rewards_collectables.collectables_id.
     *
     * @param collectablesId to set of this RewardsCollectables
     *
     * @return this RewardsCollectables instance
     */
    RewardsCollectables setCollectablesId(byte collectablesId);

    /**
     * Sets the rewardsId of this RewardsCollectables. The rewardsId field
     * corresponds to the database column
     * kalaazu.kalaazu.rewards_collectables.rewards_id.
     *
     * @param rewardsId to set of this RewardsCollectables
     *
     * @return this RewardsCollectables instance
     */
    RewardsCollectables setRewardsId(short rewardsId);

    /**
     * Queries the specified manager for the referenced Collectables. If no such
     * Collectables exists, an {@code NullPointerException} will be thrown.
     *
     * @param foreignManager the manager to query for the entity
     *
     * @return the foreign entity referenced
     */
    Collectables findCollectablesId(Manager<Collectables> foreignManager);

    /**
     * Queries the specified manager for the referenced Rewards. If no such
     * Rewards exists, an {@code NullPointerException} will be thrown.
     *
     * @param foreignManager the manager to query for the entity
     *
     * @return the foreign entity referenced
     */
    Rewards findRewardsId(Manager<Rewards> foreignManager);

    enum Identifier implements ColumnIdentifier<RewardsCollectables> {

        ID("id"),
        COLLECTABLES_ID("collectables_id"),
        REWARDS_ID("rewards_id");

        private final String columnName;

        private final TableIdentifier<RewardsCollectables> tableIdentifier;

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
            return "rewards_collectables";
        }

        @Override
        public String getColumnName() {
            return this.columnName;
        }

        @Override
        public TableIdentifier<RewardsCollectables> asTableIdentifier() {
            return this.tableIdentifier;
        }
    }
}