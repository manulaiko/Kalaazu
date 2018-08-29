package com.kalaazu.persistence.database.entities.rewards_vouchers.generated;

import com.kalaazu.persistence.database.entities.Manager;
import com.kalaazu.persistence.database.entities.Rewards;
import com.kalaazu.persistence.database.entities.RewardsVouchers;
import com.kalaazu.persistence.database.entities.Vouchers;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.ColumnIdentifier;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.field.ShortField;
import com.speedment.runtime.field.ShortForeignKeyField;
import com.speedment.runtime.typemapper.TypeMapper;

/**
 * The generated base for the {@link
 * RewardsVouchers}-interface
 * representing entities of the {@code rewards_vouchers}-table in the database.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedRewardsVouchers {

    /**
     * This Field corresponds to the {@link RewardsVouchers} field that can be
     * obtained using the {@link RewardsVouchers#id()} method.
     */
    ShortField<RewardsVouchers, Short> ID = ShortField.create(
            Identifier.ID,
            RewardsVouchers::id,
            RewardsVouchers::id,
            TypeMapper.primitive(),
            true
    );

    /**
     * This Field corresponds to the {@link RewardsVouchers} field that can be
     * obtained using the {@link RewardsVouchers#vouchersId()} method.
     */
    ShortForeignKeyField<RewardsVouchers, Short, Vouchers> VOUCHERS_ID = ShortForeignKeyField.create(
            Identifier.VOUCHERS_ID,
            RewardsVouchers::vouchersId,
            RewardsVouchers::vouchersId,
            Vouchers.ID,
            TypeMapper.primitive(),
            false
    );

    /**
     * This Field corresponds to the {@link RewardsVouchers} field that can be
     * obtained using the {@link RewardsVouchers#rewardsId()} method.
     */
    ShortForeignKeyField<RewardsVouchers, Short, Rewards> REWARDS_ID = ShortForeignKeyField.create(
            Identifier.REWARDS_ID,
            RewardsVouchers::rewardsId,
            RewardsVouchers::rewardsId,
            Rewards.ID,
            TypeMapper.primitive(),
            false
    );

    /**
     * Returns the id of this RewardsVouchers. The id field corresponds to the
     * database column kalaazu.kalaazu.rewards_vouchers.id.
     *
     * @return the id of this RewardsVouchers
     */
    Short id();

    /**
     * Returns the vouchersId of this RewardsVouchers. The vouchersId field
     * corresponds to the database column
     * kalaazu.kalaazu.rewards_vouchers.vouchers_id.
     *
     * @return the vouchersId of this RewardsVouchers
     */
    short vouchersId();

    /**
     * Returns the rewardsId of this RewardsVouchers. The rewardsId field
     * corresponds to the database column
     * kalaazu.kalaazu.rewards_vouchers.rewards_id.
     *
     * @return the rewardsId of this RewardsVouchers
     */
    short rewardsId();

    /**
     * Sets the id of this RewardsVouchers. The id field corresponds to the
     * database column kalaazu.kalaazu.rewards_vouchers.id.
     *
     * @param id to set of this RewardsVouchers
     *
     * @return this RewardsVouchers instance
     */
    RewardsVouchers id(Short id);

    /**
     * Sets the vouchersId of this RewardsVouchers. The vouchersId field
     * corresponds to the database column
     * kalaazu.kalaazu.rewards_vouchers.vouchers_id.
     *
     * @param vouchersId to set of this RewardsVouchers
     *
     * @return this RewardsVouchers instance
     */
    RewardsVouchers vouchersId(short vouchersId);

    /**
     * Sets the rewardsId of this RewardsVouchers. The rewardsId field
     * corresponds to the database column
     * kalaazu.kalaazu.rewards_vouchers.rewards_id.
     *
     * @param rewardsId to set of this RewardsVouchers
     *
     * @return this RewardsVouchers instance
     */
    RewardsVouchers rewardsId(short rewardsId);

    /**
     * Queries the specified manager for the referenced Vouchers. If no such
     * Vouchers exists, an {@code NullPointerException} will be thrown.
     *
     * @param foreignManager the manager to query for the entity
     *
     * @return the foreign entity referenced
     */
    Vouchers findVouchersId(Manager<Vouchers> foreignManager);

    /**
     * Queries the specified manager for the referenced Rewards. If no such
     * Rewards exists, an {@code NullPointerException} will be thrown.
     *
     * @param foreignManager the manager to query for the entity
     *
     * @return the foreign entity referenced
     */
    Rewards findRewardsId(Manager<Rewards> foreignManager);

    enum Identifier implements ColumnIdentifier<RewardsVouchers> {

        ID("id"),
        VOUCHERS_ID("vouchers_id"),
        REWARDS_ID("rewards_id");

        private final String columnName;

        private final TableIdentifier<RewardsVouchers> tableIdentifier;

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
            return "rewards_vouchers";
        }

        @Override
        public String getColumnName() {
            return this.columnName;
        }

        @Override
        public TableIdentifier<RewardsVouchers> asTableIdentifier() {
            return this.tableIdentifier;
        }
    }
}