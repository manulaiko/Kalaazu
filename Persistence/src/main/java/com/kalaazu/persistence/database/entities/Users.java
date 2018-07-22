package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.users.generated.GeneratedUsers;

import java.util.List;
import java.util.Optional;

/**
 * Users table.
 * ============
 *
 * Contains the login information of all the users.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Users extends GeneratedUsers, Entity<Integer> {
    /**
     * Returns the accounts of this user.
     *
     * @return This user's accounts.
     */
    List<Accounts> account();

    /**
     * Returns the invitation code associated
     * to this user.
     *
     * @return Invitation code.
     */
    Optional<InvitationCodes> invitationCode();

    /**
     * Returns the last used account.
     *
     * @return Last used account.
     */
    Accounts lastUsedAccount();
}