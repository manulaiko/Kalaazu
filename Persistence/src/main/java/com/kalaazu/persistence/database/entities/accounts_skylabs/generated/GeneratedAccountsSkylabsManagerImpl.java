package com.kalaazu.persistence.database.entities.accounts_skylabs.generated;

import com.kalaazu.persistence.database.entities.AccountsSkylabs;
import com.kalaazu.persistence.database.entities.accounts_skylabs.AccountsSkylabsManager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.AbstractManager;
import com.speedment.runtime.field.Field;

import java.util.stream.Stream;

/**
 * The generated base implementation for the manager of every {@link
 * AccountsSkylabs}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedAccountsSkylabsManagerImpl
        extends AbstractManager<AccountsSkylabs>
        implements GeneratedAccountsSkylabsManager {

    private final TableIdentifier<AccountsSkylabs> tableIdentifier;

    protected GeneratedAccountsSkylabsManagerImpl() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "accounts_skylabs");
    }

    @Override
    public TableIdentifier<AccountsSkylabs> getTableIdentifier() {
        return tableIdentifier;
    }

    @Override
    public Stream<Field<AccountsSkylabs>> fields() {
        return AccountsSkylabsManager.FIELDS.stream();
    }

    @Override
    public Stream<Field<AccountsSkylabs>> primaryKeyFields() {
        return Stream.of(
                AccountsSkylabs.ID
        );
    }
}