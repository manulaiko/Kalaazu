package com.kalaazu.persistence.database.entities.rewards_galaxygates.generated;

import com.kalaazu.persistence.database.entities.Galaxygates;
import com.kalaazu.persistence.database.entities.Manager;
import com.kalaazu.persistence.database.entities.Rewards;
import com.kalaazu.persistence.database.entities.RewardsGalaxygates;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.ColumnIdentifier;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.field.ByteField;
import com.speedment.runtime.field.ByteForeignKeyField;
import com.speedment.runtime.field.ShortForeignKeyField;
import com.speedment.runtime.typemapper.TypeMapper;

/**
 * The generated base for the {@link
 * RewardsGalaxygates}-interface
 * representing entities of the {@code rewards_galaxygates}-table in the
 * database.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedRewardsGalaxygates {

    /**
     * This Field corresponds to the {@link RewardsGalaxygates} field that can
     * be obtained using the {@link RewardsGalaxygates#getId()} method.
     */
    ByteField<RewardsGalaxygates, Byte> ID = ByteField.create(
            Identifier.ID,
            RewardsGalaxygates::getId,
            RewardsGalaxygates::setId,
            TypeMapper.primitive(),
            true
    );

    /**
     * This Field corresponds to the {@link RewardsGalaxygates} field that can
     * be obtained using the {@link RewardsGalaxygates#getGalaxygatesId()}
     * method.
     */
    ByteForeignKeyField<RewardsGalaxygates, Byte, Galaxygates> GALAXYGATES_ID = ByteForeignKeyField.create(
            Identifier.GALAXYGATES_ID,
            RewardsGalaxygates::getGalaxygatesId,
            RewardsGalaxygates::setGalaxygatesId,
            Galaxygates.ID,
            TypeMapper.primitive(),
            false
    );

    /**
     * This Field corresponds to the {@link RewardsGalaxygates} field that can
     * be obtained using the {@link RewardsGalaxygates#getRewardsId()} method.
     */
    ShortForeignKeyField<RewardsGalaxygates, Short, Rewards> REWARDS_ID = ShortForeignKeyField.create(
            Identifier.REWARDS_ID,
            RewardsGalaxygates::getRewardsId,
            RewardsGalaxygates::setRewardsId,
            Rewards.ID,
            TypeMapper.primitive(),
            false
    );

    /**
     * Returns the id of this RewardsGalaxygates. The id field corresponds to
     * the database column kalaazu.kalaazu.rewards_galaxygates.id.
     *
     * @return the id of this RewardsGalaxygates
     */
    Byte getId();

    /**
     * Returns the galaxygatesId of this RewardsGalaxygates. The galaxygatesId
     * field corresponds to the database column
     * kalaazu.kalaazu.rewards_galaxygates.galaxygates_id.
     *
     * @return the galaxygatesId of this RewardsGalaxygates
     */
    byte getGalaxygatesId();

    /**
     * Returns the rewardsId of this RewardsGalaxygates. The rewardsId field
     * corresponds to the database column
     * kalaazu.kalaazu.rewards_galaxygates.rewards_id.
     *
     * @return the rewardsId of this RewardsGalaxygates
     */
    short getRewardsId();

    /**
     * Sets the id of this RewardsGalaxygates. The id field corresponds to the
     * database column kalaazu.kalaazu.rewards_galaxygates.id.
     *
     * @param id to set of this RewardsGalaxygates
     *
     * @return this RewardsGalaxygates instance
     */
    RewardsGalaxygates setId(byte id);

    /**
     * Sets the galaxygatesId of this RewardsGalaxygates. The galaxygatesId
     * field corresponds to the database column
     * kalaazu.kalaazu.rewards_galaxygates.galaxygates_id.
     *
     * @param galaxygatesId to set of this RewardsGalaxygates
     *
     * @return this RewardsGalaxygates instance
     */
    RewardsGalaxygates setGalaxygatesId(byte galaxygatesId);

    /**
     * Sets the rewardsId of this RewardsGalaxygates. The rewardsId field
     * corresponds to the database column
     * kalaazu.kalaazu.rewards_galaxygates.rewards_id.
     *
     * @param rewardsId to set of this RewardsGalaxygates
     *
     * @return this RewardsGalaxygates instance
     */
    RewardsGalaxygates setRewardsId(short rewardsId);

    /**
     * Queries the specified manager for the referenced Galaxygates. If no such
     * Galaxygates exists, an {@code NullPointerException} will be thrown.
     *
     * @param foreignManager the manager to query for the entity
     *
     * @return the foreign entity referenced
     */
    Galaxygates findGalaxygatesId(Manager<Galaxygates> foreignManager);

    /**
     * Queries the specified manager for the referenced Rewards. If no such
     * Rewards exists, an {@code NullPointerException} will be thrown.
     *
     * @param foreignManager the manager to query for the entity
     *
     * @return the foreign entity referenced
     */
    Rewards findRewardsId(Manager<Rewards> foreignManager);

    enum Identifier implements ColumnIdentifier<RewardsGalaxygates> {

        ID("id"),
        GALAXYGATES_ID("galaxygates_id"),
        REWARDS_ID("rewards_id");

        private final String columnName;

        private final TableIdentifier<RewardsGalaxygates> tableIdentifier;

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
            return "rewards_galaxygates";
        }

        @Override
        public String getColumnName() {
            return this.columnName;
        }

        @Override
        public TableIdentifier<RewardsGalaxygates> asTableIdentifier() {
            return this.tableIdentifier;
        }
    }
}