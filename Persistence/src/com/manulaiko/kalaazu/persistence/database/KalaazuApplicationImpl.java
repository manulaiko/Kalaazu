package com.manulaiko.kalaazu.persistence.database;

import com.manulaiko.kalaazu.persistence.database.entities.accounts.AccountsManager;
import com.manulaiko.kalaazu.persistence.database.entities.accounts_banks.AccountsBanksManager;
import com.manulaiko.kalaazu.persistence.database.entities.accounts_banks_logs.AccountsBanksLogsManager;
import com.manulaiko.kalaazu.persistence.database.entities.accounts_clans_roles.AccountsClansRolesManager;
import com.manulaiko.kalaazu.persistence.database.entities.accounts_configurations.AccountsConfigurationsManager;
import com.manulaiko.kalaazu.persistence.database.entities.accounts_configurations_accounts_items.AccountsConfigurationsAccountsItemsManager;
import com.manulaiko.kalaazu.persistence.database.entities.accounts_destroys.AccountsDestroysManager;
import com.manulaiko.kalaazu.persistence.database.entities.accounts_drones.AccountsDronesManager;
import com.manulaiko.kalaazu.persistence.database.entities.accounts_galaxygates.AccountsGalaxygatesManager;
import com.manulaiko.kalaazu.persistence.database.entities.accounts_hangars.AccountsHangarsManager;
import com.manulaiko.kalaazu.persistence.database.entities.accounts_history.AccountsHistoryManager;
import com.manulaiko.kalaazu.persistence.database.entities.accounts_items.AccountsItemsManager;
import com.manulaiko.kalaazu.persistence.database.entities.accounts_messages.AccountsMessagesManager;
import com.manulaiko.kalaazu.persistence.database.entities.accounts_pets.AccountsPetsManager;
import com.manulaiko.kalaazu.persistence.database.entities.accounts_quests.AccountsQuestsManager;
import com.manulaiko.kalaazu.persistence.database.entities.accounts_rankings.AccountsRankingsManager;
import com.manulaiko.kalaazu.persistence.database.entities.accounts_ships.AccountsShipsManager;
import com.manulaiko.kalaazu.persistence.database.entities.accounts_skills.AccountsSkillsManager;
import com.manulaiko.kalaazu.persistence.database.entities.accounts_skylabs.AccountsSkylabsManager;
import com.manulaiko.kalaazu.persistence.database.entities.accounts_techfactories.AccountsTechfactoriesManager;
import com.manulaiko.kalaazu.persistence.database.entities.accounts_techfactory_items.AccountsTechfactoryItemsManager;
import com.manulaiko.kalaazu.persistence.database.entities.clans.ClansManager;
import com.manulaiko.kalaazu.persistence.database.entities.clans_applications.ClansApplicationsManager;
import com.manulaiko.kalaazu.persistence.database.entities.clans_banks.ClansBanksManager;
import com.manulaiko.kalaazu.persistence.database.entities.clans_banks_logs.ClansBanksLogsManager;
import com.manulaiko.kalaazu.persistence.database.entities.clans_battlestations.ClansBattlestationsManager;
import com.manulaiko.kalaazu.persistence.database.entities.clans_battlestations_items.ClansBattlestationsItemsManager;
import com.manulaiko.kalaazu.persistence.database.entities.clans_battlestations_logs.ClansBattlestationsLogsManager;
import com.manulaiko.kalaazu.persistence.database.entities.clans_diplomacies.ClansDiplomaciesManager;
import com.manulaiko.kalaazu.persistence.database.entities.clans_messages.ClansMessagesManager;
import com.manulaiko.kalaazu.persistence.database.entities.clans_news.ClansNewsManager;
import com.manulaiko.kalaazu.persistence.database.entities.clans_ranking.ClansRankingManager;
import com.manulaiko.kalaazu.persistence.database.entities.clans_roles.ClansRolesManager;
import com.manulaiko.kalaazu.persistence.database.entities.clans_roles_permissions.ClansRolesPermissionsManager;
import com.manulaiko.kalaazu.persistence.database.entities.collectables.CollectablesManager;
import com.manulaiko.kalaazu.persistence.database.entities.events.EventsManager;
import com.manulaiko.kalaazu.persistence.database.entities.factions.FactionsManager;
import com.manulaiko.kalaazu.persistence.database.entities.galaxygates.GalaxygatesManager;
import com.manulaiko.kalaazu.persistence.database.entities.galaxygates_gg_spins.GalaxygatesGgSpinsManager;
import com.manulaiko.kalaazu.persistence.database.entities.galaxygates_gg_waves.GalaxygatesGgWavesManager;
import com.manulaiko.kalaazu.persistence.database.entities.galaxygates_probabilities.GalaxygatesProbabilitiesManager;
import com.manulaiko.kalaazu.persistence.database.entities.galaxygates_spawns.GalaxygatesSpawnsManager;
import com.manulaiko.kalaazu.persistence.database.entities.galaxygates_spins.GalaxygatesSpinsManager;
import com.manulaiko.kalaazu.persistence.database.entities.galaxygates_stages.GalaxygatesStagesManager;
import com.manulaiko.kalaazu.persistence.database.entities.galaxygates_stages_spawns.GalaxygatesStagesSpawnsManager;
import com.manulaiko.kalaazu.persistence.database.entities.galaxygates_waves.GalaxygatesWavesManager;
import com.manulaiko.kalaazu.persistence.database.entities.invitation_codes.InvitationCodesManager;
import com.manulaiko.kalaazu.persistence.database.entities.invitation_codes_redeem_logs.InvitationCodesRedeemLogsManager;
import com.manulaiko.kalaazu.persistence.database.entities.items.ItemsManager;
import com.manulaiko.kalaazu.persistence.database.entities.key_value.KeyValueManager;
import com.manulaiko.kalaazu.persistence.database.entities.levels.LevelsManager;
import com.manulaiko.kalaazu.persistence.database.entities.levels_upgrades.LevelsUpgradesManager;
import com.manulaiko.kalaazu.persistence.database.entities.maps.MapsManager;
import com.manulaiko.kalaazu.persistence.database.entities.maps_npcs.MapsNpcsManager;
import com.manulaiko.kalaazu.persistence.database.entities.maps_portals.MapsPortalsManager;
import com.manulaiko.kalaazu.persistence.database.entities.maps_stations.MapsStationsManager;
import com.manulaiko.kalaazu.persistence.database.entities.moderators.ModeratorsManager;
import com.manulaiko.kalaazu.persistence.database.entities.moderators_logs.ModeratorsLogsManager;
import com.manulaiko.kalaazu.persistence.database.entities.moderators_roles.ModeratorsRolesManager;
import com.manulaiko.kalaazu.persistence.database.entities.moderators_roles_permissions.ModeratorsRolesPermissionsManager;
import com.manulaiko.kalaazu.persistence.database.entities.news.NewsManager;
import com.manulaiko.kalaazu.persistence.database.entities.npcs.NpcsManager;
import com.manulaiko.kalaazu.persistence.database.entities.permissions.PermissionsManager;
import com.manulaiko.kalaazu.persistence.database.entities.quests.QuestsManager;
import com.manulaiko.kalaazu.persistence.database.entities.quests_conditions.QuestsConditionsManager;
import com.manulaiko.kalaazu.persistence.database.entities.ranks.RanksManager;
import com.manulaiko.kalaazu.persistence.database.entities.rewards.RewardsManager;
import com.manulaiko.kalaazu.persistence.database.entities.rewards_collectables.RewardsCollectablesManager;
import com.manulaiko.kalaazu.persistence.database.entities.rewards_galaxygates.RewardsGalaxygatesManager;
import com.manulaiko.kalaazu.persistence.database.entities.rewards_npcs.RewardsNpcsManager;
import com.manulaiko.kalaazu.persistence.database.entities.rewards_quests.RewardsQuestsManager;
import com.manulaiko.kalaazu.persistence.database.entities.rewards_ships.RewardsShipsManager;
import com.manulaiko.kalaazu.persistence.database.entities.rewards_vouchers.RewardsVouchersManager;
import com.manulaiko.kalaazu.persistence.database.entities.server_logs.ServerLogsManager;
import com.manulaiko.kalaazu.persistence.database.entities.ships.ShipsManager;
import com.manulaiko.kalaazu.persistence.database.entities.skilltree_levels.SkilltreeLevelsManager;
import com.manulaiko.kalaazu.persistence.database.entities.skilltree_skills.SkilltreeSkillsManager;
import com.manulaiko.kalaazu.persistence.database.entities.skilltree_unlocks.SkilltreeUnlocksManager;
import com.manulaiko.kalaazu.persistence.database.entities.skylab_modules.SkylabModulesManager;
import com.manulaiko.kalaazu.persistence.database.entities.techfactory_costs.TechfactoryCostsManager;
import com.manulaiko.kalaazu.persistence.database.entities.techfactory_drones.TechfactoryDronesManager;
import com.manulaiko.kalaazu.persistence.database.entities.techfactory_items.TechfactoryItemsManager;
import com.manulaiko.kalaazu.persistence.database.entities.trade_items.TradeItemsManager;
import com.manulaiko.kalaazu.persistence.database.entities.users.UsersManager;
import com.manulaiko.kalaazu.persistence.database.entities.vouchers.VouchersManager;
import com.manulaiko.kalaazu.persistence.database.entities.vouchers_redeem_logs.VouchersRedeemLogsManager;
import com.manulaiko.kalaazu.persistence.database.generated.GeneratedKalaazuApplicationImpl;

/**
 * Speedment application.
 * ======================
 *
 * Implementation of the main speedment class.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@SuppressWarnings("FieldCanBeLocal")
public final class KalaazuApplicationImpl extends GeneratedKalaazuApplicationImpl implements KalaazuApplication {
    //<editor-fold desc="Entity managers">
    private AccountsManager                            accounts;
    private AccountsBanksManager                       accountsBanks;
    private AccountsBanksLogsManager                   accountsBanksLogs;
    private AccountsClansRolesManager                  accountsClansRoles;
    private AccountsConfigurationsManager              accountsConfigurations;
    private AccountsConfigurationsAccountsItemsManager accountsConfigurationsAccountsItems;
    private AccountsDestroysManager                    accountsDestroys;
    private AccountsDronesManager                      accountsDrones;
    private AccountsGalaxygatesManager                 accountsGalaxyGates;
    private AccountsHangarsManager                     accountsHangars;
    private AccountsHistoryManager                     accountsHistory;
    private AccountsItemsManager                       accountsItems;
    private AccountsMessagesManager                    accountsMessages;
    private AccountsPetsManager                        accountsPets;
    private AccountsQuestsManager                      accountsQuests;
    private AccountsRankingsManager                    accountsRankings;
    private AccountsShipsManager                       accountsShips;
    private AccountsSkillsManager                      accountsSkills;
    private AccountsSkylabsManager                     accountsSkylabs;
    private AccountsTechfactoriesManager               accountsTechfactories;
    private AccountsTechfactoryItemsManager            accountsTechfactoriesItems;
    
    private ClansManager                    clans;
    private ClansApplicationsManager        clansApplications;
    private ClansBanksManager               clansBanks;
    private ClansBanksLogsManager           clansBanksLogs;
    private ClansBattlestationsManager      clansBattlestations;
    private ClansBattlestationsItemsManager clansBattlestationsItems;
    private ClansBattlestationsLogsManager  clansBattlestationsLogs;
    private ClansDiplomaciesManager         clansDiplomacies;
    private ClansMessagesManager            clansMessages;
    private ClansNewsManager                clansNews;
    private ClansRankingManager             clansRanking;
    private ClansRolesManager               clansRoles;
    private ClansRolesPermissionsManager    clansRolesPermissions;
    
    private CollectablesManager collectables;
    private EventsManager       events;
    private FactionsManager     factions;
    
    private GalaxygatesManager              galaxygates;
    private GalaxygatesGgSpinsManager       galaxygatesGgSpins;
    private GalaxygatesGgWavesManager       galaxygatesGgWaves;
    private GalaxygatesProbabilitiesManager galaxygatesProbabilities;
    private GalaxygatesSpawnsManager        galaxygatesSpawns;
    private GalaxygatesSpinsManager         galaxygatesSpins;
    private GalaxygatesStagesManager        galaxygatesStages;
    private GalaxygatesStagesSpawnsManager  galaxygatesStagesSpawns;
    private GalaxygatesWavesManager         galaxygatesWaves;
    
    private InvitationCodesManager           invitationCodes;
    private InvitationCodesRedeemLogsManager invitationCodesRedeemLogs;
    
    private ItemsManager    items;
    private KeyValueManager keyValue;
    
    private LevelsManager         levels;
    private LevelsUpgradesManager levelsUpgrades;
    
    private MapsManager         maps;
    private MapsNpcsManager     mapsNpcs;
    private MapsPortalsManager  mapsPortals;
    private MapsStationsManager mapsStations;
    
    private ModeratorsManager                 moderators;
    private ModeratorsLogsManager             moderatorsLogs;
    private ModeratorsRolesManager            moderatorsRoles;
    private ModeratorsRolesPermissionsManager moderatorsRolesPermissions;
    
    private NewsManager        news;
    private NpcsManager        npcs;
    private PermissionsManager permissions;
    
    private QuestsManager           quests;
    private QuestsConditionsManager questsConditions;
    
    private RanksManager ranks;
    
    private RewardsManager             rewards;
    private RewardsCollectablesManager rewardsCollectables;
    private RewardsGalaxygatesManager  rewardsGalaxygates;
    private RewardsNpcsManager         rewardsNpcs;
    private RewardsQuestsManager       rewardsQuests;
    private RewardsShipsManager        rewardsShips;
    private RewardsVouchersManager     rewardsVouchers;
    
    private ServerLogsManager serverLogs;
    private ShipsManager      ships;
    
    private SkilltreeLevelsManager  skilltreeLevels;
    private SkilltreeSkillsManager  skilltreeSkills;
    private SkilltreeUnlocksManager skilltreeUnlocks;
    
    private SkylabModulesManager skylabModules;
    
    private TechfactoryCostsManager  techfactoryCosts;
    private TechfactoryDronesManager techfactoryDrones;
    private TechfactoryItemsManager  techfactoryItems;
    
    private TradeItemsManager tradeItems;
    private UsersManager      users;
    
    private VouchersManager           vouchers;
    private VouchersRedeemLogsManager vouchersRedeemLogs;
    //</editor-fold>

    /**
     * Initializes the managers.
     */
    @Override
    public void initialize() {
        this.initializeManagers();
    }

    /**
     * Initializes the entity managers.
     */
    private void initializeManagers() {
        this.accounts                            = super.getOrThrow(AccountsManager.class);
        this.accountsBanks                       = super.getOrThrow(AccountsBanksManager.class);
        this.accountsBanksLogs                   = super.getOrThrow(AccountsBanksLogsManager.class);
        this.accountsClansRoles                  = super.getOrThrow(AccountsClansRolesManager.class);
        this.accountsConfigurations              = super.getOrThrow(AccountsConfigurationsManager.class);
        this.accountsConfigurationsAccountsItems = super.getOrThrow(AccountsConfigurationsAccountsItemsManager.class);
        this.accountsDestroys                    = super.getOrThrow(AccountsDestroysManager.class);
        this.accountsDrones                      = super.getOrThrow(AccountsDronesManager.class);
        this.accountsGalaxyGates                 = super.getOrThrow(AccountsGalaxygatesManager.class);
        this.accountsHangars                     = super.getOrThrow(AccountsHangarsManager.class);
        this.accountsHistory                     = super.getOrThrow(AccountsHistoryManager.class);
        this.accountsItems                       = super.getOrThrow(AccountsItemsManager.class);
        this.accountsMessages                    = super.getOrThrow(AccountsMessagesManager.class);
        this.accountsPets                        = super.getOrThrow(AccountsPetsManager.class);
        this.accountsQuests                      = super.getOrThrow(AccountsQuestsManager.class);
        this.accountsRankings                    = super.getOrThrow(AccountsRankingsManager.class);
        this.accountsShips                       = super.getOrThrow(AccountsShipsManager.class);
        this.accountsSkills                      = super.getOrThrow(AccountsSkillsManager.class);
        this.accountsSkylabs                     = super.getOrThrow(AccountsSkylabsManager.class);
        this.accountsTechfactories               = super.getOrThrow(AccountsTechfactoriesManager.class);
        this.accountsTechfactoriesItems          = super.getOrThrow(AccountsTechfactoryItemsManager.class);

        this.clans                    = super.getOrThrow(ClansManager.class);
        this.clansApplications        = super.getOrThrow(ClansApplicationsManager.class);
        this.clansBanks               = super.getOrThrow(ClansBanksManager.class);
        this.clansBanksLogs           = super.getOrThrow(ClansBanksLogsManager.class);
        this.clansBattlestations      = super.getOrThrow(ClansBattlestationsManager.class);
        this.clansBattlestationsItems = super.getOrThrow(ClansBattlestationsItemsManager.class);
        this.clansBattlestationsLogs  = super.getOrThrow(ClansBattlestationsLogsManager.class);
        this.clansDiplomacies         = super.getOrThrow(ClansDiplomaciesManager.class);
        this.clansMessages            = super.getOrThrow(ClansMessagesManager.class);
        this.clansNews                = super.getOrThrow(ClansNewsManager.class);
        this.clansRanking             = super.getOrThrow(ClansRankingManager.class);
        this.clansRoles               = super.getOrThrow(ClansRolesManager.class);
        this.clansRolesPermissions    = super.getOrThrow(ClansRolesPermissionsManager.class);

        this.collectables = super.getOrThrow(CollectablesManager.class);
        this.events       = super.getOrThrow(EventsManager.class);
        this.factions     = super.getOrThrow(FactionsManager.class);

        this.galaxygates              = super.getOrThrow(GalaxygatesManager.class);
        this.galaxygatesGgSpins       = super.getOrThrow(GalaxygatesGgSpinsManager.class);
        this.galaxygatesGgWaves       = super.getOrThrow(GalaxygatesGgWavesManager.class);
        this.galaxygatesProbabilities = super.getOrThrow(GalaxygatesProbabilitiesManager.class);
        this.galaxygatesSpawns        = super.getOrThrow(GalaxygatesSpawnsManager.class);
        this.galaxygatesSpins         = super.getOrThrow(GalaxygatesSpinsManager.class);
        this.galaxygatesStages        = super.getOrThrow(GalaxygatesStagesManager.class);
        this.galaxygatesStagesSpawns  = super.getOrThrow(GalaxygatesStagesSpawnsManager.class);
        this.galaxygatesWaves         = super.getOrThrow(GalaxygatesWavesManager.class);

        this.invitationCodes           = super.getOrThrow(InvitationCodesManager.class);
        this.invitationCodesRedeemLogs = super.getOrThrow(InvitationCodesRedeemLogsManager.class);

        this.items    = super.getOrThrow(ItemsManager.class);
        this.keyValue = super.getOrThrow(KeyValueManager.class);

        this.levels         = super.getOrThrow(LevelsManager.class);
        this.levelsUpgrades = super.getOrThrow(LevelsUpgradesManager.class);

        this.maps         = super.getOrThrow(MapsManager.class);
        this.mapsNpcs     = super.getOrThrow(MapsNpcsManager.class);
        this.mapsPortals  = super.getOrThrow(MapsPortalsManager.class);
        this.mapsStations = super.getOrThrow(MapsStationsManager.class);

        this.moderators                 = super.getOrThrow(ModeratorsManager.class);
        this.moderatorsLogs             = super.getOrThrow(ModeratorsLogsManager.class);
        this.moderatorsRoles            = super.getOrThrow(ModeratorsRolesManager.class);
        this.moderatorsRolesPermissions = super.getOrThrow(ModeratorsRolesPermissionsManager.class);

        this.news        = super.getOrThrow(NewsManager.class);
        this.npcs        = super.getOrThrow(NpcsManager.class);
        this.permissions = super.getOrThrow(PermissionsManager.class);

        this.quests           = super.getOrThrow(QuestsManager.class);
        this.questsConditions = super.getOrThrow(QuestsConditionsManager.class);

        this.ranks = super.getOrThrow(RanksManager.class);

        this.rewards             = super.getOrThrow(RewardsManager.class);
        this.rewardsCollectables = super.getOrThrow(RewardsCollectablesManager.class);
        this.rewardsGalaxygates  = super.getOrThrow(RewardsGalaxygatesManager.class);
        this.rewardsNpcs         = super.getOrThrow(RewardsNpcsManager.class);
        this.rewardsQuests       = super.getOrThrow(RewardsQuestsManager.class);
        this.rewardsShips        = super.getOrThrow(RewardsShipsManager.class);
        this.rewardsVouchers     = super.getOrThrow(RewardsVouchersManager.class);

        this.serverLogs = super.getOrThrow(ServerLogsManager.class);
        this.ships      = super.getOrThrow(ShipsManager.class);

        this.skilltreeLevels  = super.getOrThrow(SkilltreeLevelsManager.class);
        this.skilltreeSkills  = super.getOrThrow(SkilltreeSkillsManager.class);
        this.skilltreeUnlocks = super.getOrThrow(SkilltreeUnlocksManager.class);

        this.skylabModules = super.getOrThrow(SkylabModulesManager.class);

        this.techfactoryCosts  = super.getOrThrow(TechfactoryCostsManager.class);
        this.techfactoryDrones = super.getOrThrow(TechfactoryDronesManager.class);
        this.techfactoryItems  = super.getOrThrow(TechfactoryItemsManager.class);

        this.tradeItems = super.getOrThrow(TradeItemsManager.class);
        this.users      = super.getOrThrow(UsersManager.class);

        this.vouchers           = super.getOrThrow(VouchersManager.class);
        this.vouchersRedeemLogs = super.getOrThrow(VouchersRedeemLogsManager.class);
    }
}