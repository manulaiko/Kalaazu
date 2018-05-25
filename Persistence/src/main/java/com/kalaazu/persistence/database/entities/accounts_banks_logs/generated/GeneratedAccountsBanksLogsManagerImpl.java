package com.kalaazu.persistence.database.entities.accounts_banks_logs.generated;

import com.kalaazu.persistence.database.entities.AccountsBanksLogs;
import com.kalaazu.persistence.database.entities.accounts_banks_logs.AccountsBanksLogsManager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.AbstractManager;
import com.speedment.runtime.field.Field;

import java.util.stream.Stream;

/**
 * The generated base implementation for the manager of every {@link
 * AccountsBanksLogs}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedAccountsBanksLogsManagerImpl
        extends AbstractManager<AccountsBanksLogs>
        implements GeneratedAccountsBanksLogsManager {

    private final TableIdentifier<AccountsBanksLogs> tableIdentifier;

    protected GeneratedAccountsBanksLogsManagerImpl() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "accounts_banks_logs");
    }

    @Override
    public TableIdentifier<AccountsBanksLogs> getTableIdentifier() {
        return tableIdentifier;
    }

    @Override
    public Stream<Field<AccountsBanksLogs>> fields() {
        return AccountsBanksLogsManager.FIELDS.stream();
    }

    @Override
    public Stream<Field<AccountsBanksLogs>> primaryKeyFields() {
        return Stream.of(
                AccountsBanksLogs.ID
        );
    }
}