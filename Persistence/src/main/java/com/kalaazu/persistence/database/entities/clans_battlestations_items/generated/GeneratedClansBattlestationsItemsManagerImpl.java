package com.kalaazu.persistence.database.entities.clans_battlestations_items.generated;

import com.kalaazu.persistence.database.entities.ClansBattlestationsItems;
import com.kalaazu.persistence.database.entities.clans_battlestations_items.ClansBattlestationsItemsManager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.AbstractManager;
import com.speedment.runtime.field.Field;

import java.util.stream.Stream;

/**
 * The generated base implementation for the manager of every {@link
 * ClansBattlestationsItems}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedClansBattlestationsItemsManagerImpl
        extends AbstractManager<ClansBattlestationsItems>
        implements GeneratedClansBattlestationsItemsManager {

    private final TableIdentifier<ClansBattlestationsItems> tableIdentifier;

    protected GeneratedClansBattlestationsItemsManagerImpl() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "clans_battlestations_items");
    }

    @Override
    public TableIdentifier<ClansBattlestationsItems> getTableIdentifier() {
        return tableIdentifier;
    }

    @Override
    public Stream<Field<ClansBattlestationsItems>> fields() {
        return ClansBattlestationsItemsManager.FIELDS.stream();
    }

    @Override
    public Stream<Field<ClansBattlestationsItems>> primaryKeyFields() {
        return Stream.of(
                ClansBattlestationsItems.ID
        );
    }
}