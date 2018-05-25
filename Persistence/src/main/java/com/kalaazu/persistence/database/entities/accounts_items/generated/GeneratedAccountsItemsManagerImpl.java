package com.kalaazu.persistence.database.entities.accounts_items.generated;

import com.kalaazu.persistence.database.entities.AccountsItems;
import com.kalaazu.persistence.database.entities.accounts_items.AccountsItemsManager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.AbstractManager;
import com.speedment.runtime.field.Field;

import java.util.stream.Stream;

/**
 * The generated base implementation for the manager of every {@link
 * AccountsItems}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedAccountsItemsManagerImpl
        extends AbstractManager<AccountsItems>
        implements GeneratedAccountsItemsManager {

    private final TableIdentifier<AccountsItems> tableIdentifier;

    protected GeneratedAccountsItemsManagerImpl() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "accounts_items");
    }

    @Override
    public TableIdentifier<AccountsItems> getTableIdentifier() {
        return tableIdentifier;
    }

    @Override
    public Stream<Field<AccountsItems>> fields() {
        return AccountsItemsManager.FIELDS.stream();
    }

    @Override
    public Stream<Field<AccountsItems>> primaryKeyFields() {
        return Stream.of(
                AccountsItems.ID
        );
    }
}