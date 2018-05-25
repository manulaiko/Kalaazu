package com.kalaazu.persistence.database.entities.clans_applications.generated;

import com.kalaazu.persistence.database.entities.ClansApplications;
import com.kalaazu.persistence.database.entities.clans_applications.ClansApplicationsImpl;
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
 * ClansApplications}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedClansApplicationsSqlAdapter {

    private final TableIdentifier<ClansApplications> tableIdentifier;

    protected GeneratedClansApplicationsSqlAdapter() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "clans_applications");
    }

    @ExecuteBefore(RESOLVED)
    void installMethodName(
            @WithState(RESOLVED) SqlStreamSupplierComponent streamSupplierComponent,
            @WithState(RESOLVED) SqlPersistenceComponent persistenceComponent
    ) {
        streamSupplierComponent.install(tableIdentifier, this::apply);
        persistenceComponent.install(tableIdentifier);
    }

    protected ClansApplications apply(ResultSet resultSet) throws SpeedmentException {
        final ClansApplications entity = createEntity();
        try {
            entity.setId(resultSet.getInt(1));
            entity.setClansId(resultSet.getInt(2));
            entity.setAccountsId(resultSet.getInt(3));
            entity.setDate(resultSet.getTimestamp(4));
            entity.setText(resultSet.getString(5));
        } catch (final SQLException sqle) {
            throw new SpeedmentException(sqle);
        }
        return entity;
    }

    protected ClansApplicationsImpl createEntity() {
        return new ClansApplicationsImpl();
    }
}