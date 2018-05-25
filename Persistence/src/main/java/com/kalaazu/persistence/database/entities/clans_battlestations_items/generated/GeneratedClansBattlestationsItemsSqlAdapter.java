package com.kalaazu.persistence.database.entities.clans_battlestations_items.generated;

import com.kalaazu.persistence.database.entities.ClansBattlestationsItems;
import com.kalaazu.persistence.database.entities.clans_battlestations_items.ClansBattlestationsItemsImpl;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.common.injector.annotation.ExecuteBefore;
import com.speedment.common.injector.annotation.WithState;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.component.sql.SqlPersistenceComponent;
import com.speedment.runtime.core.component.sql.SqlStreamSupplierComponent;
import com.speedment.runtime.core.exception.SpeedmentException;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.speedment.common.injector.State.RESOLVED;

/**
 * The generated Sql Adapter for a {@link
 * ClansBattlestationsItems}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedClansBattlestationsItemsSqlAdapter {

    private final TableIdentifier<ClansBattlestationsItems> tableIdentifier;

    protected GeneratedClansBattlestationsItemsSqlAdapter() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "clans_battlestations_items");
    }

    @ExecuteBefore(RESOLVED)
    void installMethodName(
            @WithState(RESOLVED) SqlStreamSupplierComponent streamSupplierComponent,
            @WithState(RESOLVED) SqlPersistenceComponent persistenceComponent
    ) {
        streamSupplierComponent.install(tableIdentifier, this::apply);
        persistenceComponent.install(tableIdentifier);
    }

    protected ClansBattlestationsItems apply(ResultSet resultSet) throws SpeedmentException {
        final ClansBattlestationsItems entity = createEntity();
        try {
            entity.setId(resultSet.getInt(1));
            entity.setClansBattlestationsId(resultSet.getByte(2));
            entity.setAccountsItemsId(resultSet.getInt(3));
            entity.setSlot(resultSet.getByte(4));
            entity.setDate(resultSet.getTimestamp(5));
        } catch (final SQLException sqle) {
            throw new SpeedmentException(sqle);
        }
        return entity;
    }

    protected ClansBattlestationsItemsImpl createEntity() {
        return new ClansBattlestationsItemsImpl();
    }
}