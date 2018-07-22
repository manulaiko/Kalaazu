package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts.generated.GeneratedAccounts;

import java.util.List;
import java.util.Optional;

/**
 * Accounts table.
 * ===============
 *
 * Contains the game progress of a user's account.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Accounts extends GeneratedAccounts, Entity<Integer> {
    /**
     * Returns the user.
     *
     * @return The user.
     */
    Users user();

    /**
     * Returns the level.
     *
     * @return The level.
     */
    Levels level();

    /**
     * Returns the faction.
     *
     * @return The faction.
     */
    Optional<Factions> faction();

    /**
     * Returns the active hangar.
     *
     * @return The active hangar.
     */
    Optional<AccountsHangars> hangar();

    /**
     * Returns the clan.
     *
     * @return The clan.
     */
    Optional<Clans> clan();

    /**
     * Returns the rank.
     *
     * @return The rank.
     */
    Ranks rank();

    /**
     * Returns the clan roles.
     *
     * @return The clan roles.
     */
    List<ClansRoles> clanRoles();

    /**
     * Returns the destroys.
     *
     * @return The destroys.
     */
    List<AccountsDestroys> destroys();

    /**
     * Returns the drones.
     *
     * @return The drones.
     */
    List<AccountsDrones> drones();

    /**
     * Returns the galaxygates.
     *
     * @return The galaxygates.
     */
    List<AccountsGalaxygates> galaxygates();

    /**
     * Returns the hangars.
     *
     * @return The hangars.
     */
    List<AccountsHangars> hangars();

    /**
     * Returns the histories.
     *
     * @return The histories.
     */
    List<AccountsHistory> histories();

    /**
     * Returns the items.
     *
     * @return The items.
     */
    List<AccountsItems> items();

    /**
     * Returns the messages.
     *
     * @return The messages.
     */
    List<AccountsMessages> messages();

    /**
     * Returns the pet.
     *
     * @return The pet.
     */
    Optional<AccountsPets> pet();

    /**
     * Returns the quests.
     *
     * @return The quests.
     */
    List<AccountsQuests> quests();

    /**
     * Returns the ranking.
     *
     * @return The ranking.
     */
    AccountsRankings ranking();

    /**
     *
     * Returns the ships.
     *
     * @return The ships.
     */
    List<AccountsShips> ships();

    /**
     * Returns the skills.
     *
     * @return The skills.
     */
    List<AccountsSkills> skills();

    /**
     * Returns the skylabs.
     *
     * @return The skylabs.
     */
    List<AccountsSkylabs> skylabs();

    /**
     * Returns the techfactories.
     *
     * @return The techfactories.
     */
    List<AccountsTechfactories> techfactories();

    /**
     * Returns the techfactory items.
     *
     * @return The techfactory items.
     */
    List<AccountsTechfactoryItems> techfactoryItems();

    /**
     * Returns the clan applications.
     *
     * @return The clan applications.
     */
    List<ClansApplications> clanApplications();

    /**
     * Returns the clan messages.
     *
     * @return The clan messages.
     */
    List<ClansMessages> clanMessages();
}