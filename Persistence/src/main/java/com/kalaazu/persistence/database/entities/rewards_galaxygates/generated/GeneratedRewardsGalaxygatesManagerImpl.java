package com.kalaazu.persistence.database.entities.rewards_galaxygates.generated;

import com.kalaazu.persistence.database.entities.RewardsGalaxygates;
import com.kalaazu.persistence.database.entities.rewards_galaxygates.RewardsGalaxygatesManager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.AbstractManager;
import com.speedment.runtime.field.Field;

import java.util.stream.Stream;

/**
 * The generated base implementation for the manager of every {@link
 * RewardsGalaxygates}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedRewardsGalaxygatesManagerImpl
        extends AbstractManager<RewardsGalaxygates>
        implements GeneratedRewardsGalaxygatesManager {

    private final TableIdentifier<RewardsGalaxygates> tableIdentifier;

    protected GeneratedRewardsGalaxygatesManagerImpl() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "rewards_galaxygates");
    }

    @Override
    public TableIdentifier<RewardsGalaxygates> getTableIdentifier() {
        return tableIdentifier;
    }

    @Override
    public Stream<Field<RewardsGalaxygates>> fields() {
        return RewardsGalaxygatesManager.FIELDS.stream();
    }

    @Override
    public Stream<Field<RewardsGalaxygates>> primaryKeyFields() {
        return Stream.of(
                RewardsGalaxygates.ID
        );
    }
}