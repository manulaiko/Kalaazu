package com.kalaazu.persistence.database.entities.rewards_vouchers.generated;

import com.kalaazu.persistence.database.entities.RewardsVouchers;
import com.kalaazu.persistence.database.entities.rewards_vouchers.RewardsVouchersManager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.AbstractManager;
import com.speedment.runtime.field.Field;

import java.util.stream.Stream;

/**
 * The generated base implementation for the manager of every {@link
 * RewardsVouchers}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedRewardsVouchersManagerImpl
        extends AbstractManager<RewardsVouchers>
        implements GeneratedRewardsVouchersManager {

    private final TableIdentifier<RewardsVouchers> tableIdentifier;

    protected GeneratedRewardsVouchersManagerImpl() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "rewards_vouchers");
    }

    @Override
    public TableIdentifier<RewardsVouchers> getTableIdentifier() {
        return tableIdentifier;
    }

    @Override
    public Stream<Field<RewardsVouchers>> fields() {
        return RewardsVouchersManager.FIELDS.stream();
    }

    @Override
    public Stream<Field<RewardsVouchers>> primaryKeyFields() {
        return Stream.of(
                RewardsVouchers.ID
        );
    }
}