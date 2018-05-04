package com.manulaiko.kalaazu.persistence.database;

import com.manulaiko.kalaazu.persistence.database.entities.*;
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

import java.util.HashMap;
import java.util.Map;

/**
 * Speedment application.
 * ======================
 *
 * Implementation of the main speedment class.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@SuppressWarnings({"FieldCanBeLocal", "unchecked"})
public final class KalaazuApplicationImpl extends GeneratedKalaazuApplicationImpl implements KalaazuApplication {
    /**
     * Registered finders.
     */
    private Map<Class<? extends Entity>, Manager> managers = new HashMap<>();

    @Override
    public void initialize() {
        this.initializeManagers();
    }

    @Override
    public <T extends Entity> Manager<T> manager(Class<? extends Entity> type) {
        return this.managers.get(type);
    }

    /**
     * Initializes the entity managers.
     */
    private void initializeManagers() {
        this.add(Accounts.class, AccountsManager.class);
        this.add(AccountsBanks.class, AccountsBanksManager.class);
        this.add(AccountsBanksLogs.class, AccountsBanksLogsManager.class);
        this.add(AccountsClansRoles.class, AccountsClansRolesManager.class);
        this.add(AccountsConfigurations.class, AccountsConfigurationsManager.class);
        this.add(AccountsConfigurationsAccountsItems.class, AccountsConfigurationsAccountsItemsManager.class);
        this.add(AccountsDestroys.class, AccountsDestroysManager.class);
        this.add(AccountsDrones.class, AccountsDronesManager.class);
        this.add(AccountsGalaxygates.class, AccountsGalaxygatesManager.class);
        this.add(AccountsHangars.class, AccountsHangarsManager.class);
        this.add(AccountsHistory.class, AccountsHistoryManager.class);
        this.add(AccountsItems.class, AccountsItemsManager.class);
        this.add(AccountsMessages.class, AccountsMessagesManager.class);
        this.add(AccountsPets.class, AccountsPetsManager.class);
        this.add(AccountsQuests.class, AccountsQuestsManager.class);
        this.add(AccountsRankings.class, AccountsRankingsManager.class);
        this.add(AccountsShips.class, AccountsShipsManager.class);
        this.add(AccountsSkills.class, AccountsSkillsManager.class);
        this.add(AccountsSkylabs.class, AccountsSkylabsManager.class);
        this.add(AccountsTechfactories.class, AccountsTechfactoriesManager.class);
        this.add(AccountsTechfactoryItems.class, AccountsTechfactoryItemsManager.class);

        this.add(Clans.class, ClansManager.class);
        this.add(ClansApplications.class, ClansApplicationsManager.class);
        this.add(ClansBanks.class, ClansBanksManager.class);
        this.add(ClansBanksLogs.class, ClansBanksLogsManager.class);
        this.add(ClansBattlestations.class, ClansBattlestationsManager.class);
        this.add(ClansBattlestationsItems.class, ClansBattlestationsItemsManager.class);
        this.add(ClansBattlestationsLogs.class, ClansBattlestationsLogsManager.class);
        this.add(ClansDiplomacies.class, ClansDiplomaciesManager.class);
        this.add(ClansMessages.class, ClansMessagesManager.class);
        this.add(ClansNews.class, ClansNewsManager.class);
        this.add(ClansRanking.class, ClansRankingManager.class);
        this.add(ClansRoles.class, ClansRolesManager.class);
        this.add(ClansRolesPermissions.class, ClansRolesPermissionsManager.class);

        this.add(Collectables.class, CollectablesManager.class);
        this.add(Events.class, EventsManager.class);
        this.add(Factions.class, FactionsManager.class);

        this.add(Galaxygates.class, GalaxygatesManager.class);
        this.add(GalaxygatesGgSpins.class, GalaxygatesGgSpinsManager.class);
        this.add(GalaxygatesGgWaves.class, GalaxygatesGgWavesManager.class);
        this.add(GalaxygatesProbabilities.class, GalaxygatesProbabilitiesManager.class);
        this.add(GalaxygatesSpawns.class, GalaxygatesSpawnsManager.class);
        this.add(GalaxygatesSpins.class, GalaxygatesSpinsManager.class);
        this.add(GalaxygatesStages.class, GalaxygatesStagesManager.class);
        this.add(GalaxygatesStagesSpawns.class, GalaxygatesStagesSpawnsManager.class);
        this.add(GalaxygatesWaves.class, GalaxygatesWavesManager.class);

        this.add(InvitationCodes.class, InvitationCodesManager.class);
        this.add(InvitationCodesRedeemLogs.class, InvitationCodesRedeemLogsManager.class);

        this.add(Items.class, ItemsManager.class);

        this.add(Levels.class, LevelsManager.class);
        this.add(LevelsUpgrades.class, LevelsUpgradesManager.class);

        this.add(Maps.class, MapsManager.class);
        this.add(MapsNpcs.class, MapsNpcsManager.class);
        this.add(MapsPortals.class, MapsPortalsManager.class);
        this.add(MapsStations.class, MapsStationsManager.class);

        this.add(Moderators.class, ModeratorsManager.class);
        this.add(ModeratorsLogs.class, ModeratorsLogsManager.class);
        this.add(ModeratorsRoles.class, ModeratorsRolesManager.class);
        this.add(ModeratorsRolesPermissions.class, ModeratorsRolesPermissionsManager.class);

        this.add(News.class, NewsManager.class);
        this.add(Npcs.class, NpcsManager.class);
        this.add(Permissions.class, PermissionsManager.class);

        this.add(Quests.class, QuestsManager.class);
        this.add(QuestsConditions.class, QuestsConditionsManager.class);

        this.add(Ranks.class, RanksManager.class);

        this.add(Rewards.class, RewardsManager.class);
        this.add(RewardsCollectables.class, RewardsCollectablesManager.class);
        this.add(RewardsGalaxygates.class, RewardsGalaxygatesManager.class);
        this.add(RewardsNpcs.class, RewardsNpcsManager.class);
        this.add(RewardsQuests.class, RewardsQuestsManager.class);
        this.add(RewardsShips.class, RewardsShipsManager.class);
        this.add(RewardsVouchers.class, RewardsVouchersManager.class);

        this.add(ServerLogs.class, ServerLogsManager.class);
        this.add(Ships.class, ShipsManager.class);

        this.add(SkilltreeLevels.class, SkilltreeLevelsManager.class);
        this.add(SkilltreeSkills.class, SkilltreeSkillsManager.class);
        this.add(SkilltreeUnlocks.class, SkilltreeUnlocksManager.class);

        this.add(SkylabModules.class, SkylabModulesManager.class);

        this.add(TechfactoryCosts.class, TechfactoryCostsManager.class);
        this.add(TechfactoryDrones.class, TechfactoryDronesManager.class);
        this.add(TechfactoryItems.class, TechfactoryItemsManager.class);

        this.add(TradeItems.class, TradeItemsManager.class);
        this.add(Users.class, UsersManager.class);

        this.add(Vouchers.class, VouchersManager.class);
        this.add(VouchersRedeemLogs.class, VouchersRedeemLogsManager.class);
    }

    /**
     * Adds a manager.
     *
     * @param type    Entity class.
     * @param manager Manager class.
     */
    private void add(Class<? extends Entity> type, Class<? extends Manager> manager) {
        this.managers.put(type, super.getOrThrow(manager));
    }
}