package com.kalaazu.persistence.database.entities.accounts;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.*;
import com.kalaazu.persistence.database.entities.accounts.generated.GeneratedAccountsImpl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * The default implementation of the {@link
 * Accounts}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class AccountsImpl
        extends GeneratedAccountsImpl
        implements Accounts {
    /**
     * The user.
     */
    private Users user;

    /**
     * The level.
     */
    private Levels level;

    /**
     * The faction.
     */
    private Optional<Factions> faction;

    /**
     * The active hangar.
     */
    private Optional<AccountsHangars> hangar;

    /**
     * The clan.
     */
    private Optional<Clans> clan;

    /**
     * The rank.
     */
    private Ranks rank;

    /**
     * The clan roles.
     */
    private List<ClansRoles> clanRoles;

    /**
     * The destroy logs.
     */
    private List<AccountsDestroys> destroys;

    /**
     * The drones.
     */
    private List<AccountsDrones> drones;

    /**
     * The galaxygates.
     */
    private List<AccountsGalaxygates> galaxygates;

    /**
     * The hangars.
     */
    private List<AccountsHangars> hangars;

    /**
     * The history logs.
     */
    private List<AccountsHistory> histories;

    /**
     * The items.
     */
    private List<AccountsItems> items;

    /**
     * The messages.
     */
    private List<AccountsMessages> messages;

    /**
     * The pet.
     */
    private Optional<AccountsPets> pet;

    /**
     * The active quests.
     */
    private List<AccountsQuests> quest;

    /**
     * The ranking
     */
    private AccountsRankings ranking;

    /**
     * The ships.
     */
    private List<AccountsShips> ships;

    /**
     * The skills.
     */
    private List<AccountsSkills> skills;

    /**
     * The skylabs.
     */
    private List<AccountsSkylabs> skylabs;

    /**
     * The techfactories.
     */
    private List<AccountsTechfactories> techfactories;

    /**
     * The techfactories items.
     */
    private List<AccountsTechfactoryItems> techfactoryItems;

    /**
     * The clan applications.
     */
    private List<ClansApplications> clanApplications;

    /**
     * The clan messages.
     */
    private List<ClansMessages> clanMessages;

    @Override
    public Users getUser() {
        if (this.user != null) {
            return this.user;
        }

        this.user = super.findUsersId(
                Database.getInstance()
                        .getDb()
                        .manager(Users.class)
        );

        return this.user;
    }

    @Override
    public Levels getLevel() {
        if (this.level != null) {
            return this.level;
        }

        this.level = super.findLevelsId(
                Database.getInstance()
                        .getDb()
                        .manager(Levels.class)
        );

        return this.level;
    }

    @Override
    public Optional<Factions> getFaction() {
        if (this.faction != null) {
            return this.faction;
        }

        this.faction = super.findFactionsId(
                Database.getInstance()
                        .getDb()
                        .manager(Factions.class)
        );

        return this.faction;
    }

    @Override
    public Optional<AccountsHangars> getHangar() {
        if (this.hangar != null) {
            return this.hangar;
        }

        this.hangar = super.findAccountsHangarsId(
                Database.getInstance()
                        .getDb()
                        .manager(AccountsHangars.class)
        );

        return this.hangar;
    }

    @Override
    public Optional<Clans> getClan() {
        if (this.clan != null) {
            return this.clan;
        }

        this.clan = super.findClansId(
                Database.getInstance()
                        .getDb()
                        .manager(Clans.class)
        );

        return this.clan;
    }

    @Override
    public Ranks getRank() {
        if (this.rank != null) {
            return this.rank;
        }

        this.rank = super.findRanksId(
                Database.getInstance()
                        .getDb()
                        .manager(Ranks.class)
        );

        return this.rank;
    }

    @Override
    public List<ClansRoles> getClanRoles() {
        if (this.clanRoles != null) {
            return this.clanRoles;
        }

        this.clanRoles = Database.getInstance()
                                 .all(AccountsClansRoles.class)
                                 .filter(AccountsClansRoles.ACCOUNTS_ID.equal(super.getId()))
                                 .map(AccountsClansRoles::getRole)
                                 .collect(Collectors.toList());

        return this.clanRoles;
    }

    @Override
    public List<AccountsDestroys> getDestroys() {
        if (this.destroys != null) {
            return this.destroys;
        }

        this.destroys = Database.getInstance()
                                .all(AccountsDestroys.class)
                                .filter(AccountsDestroys.ACCOUNTS_ID.equal(super.getId()))
                                .collect(Collectors.toList());

        return this.destroys;
    }

    @Override
    public List<AccountsDrones> getDrones() {
        if (this.drones != null) {
            return this.drones;
        }

        this.drones = Database.getInstance()
                              .all(AccountsDrones.class)
                              .filter(AccountsDrones.ACCOUNTS_ID.equal(super.getId()))
                              .collect(Collectors.toList());

        return this.drones;
    }

    @Override
    public List<AccountsGalaxygates> getGalaxygates() {
        if (this.galaxygates != null) {
            return this.galaxygates;
        }

        this.galaxygates = Database.getInstance()
                                   .all(AccountsGalaxygates.class)
                                   .filter(AccountsGalaxygates.ACCOUNTS_ID.equal(super.getId()))
                                   .collect(Collectors.toList());

        return this.galaxygates;
    }

    @Override
    public List<AccountsHangars> getHangars() {
        if (this.hangars != null) {
            return this.hangars;
        }

        this.hangars = Database.getInstance()
                               .all(AccountsHangars.class)
                               .filter(AccountsHangars.ACCOUNTS_ID.equal(super.getId()))
                               .collect(Collectors.toList());

        return this.hangars;
    }

    @Override
    public List<AccountsHistory> getHistories() {
        if (this.histories != null) {
            return this.histories;
        }

        this.histories = Database.getInstance()
                                 .all(AccountsHistory.class)
                                 .filter(AccountsHistory.ACCOUNTS_ID.equal(super.getId()))
                                 .collect(Collectors.toList());

        return this.histories;
    }

    @Override
    public List<AccountsItems> getItems() {
        if (this.items != null) {
            return this.items;
        }

        this.items = Database.getInstance()
                             .all(AccountsItems.class)
                             .filter(AccountsItems.ACCOUNTS_ID.equal(super.getId()))
                             .collect(Collectors.toList());

        return this.items;
    }

    @Override
    public List<AccountsMessages> getMessages() {
        if (this.messages != null) {
            return this.messages;
        }

        this.messages = Database.getInstance()
                                .all(AccountsMessages.class)
                                .filter(AccountsMessages.FROM_ACCOUNTS_ID.equal(super.getId())
                                                                         .or(AccountsMessages.TO_ACCOUNTS_ID.equal(
                                                                                 super.getId())))
                                .collect(Collectors.toList());

        return this.messages;
    }

    @Override
    public Optional<AccountsPets> getPet() {
        if (this.pet != null) {
            return this.pet;
        }

        this.pet = Database.getInstance()
                           .all(AccountsPets.class)
                           .filter(AccountsPets.ACCOUNTS_ID.equal(super.getId()))
                           .findAny();

        return this.pet;
    }

    @Override
    public List<AccountsQuests> getQuest() {
        if (this.quest != null) {
            return this.quest;
        }

        this.quest = Database.getInstance()
                             .all(AccountsQuests.class)
                             .filter(AccountsQuests.ACCOUNTS_ID.equal(super.getId()))
                             .collect(Collectors.toList());

        return this.quest;
    }

    @Override
    public AccountsRankings getRanking() {
        if (this.ranking != null) {
            return this.ranking;
        }

        this.ranking = Database.getInstance()
                               .all(AccountsRankings.class)
                               .filter(AccountsRankings.ACCOUNTS_ID.equal(super.getId()))
                               .findFirst()
                               .orElse(null);

        return this.ranking;
    }

    @Override
    public List<AccountsShips> getShips() {
        if (this.ships != null) {
            return this.ships;
        }

        this.ships = Database.getInstance()
                             .all(AccountsShips.class)
                             .filter(AccountsShips.ACCOUNTS_ID.equal(super.getId()))
                             .collect(Collectors.toList());

        return this.ships;
    }

    @Override
    public List<AccountsSkills> getSkills() {
        if (this.skills != null) {
            return this.skills;
        }

        this.skills = Database.getInstance()
                              .all(AccountsSkills.class)
                              .filter(AccountsSkills.ACCOUNTS_ID.equal(super.getId()))
                              .collect(Collectors.toList());

        return this.skills;
    }

    @Override
    public List<AccountsSkylabs> getSkylabs() {
        if (this.skylabs != null) {
            return this.skylabs;
        }

        this.skylabs = Database.getInstance()
                               .all(AccountsSkylabs.class)
                               .filter(AccountsSkylabs.ACCOUNTS_ID.equal(super.getId()))
                               .collect(Collectors.toList());

        return this.skylabs;
    }

    @Override
    public List<AccountsTechfactories> getTechfactories() {
        if (this.techfactories != null) {
            return this.techfactories;
        }

        this.techfactories = Database.getInstance()
                                     .all(AccountsTechfactories.class)
                                     .filter(AccountsTechfactories.ACCOUNTS_ID.equal(super.getId()))
                                     .collect(Collectors.toList());

        return this.techfactories;
    }

    @Override
    public List<AccountsTechfactoryItems> getTechfactoryItems() {
        if (this.techfactoryItems != null) {
            return this.techfactoryItems;
        }

        this.techfactoryItems = Database.getInstance()
                                        .all(AccountsTechfactoryItems.class)
                                        .filter(AccountsTechfactoryItems.ACCOUNTS_ID.equal(super.getId()))
                                        .collect(Collectors.toList());

        return this.techfactoryItems;
    }

    @Override
    public List<ClansApplications> getClanApplications() {
        if (this.clanApplications != null) {
            return this.clanApplications;
        }

        this.clanApplications = Database.getInstance()
                                        .all(ClansApplications.class)
                                        .filter(ClansApplications.ACCOUNTS_ID.equal(super.getId()))
                                        .collect(Collectors.toList());

        return this.clanApplications;
    }

    @Override
    public List<ClansMessages> getClanMessages() {
        if (this.clanMessages != null) {
            return this.clanMessages;
        }

        // If author
        var where = ClansMessages.FROM_ACCOUNTS_ID.equal(super.getId());

        // If destination
        where = where.or(ClansMessages.TO_ACCOUNTS_ID.equal(super.getId()));

        // If destination == null and clan_id == this.clan_id
        where = where.or(
                ClansMessages.TO_ACCOUNTS_ID.isNull()
                                            .and(ClansMessages.CLANS_ID.equal(
                                                    super.getClansId()
                                                         .orElse(0)))
        ); // ayy

        this.clanMessages = Database.getInstance()
                                    .all(ClansMessages.class)
                                    .filter(where)
                                    .collect(Collectors.toList());

        return this.clanMessages;
    }
}