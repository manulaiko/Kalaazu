package com.manulaiko.kalaazu.persistence.database.entities.accounts_history.generated;

import com.manulaiko.kalaazu.persistence.database.entities.accounts_history.AccountsHistory;
import com.manulaiko.kalaazu.persistence.database.entities.accounts_history.AccountsHistoryManager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.AbstractManager;
import com.speedment.runtime.field.Field;
import java.util.stream.Stream;

/**
 * The generated base implementation for the manager of every {@link
 * com.manulaiko.kalaazu.persistence.database.entities.accounts_history.AccountsHistory}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedAccountsHistoryManagerImpl 
extends AbstractManager<AccountsHistory> 
implements GeneratedAccountsHistoryManager {
    
    private final TableIdentifier<AccountsHistory> tableIdentifier;
    
    protected GeneratedAccountsHistoryManagerImpl() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "accounts_history");
    }
    
    @Override
    public TableIdentifier<AccountsHistory> getTableIdentifier() {
        return tableIdentifier;
    }
    
    @Override
    public Stream<Field<AccountsHistory>> fields() {
        return AccountsHistoryManager.FIELDS.stream();
    }
    
    @Override
    public Stream<Field<AccountsHistory>> primaryKeyFields() {
        return Stream.of(
            AccountsHistory.ID
        );
    }
}