package com.manulaiko.kalaazu.persistence.database.entities;

import com.manulaiko.kalaazu.persistence.database.entities.users.generated.GeneratedUsers;

import java.util.List;
import java.util.Optional;

/**
 * The main interface for entities of the {@code users}-table in the database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Users extends GeneratedUsers, Entity<Integer> {
    /**
     * Returns the accounts of this user.
     *
     * @return This user's accounts.
     */
    List<Accounts> getAccounts();

    /**
     * Returns the invitation code associated
     * to this user.
     *
     * @return Invitation code.
     */
    Optional<InvitationCodes> getInvitationCode();

    /**
     * Returns the last used account.
     *
     * @return Last used account.
     */
    Accounts getLastUsedAccount();
}