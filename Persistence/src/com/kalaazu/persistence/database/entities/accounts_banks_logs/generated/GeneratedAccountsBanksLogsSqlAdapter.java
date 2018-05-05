package com.kalaazu.persistence.database.entities.accounts_banks_logs.generated;

import com.kalaazu.persistence.database.entities.AccountsBanksLogs;
import com.kalaazu.persistence.database.entities.accounts_banks_logs.AccountsBanksLogsImpl;
import com.kalaazu.persistence.database.mappers.BankLogType;
import com.kalaazu.persistence.database.mappers.Currency;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.common.injector.annotation.ExecuteBefore;
import com.speedment.common.injector.annotation.WithState;
import com.speedment.runtime.config.Project;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.component.ProjectComponent;
import com.speedment.runtime.core.component.sql.SqlPersistenceComponent;
import com.speedment.runtime.core.component.sql.SqlStreamSupplierComponent;
import com.speedment.runtime.core.component.sql.SqlTypeMapperHelper;
import com.speedment.runtime.core.exception.SpeedmentException;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.speedment.common.injector.State.RESOLVED;
import static com.speedment.runtime.core.internal.util.sql.ResultSetUtil.getInt;

/**
 * The generated Sql Adapter for a {@link
 * AccountsBanksLogs}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedAccountsBanksLogsSqlAdapter {

    private final TableIdentifier<AccountsBanksLogs>     tableIdentifier;

    private       SqlTypeMapperHelper<Byte, BankLogType> typeHelper;

    private       SqlTypeMapperHelper<Byte, Currency>    currencyHelper;

    protected GeneratedAccountsBanksLogsSqlAdapter() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "accounts_banks_logs");
    }

    @ExecuteBefore(RESOLVED)
    void installMethodName(
            @WithState(RESOLVED) SqlStreamSupplierComponent streamSupplierComponent,
            @WithState(RESOLVED) SqlPersistenceComponent persistenceComponent
    ) {
        streamSupplierComponent.install(tableIdentifier, this::apply);
        persistenceComponent.install(tableIdentifier);
    }

    protected AccountsBanksLogs apply(ResultSet resultSet) throws SpeedmentException {
        final AccountsBanksLogs entity = createEntity();
        try {
            entity.setId(resultSet.getInt(1));
            entity.setFromAccountsId(resultSet.getInt(2));
            entity.setToAccountsId(resultSet.getInt(3));
            entity.setDate(resultSet.getTimestamp(4));
            entity.setType(typeHelper.apply(resultSet.getByte(5)));
            entity.setAmount(resultSet.getInt(6));
            entity.setCurrency(currencyHelper.apply(resultSet.getByte(7)));
            entity.setAccountsBanksId(getInt(resultSet, 8));
        } catch (final SQLException sqle) {
            throw new SpeedmentException(sqle);
        }
        return entity;
    }

    protected AccountsBanksLogsImpl createEntity() {
        return new AccountsBanksLogsImpl();
    }

    @ExecuteBefore(RESOLVED)
    void createHelpers(ProjectComponent projectComponent) {
        final Project project = projectComponent.getProject();
        typeHelper = SqlTypeMapperHelper.create(project, AccountsBanksLogs.TYPE, AccountsBanksLogs.class);
        currencyHelper = SqlTypeMapperHelper.create(project, AccountsBanksLogs.CURRENCY, AccountsBanksLogs.class);
    }
}