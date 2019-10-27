/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database;


import com.kalaazu.persistence.database.tables.*;

import javax.annotation.processing.Generated;


/**
 * Convenience access to all tables in kalaazu
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class Tables {

    /**
     * In game accounts.
     */
    public static final Accounts ACCOUNTS = Accounts.ACCOUNTS;

    /**
     * Account's internal bank.
     */
    public static final AccountsBanks ACCOUNTS_BANKS = AccountsBanks.ACCOUNTS_BANKS;

    /**
     * Logs from account's bank
     */
    public static final AccountsBanksLogs ACCOUNTS_BANKS_LOGS = AccountsBanksLogs.ACCOUNTS_BANKS_LOGS;

    /**
     * Many to many relation table.
     */
    public static final AccountsClansRoles ACCOUNTS_CLANS_ROLES = AccountsClansRoles.ACCOUNTS_CLANS_ROLES;

    /**
     * Configurations of the accounts.
     */
    public static final AccountsConfigurations ACCOUNTS_CONFIGURATIONS = AccountsConfigurations.ACCOUNTS_CONFIGURATIONS;

    /**
     * Items of the configuration.
     */
    public static final AccountsConfigurationsAccountsItems ACCOUNTS_CONFIGURATIONS_ACCOUNTS_ITEMS = AccountsConfigurationsAccountsItems.ACCOUNTS_CONFIGURATIONS_ACCOUNTS_ITEMS;

    /**
     * Account's destroy history.
     */
    public static final AccountsDestroys ACCOUNTS_DESTROYS = AccountsDestroys.ACCOUNTS_DESTROYS;

    /**
     * Account's drones.
     */
    public static final AccountsDrones ACCOUNTS_DRONES = AccountsDrones.ACCOUNTS_DRONES;

    /**
     * Account's build galaxygates.
     */
    public static final AccountsGalaxygates ACCOUNTS_GALAXYGATES = AccountsGalaxygates.ACCOUNTS_GALAXYGATES;

    /**
     * Hangars bough by an account.
     */
    public static final AccountsHangars ACCOUNTS_HANGARS = AccountsHangars.ACCOUNTS_HANGARS;

    /**
     * Account's history events.
     */
    public static final AccountsHistory ACCOUNTS_HISTORY = AccountsHistory.ACCOUNTS_HISTORY;

    /**
     * Items bough by an account.
     */
    public static final AccountsItems ACCOUNTS_ITEMS = AccountsItems.ACCOUNTS_ITEMS;

    /**
     * Messaging system.
     */
    public static final AccountsMessages ACCOUNTS_MESSAGES = AccountsMessages.ACCOUNTS_MESSAGES;

    /**
     * Account's PETs.
     */
    public static final AccountsPets ACCOUNTS_PETS = AccountsPets.ACCOUNTS_PETS;

    /**
     * Quest status of the account.
     */
    public static final AccountsQuests ACCOUNTS_QUESTS = AccountsQuests.ACCOUNTS_QUESTS;

    /**
     * Account ranking.
     */
    public static final AccountsRankings ACCOUNTS_RANKINGS = AccountsRankings.ACCOUNTS_RANKINGS;

    /**
     * Ships bough by an account.
     */
    public static final AccountsShips ACCOUNTS_SHIPS = AccountsShips.ACCOUNTS_SHIPS;

    /**
     * Skilltree for the account.
     */
    public static final AccountsSkills ACCOUNTS_SKILLS = AccountsSkills.ACCOUNTS_SKILLS;

    /**
     * Skylab for the accounts.
     */
    public static final AccountsSkylabs ACCOUNTS_SKYLABS = AccountsSkylabs.ACCOUNTS_SKYLABS;

    /**
     * Nanotech factory items.
     */
    public static final AccountsTechfactories ACCOUNTS_TECHFACTORIES = AccountsTechfactories.ACCOUNTS_TECHFACTORIES;

    /**
     * Techfactory items from account.
     */
    public static final AccountsTechfactoryItems ACCOUNTS_TECHFACTORY_ITEMS = AccountsTechfactoryItems.ACCOUNTS_TECHFACTORY_ITEMS;

    /**
     * Server clans.
     */
    public static final Clans CLANS = Clans.CLANS;

    /**
     * Account applications to a clan.
     */
    public static final ClansApplications CLANS_APPLICATIONS = ClansApplications.CLANS_APPLICATIONS;

    /**
     * Clan's internal bank.
     */
    public static final ClansBanks CLANS_BANKS = ClansBanks.CLANS_BANKS;

    /**
     * Logs from clan's bank.
     */
    public static final ClansBanksLogs CLANS_BANKS_LOGS = ClansBanksLogs.CLANS_BANKS_LOGS;

    /**
     * Clan CBS.
     */
    public static final ClansBattlestations CLANS_BATTLESTATIONS = ClansBattlestations.CLANS_BATTLESTATIONS;

    /**
     * Items equipped in the CBS.
     */
    public static final ClansBattlestationsItems CLANS_BATTLESTATIONS_ITEMS = ClansBattlestationsItems.CLANS_BATTLESTATIONS_ITEMS;

    /**
     * Logs from clan's battlestations.
     */
    public static final ClansBattlestationsLogs CLANS_BATTLESTATIONS_LOGS = ClansBattlestationsLogs.CLANS_BATTLESTATIONS_LOGS;

    /**
     * Diplomacy table for clans.
     */
    public static final ClansDiplomacies CLANS_DIPLOMACIES = ClansDiplomacies.CLANS_DIPLOMACIES;

    /**
     * Messages in the clan.
     */
    public static final ClansMessages CLANS_MESSAGES = ClansMessages.CLANS_MESSAGES;

    /**
     * News of the clan.
     */
    public static final ClansNews CLANS_NEWS = ClansNews.CLANS_NEWS;

    /**
     * Clan ranking.
     */
    public static final ClansRanking CLANS_RANKING = ClansRanking.CLANS_RANKING;

    /**
     * Clan's roles.
     */
    public static final ClansRoles CLANS_ROLES = ClansRoles.CLANS_ROLES;

    /**
     * Clan roles' permissions
     */
    public static final ClansRolesPermissions CLANS_ROLES_PERMISSIONS = ClansRolesPermissions.CLANS_ROLES_PERMISSIONS;

    /**
     * Map collectables.
     */
    public static final Collectables COLLECTABLES = Collectables.COLLECTABLES;

    /**
     * Contains server's events.
     */
    public static final Events EVENTS = Events.EVENTS;

    /**
     * Contains server's factions.
     */
    public static final Factions FACTIONS = Factions.FACTIONS;

    /**
     * Galaxy gates from the server.
     */
    public static final Galaxygates GALAXYGATES = Galaxygates.GALAXYGATES;

    /**
     * Many to many relations for galaxygates and galaxygates_spins.
     */
    public static final GalaxygatesGgSpins GALAXYGATES_GG_SPINS = GalaxygatesGgSpins.GALAXYGATES_GG_SPINS;

    /**
     * Many to many relations for galaxygates and galaxygates_waves.
     */
    public static final GalaxygatesGgWaves GALAXYGATES_GG_WAVES = GalaxygatesGgWaves.GALAXYGATES_GG_WAVES;

    /**
     * Spin probabilities for the galaxy gates.
     */
    public static final GalaxygatesProbabilities GALAXYGATES_PROBABILITIES = GalaxygatesProbabilities.GALAXYGATES_PROBABILITIES;

    /**
     * Stage spawn for each stage.
     */
    public static final GalaxygatesSpawns GALAXYGATES_SPAWNS = GalaxygatesSpawns.GALAXYGATES_SPAWNS;

    /**
     * Spins from the galaxy gate.
     */
    public static final GalaxygatesSpins GALAXYGATES_SPINS = GalaxygatesSpins.GALAXYGATES_SPINS;

    /**
     * Spawn stage for each wave.
     */
    public static final GalaxygatesStages GALAXYGATES_STAGES = GalaxygatesStages.GALAXYGATES_STAGES;

    /**
     * Many to many relations for galaxygates_stages and galaxygates_spawns.
     */
    public static final GalaxygatesStagesSpawns GALAXYGATES_STAGES_SPAWNS = GalaxygatesStagesSpawns.GALAXYGATES_STAGES_SPAWNS;

    /**
     * Waves of the galaxy gate.
     */
    public static final GalaxygatesWaves GALAXYGATES_WAVES = GalaxygatesWaves.GALAXYGATES_WAVES;

    /**
     * Contains the invitation codes that can be used for registering.
     */
    public static final InvitationCodes INVITATION_CODES = InvitationCodes.INVITATION_CODES;

    /**
     * Contains the redeem logs for the invitation codes.
     */
    public static final InvitationCodesRedeemLogs INVITATION_CODES_REDEEM_LOGS = InvitationCodesRedeemLogs.INVITATION_CODES_REDEEM_LOGS;

    /**
     * Contains server's items.
     */
    public static final Items ITEMS = Items.ITEMS;

    /**
     * Contains simple Key -&gt; Value entries.
     */
    public static final KeyValue KEY_VALUE = KeyValue.KEY_VALUE;

    /**
     * Contains server's levels.
     */
    public static final Levels LEVELS = Levels.LEVELS;

    /**
     * Contains the upgrade costs for each level.
     */
    public static final LevelsUpgrades LEVELS_UPGRADES = LevelsUpgrades.LEVELS_UPGRADES;

    /**
     * In game maps.
     */
    public static final Maps MAPS = Maps.MAPS;

    /**
     * Many to many relation table.
     */
    public static final MapsNpcs MAPS_NPCS = MapsNpcs.MAPS_NPCS;

    /**
     * Portals on map.
     */
    public static final MapsPortals MAPS_PORTALS = MapsPortals.MAPS_PORTALS;

    /**
     * Stations on map.
     */
    public static final MapsStations MAPS_STATIONS = MapsStations.MAPS_STATIONS;

    /**
     * Server moderators.
     */
    public static final Moderators MODERATORS = Moderators.MODERATORS;

    /**
     * Logged events made by moderators.
     */
    public static final ModeratorsLogs MODERATORS_LOGS = ModeratorsLogs.MODERATORS_LOGS;

    /**
     * Moderator's roles.
     */
    public static final ModeratorsRoles MODERATORS_ROLES = ModeratorsRoles.MODERATORS_ROLES;

    /**
     * Moderator roles' permissions
     */
    public static final ModeratorsRolesPermissions MODERATORS_ROLES_PERMISSIONS = ModeratorsRolesPermissions.MODERATORS_ROLES_PERMISSIONS;

    /**
     * Server news.
     */
    public static final News NEWS = News.NEWS;

    /**
     * Server NPCS.
     */
    public static final Npcs NPCS = Npcs.NPCS;

    /**
     * Server permissions.
     */
    public static final Permissions PERMISSIONS = Permissions.PERMISSIONS;

    /**
     * In game quests.
     */
    public static final Quests QUESTS = Quests.QUESTS;

    /**
     * Quest's conditions.
     */
    public static final QuestsConditions QUESTS_CONDITIONS = QuestsConditions.QUESTS_CONDITIONS;

    /**
     * Contains the rank system.
     */
    public static final Ranks RANKS = Ranks.RANKS;

    /**
     * All rewards available so there's no need of JSON.
     */
    public static final Rewards REWARDS = Rewards.REWARDS;

    /**
     * Many to many relations.
     */
    public static final RewardsCollectables REWARDS_COLLECTABLES = RewardsCollectables.REWARDS_COLLECTABLES;

    /**
     * Many to many relations.
     */
    public static final RewardsGalaxygates REWARDS_GALAXYGATES = RewardsGalaxygates.REWARDS_GALAXYGATES;

    /**
     * Many to many relations.
     */
    public static final RewardsNpcs REWARDS_NPCS = RewardsNpcs.REWARDS_NPCS;

    /**
     * Many to many relations.
     */
    public static final RewardsQuests REWARDS_QUESTS = RewardsQuests.REWARDS_QUESTS;

    /**
     * Many to many relations.
     */
    public static final RewardsShips REWARDS_SHIPS = RewardsShips.REWARDS_SHIPS;

    /**
     * Many to many relations.
     */
    public static final RewardsVouchers REWARDS_VOUCHERS = RewardsVouchers.REWARDS_VOUCHERS;

    /**
     * Server fired events.
     */
    public static final ServerLogs SERVER_LOGS = ServerLogs.SERVER_LOGS;

    /**
     * Ships table.
     */
    public static final Ships SHIPS = Ships.SHIPS;

    /**
     * Levels a skill can reach.
     */
    public static final SkilltreeLevels SKILLTREE_LEVELS = SkilltreeLevels.SKILLTREE_LEVELS;

    /**
     * The available skills.
     */
    public static final SkilltreeSkills SKILLTREE_SKILLS = SkilltreeSkills.SKILLTREE_SKILLS;

    /**
     * Requisites needed to unlock a skill upgrade.
     */
    public static final SkilltreeUnlocks SKILLTREE_UNLOCKS = SkilltreeUnlocks.SKILLTREE_UNLOCKS;

    /**
     * Different skylab modules.
     */
    public static final SkylabModules SKYLAB_MODULES = SkylabModules.SKYLAB_MODULES;

    /**
     * Item production costs.
     */
    public static final TechfactoryCosts TECHFACTORY_COSTS = TechfactoryCosts.TECHFACTORY_COSTS;

    /**
     * Drones that can be build in the tech factory.
     */
    public static final TechfactoryDrones TECHFACTORY_DRONES = TechfactoryDrones.TECHFACTORY_DRONES;

    /**
     * Items that can be build in the tech factory.
     */
    public static final TechfactoryItems TECHFACTORY_ITEMS = TechfactoryItems.TECHFACTORY_ITEMS;

    /**
     * Trade items.
     */
    public static final TradeItems TRADE_ITEMS = TradeItems.TRADE_ITEMS;

    /**
     * Contains the login information of the registered users.
     */
    public static final Users USERS = Users.USERS;

    /**
     * Voucher codes.
     */
    public static final Vouchers VOUCHERS = Vouchers.VOUCHERS;

    /**
     * Contains the redeem logs for the voucher codes.
     */
    public static final VouchersRedeemLogs VOUCHERS_REDEEM_LOGS = VouchersRedeemLogs.VOUCHERS_REDEEM_LOGS;
}