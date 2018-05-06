package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.clans.generated.GeneratedClans;

import java.util.List;
import java.util.Optional;

/**
 * Clans table.
 * ============
 *
 * Contains the clans.
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