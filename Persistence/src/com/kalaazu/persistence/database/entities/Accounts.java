package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts.generated.GeneratedAccounts;

import java.util.List;
import java.util.Optional;

/**
 * The main interface for entities of the {@code accounts}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Accounts extends GeneratedAccounts, Entity<Integer> {
    /**
     * Returns the user.
     *
     * @return The user.
     */
    Users getUser();

    /**
     * Returns the level.
     *
     * @return The level.
     */
    Levels getLevel();

    /**
     * Returns the faction.
     *
     * @return The faction.
     */
    Optional<Factions> getFaction();

    /**
     * Returns the active hangar.
     *
     * @return The active hangar.
     */
    Optional<AccountsHangars> getHangar();

    /**
     * Returns the clan.
     *
     * @return The clan.
     */
    Optional<Clans> getClan();

    /**
     * Returns the rank.
     *
     * @return The rank.
     */
    Ranks getRank();

    /**
     * Returns the clan roles.
     *
     * @return The clan roles.
     */
    List<ClansRoles> getClanRoles();

    /**
     * Returns the destroys.
     *
     * @return The destroys.
     */
    List<AccountsDestroys> getDestroys();

    /**
     * Returns the drones.
     *
     * @return The drones.
     */
    List<AccountsDrones> getDrones();

    /**
     * Returns the galaxygates.
     *
     * @return The galaxygates.
     */
    List<AccountsGalaxygates> getGalaxygates();

    /**
     * Returns the hangars.
     *
     * @return The hangars.
     */
    List<AccountsHangars> getHangars();

    /**
     * Returns the histories.
     *
     * @return The histories.
     */
    List<AccountsHistory> getHistories();

    /**
     * Returns the items.
     *
     * @return The items.
     */
    List<AccountsItems> getItems();

    /**
     * Returns the messages.
     *
     * @return The messages.
     */
    List<AccountsMessages> getMessages();

    /**
     * Returns the pet.
     *
     * @return The pet.
     */
    Optional<AccountsPets> getPet();

    /**
     * Returns the quests.
     *
     * @return The quests.
     */
    List<AccountsQuests> getQuest();

    /**
     * Returns the ranking.
     *
     * @return The ranking.
     */
    AccountsRankings getRanking();

    /**
     * Returns the ships.
     *
     * @return The ships.
     */
    List<AccountsShips> getShips();

    /**
     * Returns the skills.
     *
     * @return The skills.
     */
    List<AccountsSkills> getSkills();

    /**
     * Returns the skylabs.
     *
     * @return The skylabs.
     */
    List<AccountsSkylabs> getSkylabs();

    /**
     * Returns the techfactories.
     *
     * @return The techfactories.
     */
    List<AccountsTechfactories> getTechfactories();

    /**
     * Returns the techfactory items.
     *
     * @return The techfactory items.
     */
    List<AccountsTechfactoryItems> getTechfactoryItems();

    /**
     * Returns the clan applications.
     *
     * @return The clan applications.
     */
    List<ClansApplications> getClanApplications();

    /**
     * Returns the clan messages.
     *
     * @return The clan messages.
     */
    List<ClansMessages> getClanMessages();
}