package com.manulaiko.kalaazu.persistence.database.entities.vouchers.generated;

import com.manulaiko.kalaazu.persistence.database.entities.vouchers.Vouchers;
import com.manulaiko.kalaazu.persistence.database.entities.vouchers.VouchersImpl;
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
 * com.manulaiko.kalaazu.persistence.database.entities.vouchers.Vouchers} entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedVouchersSqlAdapter {
    
    private final TableIdentifier<Vouchers> tableIdentifier;
    
    protected GeneratedVouchersSqlAdapter() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "vouchers");
    }
    
    @ExecuteBefore(RESOLVED)
    void installMethodName(@WithState(RESOLVED) SqlStreamSupplierComponent streamSupplierComponent,
            @WithState(RESOLVED) SqlPersistenceComponent persistenceComponent) {
        streamSupplierComponent.install(tableIdentifier, this::apply);
        persistenceComponent.install(tableIdentifier);
    }
    
    protected Vouchers apply(ResultSet resultSet) throws SpeedmentException {
        final Vouchers entity = createEntity();
        try {
            entity.setId(    resultSet.getInt(1)    );
            entity.setCode(  resultSet.getString(2) );
            entity.setLimit( resultSet.getInt(3)    );
        } catch (final SQLException sqle) {
            throw new SpeedmentException(sqle);
        }
        return entity;
    }
    
    protected VouchersImpl createEntity() {
        return new VouchersImpl();
    }
}