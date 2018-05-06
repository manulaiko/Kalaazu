package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.clans.generated.GeneratedClans;

import java.util.List;
import java.util.Optional;

/**
 * The main interface for entities of the {@code clans}-table in the database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Clans extends GeneratedClans, Entity<Integer> {
    /**
     * Returns the clan leader.
     *
     * @return Clan owner.
     */
    Accounts getOwner();

    /**
     * Returns the faction affiliation of this clan.
     *
     * @return The faction.
     */
    Optional<Factions> getFaction();

    /**
     * Returns the applications to this clan.
     *
     * @return The applications.
     */
    List<ClansApplications> getApplications();

    /**
     * Returns the diplomacies of this clan.
     *
     * @return The diplomacies.
     */
    List<ClansDiplomacies> getDiplomacies();

    /**
     * Returns the banks of this clan.
     *
     * @return The banks.
     */
    List<ClansBanks> getBanks();

    /**
     * Returns the battlestations owned by this clan.
     *
     * @return Clan's battlestations.
     */
    List<ClansBattlestations> getBattlestations();
}