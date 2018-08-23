package com.kalaazu.persistence.database.entities.invitation_codes;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.InvitationCodes;
import com.kalaazu.persistence.database.entities.InvitationCodesRedeemLogs;
import com.kalaazu.persistence.database.entities.invitation_codes.generated.GeneratedInvitationCodesImpl;

import java.util.List;
import java.util.stream.Collectors;

/**
 * The default implementation of the {@link
 * InvitationCodes}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class InvitationCodesImpl
        extends GeneratedInvitationCodesImpl
        implements InvitationCodes {
    /**
     * Redeem logs.
     */
    private List<InvitationCodesRedeemLogs> logs;

    @Override
    public List<InvitationCodesRedeemLogs> logs() {
        if (this.logs != null) {
            return this.logs;
        }

        this.logs = Database.getInstance()
                            .all(InvitationCodesRedeemLogs.class)
                            .filter(InvitationCodesRedeemLogs.INVITATION_CODES_ID.equal(super.id()))
                            .collect(Collectors.toList());

        return this.logs;
    }
}