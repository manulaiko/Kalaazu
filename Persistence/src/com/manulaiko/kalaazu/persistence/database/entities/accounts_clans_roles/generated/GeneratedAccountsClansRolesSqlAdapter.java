package com.manulaiko.kalaazu.persistence.database.entities.accounts_clans_roles.generated;

import com.manulaiko.kalaazu.persistence.database.entities.accounts_clans_roles.AccountsClansRoles;
import com.manulaiko.kalaazu.persistence.database.entities.accounts_clans_roles.AccountsClansRolesImpl;
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
 * com.manulaiko.kalaazu.persistence.database.entities.accounts_clans_roles.AccountsClansRoles}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedAccountsClansRolesSqlAdapter {
    
    private final TableIdentifier<AccountsClansRoles> tableIdentifier;
    
    protected GeneratedAccountsClansRolesSqlAdapter() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "accounts_clans_roles");
    }
    
    @ExecuteBefore(RESOLVED)
    void installMethodName(@WithState(RESOLVED) SqlStreamSupplierComponent streamSupplierComponent,
            @WithState(RESOLVED) SqlPersistenceComponent persistenceComponent) {
        streamSupplierComponent.install(tableIdentifier, this::apply);
        persistenceComponent.install(tableIdentifier);
    }
    
    protected AccountsClansRoles apply(ResultSet resultSet) throws SpeedmentException {
        final AccountsClansRoles entity = createEntity();
        try {
            entity.setId(           resultSet.getInt(1) );
            entity.setAccountsId(   resultSet.getInt(2) );
            entity.setClansRolesId( resultSet.getInt(3) );
        } catch (final SQLException sqle) {
            throw new SpeedmentException(sqle);
        }
        return entity;
    }
    
    protected AccountsClansRolesImpl createEntity() {
        return new AccountsClansRolesImpl();
    }
}