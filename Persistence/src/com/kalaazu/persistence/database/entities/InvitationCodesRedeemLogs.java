package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.invitation_codes_redeem_logs.generated.GeneratedInvitationCodesRedeemLogs;

/**
 * The main interface for entities of the {@code
 * invitation_codes_redeem_logs}-table in the database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface InvitationCodesRedeemLogs extends GeneratedInvitationCodesRedeemLogs, Entity<Integer> {
    /**
     * Returns the invitation code.
     *
     * @return The invitation code.
     */
    InvitationCodes getInvitationCode();
}