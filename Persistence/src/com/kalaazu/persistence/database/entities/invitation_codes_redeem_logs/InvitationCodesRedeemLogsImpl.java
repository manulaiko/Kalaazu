package com.kalaazu.persistence.database.entities.invitation_codes_redeem_logs;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.InvitationCodes;
import com.kalaazu.persistence.database.entities.InvitationCodesRedeemLogs;
import com.kalaazu.persistence.database.entities.invitation_codes_redeem_logs.generated.GeneratedInvitationCodesRedeemLogsImpl;

/**
 * The default implementation of the {@link
 * InvitationCodesRedeemLogs}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class InvitationCodesRedeemLogsImpl
        extends GeneratedInvitationCodesRedeemLogsImpl
        implements InvitationCodesRedeemLogs {
    /**
     * The invitation code.
     */
    private InvitationCodes invitationCode;

    @Override
    public InvitationCodes getInvitationCode() {
        if (this.invitationCode != null) {
            return this.invitationCode;
        }

        this.invitationCode = super.findInvitationCodesId(
                Database.getInstance()
                        .getDb()
                        .manager(InvitationCodes.class)
        );

        return this.invitationCode;
    }
}