package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.clans_applications.generated.GeneratedClansApplications;

/**
 * Clans' applications table.
 * ==========================
 *
 * Contains all the applications to the clans.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface ClansApplications extends GeneratedClansApplications, Entity<Integer> {
    /**
     * Returns the clan.
     *
     * @return The clan.
     */
    Clans clan();

    /**
     * Returns the account.
     *
     * @return The account.
     */
    Accounts account();
}