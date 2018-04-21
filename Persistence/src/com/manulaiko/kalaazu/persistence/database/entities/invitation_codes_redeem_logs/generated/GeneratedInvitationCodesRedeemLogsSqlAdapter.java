package com.manulaiko.kalaazu.persistence.database.entities.invitation_codes_redeem_logs.generated;

import com.manulaiko.kalaazu.persistence.database.entities.invitation_codes_redeem_logs.InvitationCodesRedeemLogs;
import com.manulaiko.kalaazu.persistence.database.entities.invitation_codes_redeem_logs.InvitationCodesRedeemLogsImpl;
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
 * com.manulaiko.kalaazu.persistence.database.entities.invitation_codes_redeem_logs.InvitationCodesRedeemLogs}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedInvitationCodesRedeemLogsSqlAdapter {
    
    private final TableIdentifier<InvitationCodesRedeemLogs> tableIdentifier;
    
    protected GeneratedInvitationCodesRedeemLogsSqlAdapter() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "invitation_codes_redeem_logs");
    }
    
    @ExecuteBefore(RESOLVED)
    void installMethodName(@WithState(RESOLVED) SqlStreamSupplierComponent streamSupplierComponent,
            @WithState(RESOLVED) SqlPersistenceComponent persistenceComponent) {
        streamSupplierComponent.install(tableIdentifier, this::apply);
        persistenceComponent.install(tableIdentifier);
    }
    
    protected InvitationCodesRedeemLogs apply(ResultSet resultSet) throws SpeedmentException {
        final InvitationCodesRedeemLogs entity = createEntity();
        try {
            entity.setId(                resultSet.getInt(1)       );
            entity.setInvitationCodesId( resultSet.getInt(2)       );
            entity.setIp(                resultSet.getObject(3)    );
            entity.setDate(              resultSet.getTimestamp(4) );
        } catch (final SQLException sqle) {
            throw new SpeedmentException(sqle);
        }
        return entity;
    }
    
    protected InvitationCodesRedeemLogsImpl createEntity() {
        return new InvitationCodesRedeemLogsImpl();
    }
}