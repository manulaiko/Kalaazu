package com.manulaiko.kalaazu.persistence.database.entities.accounts_galaxygates.generated;

import com.manulaiko.kalaazu.persistence.database.entities.accounts_galaxygates.AccountsGalaxygates;
import com.manulaiko.kalaazu.persistence.database.entities.accounts_galaxygates.AccountsGalaxygatesManager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.AbstractManager;
import com.speedment.runtime.field.Field;
import java.util.stream.Stream;

/**
 * The generated base implementation for the manager of every {@link
 * com.manulaiko.kalaazu.persistence.database.entities.accounts_galaxygates.AccountsGalaxygates}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedAccountsGalaxygatesManagerImpl 
extends AbstractManager<AccountsGalaxygates> 
implements GeneratedAccountsGalaxygatesManager {
    
    private final TableIdentifier<AccountsGalaxygates> tableIdentifier;
    
    protected GeneratedAccountsGalaxygatesManagerImpl() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "accounts_galaxygates");
    }
    
    @Override
    public TableIdentifier<AccountsGalaxygates> getTableIdentifier() {
        return tableIdentifier;
    }
    
    @Override
    public Stream<Field<AccountsGalaxygates>> fields() {
        return AccountsGalaxygatesManager.FIELDS.stream();
    }
    
    @Override
    public Stream<Field<AccountsGalaxygates>> primaryKeyFields() {
        return Stream.of(
            AccountsGalaxygates.ID
        );
    }
}