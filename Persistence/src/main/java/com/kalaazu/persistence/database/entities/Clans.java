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
    Accounts owner();

    /**
     * Returns the faction affiliation of this clan.
     *
     * @return The faction.
     */
    Optional<Factions> faction();

    /**
     * Returns the applications to this clan.
     *
     * @return The applications.
     */
    List<ClansApplications> applications();

    /**
     * Returns the diplomacies of this clan.
     *
     * @return The diplomacies.
     */
    List<ClansDiplomacies> diplomacies();

    /**
     * Returns the banks of this clan.
     *
     * @return The banks.
     */
    List<ClansBanks> banks();

    /**
     * Returns the battlestations owned by this clan.
     *
     * @return Clan's battlestations.
     */
    List<ClansBattlestations> battlestations();
}