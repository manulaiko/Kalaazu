package com.manulaiko.kalaazu.persistence.database.entities.invitation_codes.generated;

import com.manulaiko.kalaazu.persistence.database.entities.invitation_codes.InvitationCodes;
import com.manulaiko.kalaazu.persistence.database.entities.invitation_codes.InvitationCodesManager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.AbstractManager;
import com.speedment.runtime.field.Field;
import java.util.stream.Stream;

/**
 * The generated base implementation for the manager of every {@link
 * com.manulaiko.kalaazu.persistence.database.entities.invitation_codes.InvitationCodes}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedInvitationCodesManagerImpl 
extends AbstractManager<InvitationCodes> 
implements GeneratedInvitationCodesManager {
    
    private final TableIdentifier<InvitationCodes> tableIdentifier;
    
    protected GeneratedInvitationCodesManagerImpl() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "invitation_codes");
    }
    
    @Override
    public TableIdentifier<InvitationCodes> getTableIdentifier() {
        return tableIdentifier;
    }
    
    @Override
    public Stream<Field<InvitationCodes>> fields() {
        return InvitationCodesManager.FIELDS.stream();
    }
    
    @Override
    public Stream<Field<InvitationCodes>> primaryKeyFields() {
        return Stream.of(
            InvitationCodes.ID
        );
    }
}