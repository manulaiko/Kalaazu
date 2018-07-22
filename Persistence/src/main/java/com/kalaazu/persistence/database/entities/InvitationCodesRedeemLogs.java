package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.invitation_codes_redeem_logs.generated.GeneratedInvitationCodesRedeemLogs;

/**
 * Invitation codes' redeem logs table.
 * ====================================
 *
 * Contains the redeem logs for the invitation codes.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface InvitationCodesRedeemLogs extends GeneratedInvitationCodesRedeemLogs, Entity<Integer> {
    /**
     * Returns the invitation code.
     *
     * @return The invitation code.
     */
    InvitationCodes invitationCode();
}