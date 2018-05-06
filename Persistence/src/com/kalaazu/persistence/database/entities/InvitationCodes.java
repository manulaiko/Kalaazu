package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.invitation_codes.generated.GeneratedInvitationCodes;

import java.util.List;

/**
 * Invitation codes table.
 * =======================
 *
 * Contains the invitation codes required to register.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface InvitationCodes extends GeneratedInvitationCodes, Entity<Short> {
    /**
     * Returns the redeem logs.
     *
     * @return Redeem logs.
     */
    List<InvitationCodesRedeemLogs> getLogs();
}