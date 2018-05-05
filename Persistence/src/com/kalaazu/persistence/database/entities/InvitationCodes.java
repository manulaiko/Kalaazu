package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.invitation_codes.generated.GeneratedInvitationCodes;

import java.util.List;

/**
 * The main interface for entities of the {@code invitation_codes}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
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