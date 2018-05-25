package com.kalaazu.persistence.database.entities.clans_banks_logs.generated;

import com.kalaazu.persistence.database.entities.ClansBanksLogs;
import com.kalaazu.persistence.database.entities.clans_banks_logs.ClansBanksLogsImpl;
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

/**
 * The generated Sql Adapter for a {@link
 * ClansBanksLogs}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedClansBanksLogsSqlAdapter {

    private final TableIdentifier<ClansBanksLogs> tableIdentifier;

    private SqlTypeMapperHelper<Byte, BankLogType> typeHelper;

    private SqlTypeMapperHelper<Byte, Currency> currencyHelper;

    protected GeneratedClansBanksLogsSqlAdapter() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "clans_banks_logs");
    }

    @ExecuteBefore(RESOLVED)
    void installMethodName(
            @WithState(RESOLVED) SqlStreamSupplierComponent streamSupplierComponent,
            @WithState(RESOLVED) SqlPersistenceComponent persistenceComponent
    ) {
        streamSupplierComponent.install(tableIdentifier, this::apply);
        persistenceComponent.install(tableIdentifier);
    }

    protected ClansBanksLogs apply(ResultSet resultSet) throws SpeedmentException {
        final ClansBanksLogs entity = createEntity();
        try {
            entity.setId(resultSet.getInt(1));
            entity.setClansBanksId(resultSet.getInt(2));
            entity.setFromAccountsId(resultSet.getInt(3));
            entity.setToAccountsId(resultSet.getInt(4));
            entity.setDate(resultSet.getTimestamp(5));
            entity.setType(typeHelper.apply(resultSet.getByte(6)));
            entity.setAmount(resultSet.getInt(7));
            entity.setCurrency(currencyHelper.apply(resultSet.getByte(8)));
        } catch (final SQLException sqle) {
            throw new SpeedmentException(sqle);
        }
        return entity;
    }

    protected ClansBanksLogsImpl createEntity() {
        return new ClansBanksLogsImpl();
    }

    @ExecuteBefore(RESOLVED)
    void createHelpers(ProjectComponent projectComponent) {
        final Project project = projectComponent.getProject();
        typeHelper = SqlTypeMapperHelper.create(project, ClansBanksLogs.TYPE, ClansBanksLogs.class);
        currencyHelper = SqlTypeMapperHelper.create(project, ClansBanksLogs.CURRENCY, ClansBanksLogs.class);
    }
}