package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.clans_applications.generated.GeneratedClansApplications;

/**
 * The main interface for entities of the {@code clans_applications}-table in
 * the database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface ClansApplications extends GeneratedClansApplications, Entity<Integer> {
    /**
     * Returns the clan.
     *
     * @return The clan.
     */
    Clans getClan();

    /**
     * Returns the account.
     *
     * @return The account.
     */
    Accounts getAccount();
}