package com.kalaazu.persistence.database.generated;

import com.kalaazu.persistence.database.KalaazuApplication;
import com.kalaazu.persistence.database.KalaazuApplicationBuilder;
import com.kalaazu.persistence.database.KalaazuApplicationImpl;
import com.kalaazu.persistence.database.entities.accounts.AccountsManagerImpl;
import com.kalaazu.persistence.database.entities.accounts.AccountsSqlAdapter;
import com.kalaazu.persistence.database.entities.accounts_banks.AccountsBanksManagerImpl;
import com.kalaazu.persistence.database.entities.accounts_banks.AccountsBanksSqlAdapter;
import com.kalaazu.persistence.database.entities.accounts_banks_logs.AccountsBanksLogsManagerImpl;
import com.kalaazu.persistence.database.entities.accounts_banks_logs.AccountsBanksLogsSqlAdapter;
import com.kalaazu.persistence.database.entities.accounts_clans_roles.AccountsClansRolesManagerImpl;
import com.kalaazu.persistence.database.entities.accounts_clans_roles.AccountsClansRolesSqlAdapter;
import com.kalaazu.persistence.database.entities.accounts_configurations.AccountsConfigurationsManagerImpl;
import com.kalaazu.persistence.database.entities.accounts_configurations.AccountsConfigurationsSqlAdapter;
import com.kalaazu.persistence.database.entities.accounts_configurations_accounts_items.AccountsConfigurationsAccountsItemsManagerImpl;
import com.kalaazu.persistence.database.entities.accounts_configurations_accounts_items.AccountsConfigurationsAccountsItemsSqlAdapter;
import com.kalaazu.persistence.database.entities.accounts_destroys.AccountsDestroysManagerImpl;
import com.kalaazu.persistence.database.entities.accounts_destroys.AccountsDestroysSqlAdapter;
import com.kalaazu.persistence.database.entities.accounts_drones.AccountsDronesManagerImpl;
import com.kalaazu.persistence.database.entities.accounts_drones.AccountsDronesSqlAdapter;
import com.kalaazu.persistence.database.entities.accounts_galaxygates.AccountsGalaxygatesManagerImpl;
import com.kalaazu.persistence.database.entities.accounts_galaxygates.AccountsGalaxygatesSqlAdapter;
import com.kalaazu.persistence.database.entities.accounts_hangars.AccountsHangarsManagerImpl;
import com.kalaazu.persistence.database.entities.accounts_hangars.AccountsHangarsSqlAdapter;
import com.kalaazu.persistence.database.entities.accounts_history.AccountsHistoryManagerImpl;
import com.kalaazu.persistence.database.entities.accounts_history.AccountsHistorySqlAdapter;
import com.kalaazu.persistence.database.entities.accounts_items.AccountsItemsManagerImpl;
import com.kalaazu.persistence.database.entities.accounts_items.AccountsItemsSqlAdapter;
import com.kalaazu.persistence.database.entities.accounts_messages.AccountsMessagesManagerImpl;
import com.kalaazu.persistence.database.entities.accounts_messages.AccountsMessagesSqlAdapter;
import com.kalaazu.persistence.database.entities.accounts_pets.AccountsPetsManagerImpl;
import com.kalaazu.persistence.database.entities.accounts_pets.AccountsPetsSqlAdapter;
import com.kalaazu.persistence.database.entities.accounts_quests.AccountsQuestsManagerImpl;
import com.kalaazu.persistence.database.entities.accounts_quests.AccountsQuestsSqlAdapter;
import com.kalaazu.persistence.database.entities.accounts_rankings.AccountsRankingsManagerImpl;
import com.kalaazu.persistence.database.entities.accounts_rankings.AccountsRankingsSqlAdapter;
import com.kalaazu.persistence.database.entities.accounts_ships.AccountsShipsManagerImpl;
import com.kalaazu.persistence.database.entities.accounts_ships.AccountsShipsSqlAdapter;
import com.kalaazu.persistence.database.entities.accounts_skills.AccountsSkillsManagerImpl;
import com.kalaazu.persistence.database.entities.accounts_skills.AccountsSkillsSqlAdapter;
import com.kalaazu.persistence.database.entities.accounts_skylabs.AccountsSkylabsManagerImpl;
import com.kalaazu.persistence.database.entities.accounts_skylabs.AccountsSkylabsSqlAdapter;
import com.kalaazu.persistence.database.entities.accounts_techfactories.AccountsTechfactoriesManagerImpl;
import com.kalaazu.persistence.database.entities.accounts_techfactories.AccountsTechfactoriesSqlAdapter;
import com.kalaazu.persistence.database.entities.accounts_techfactory_items.AccountsTechfactoryItemsManagerImpl;
import com.kalaazu.persistence.database.entities.accounts_techfactory_items.AccountsTechfactoryItemsSqlAdapter;
import com.kalaazu.persistence.database.entities.clans.ClansManagerImpl;
import com.kalaazu.persistence.database.entities.clans.ClansSqlAdapter;
import com.kalaazu.persistence.database.entities.clans_applications.ClansApplicationsManagerImpl;
import com.kalaazu.persistence.database.entities.clans_applications.ClansApplicationsSqlAdapter;
import com.kalaazu.persistence.database.entities.clans_banks.ClansBanksManagerImpl;
import com.kalaazu.persistence.database.entities.clans_banks.ClansBanksSqlAdapter;
import com.kalaazu.persistence.database.entities.clans_banks_logs.ClansBanksLogsManagerImpl;
import com.kalaazu.persistence.database.entities.clans_banks_logs.ClansBanksLogsSqlAdapter;
import com.kalaazu.persistence.database.entities.clans_battlestations.ClansBattlestationsManagerImpl;
import com.kalaazu.persistence.database.entities.clans_battlestations.ClansBattlestationsSqlAdapter;
import com.kalaazu.persistence.database.entities.clans_battlestations_items.ClansBattlestationsItemsManagerImpl;
import com.kalaazu.persistence.database.entities.clans_battlestations_items.ClansBattlestationsItemsSqlAdapter;
import com.kalaazu.persistence.database.entities.clans_battlestations_logs.ClansBattlestationsLogsManagerImpl;
import com.kalaazu.persistence.database.entities.clans_battlestations_logs.ClansBattlestationsLogsSqlAdapter;
import com.kalaazu.persistence.database.entities.clans_diplomacies.ClansDiplomaciesManagerImpl;
import com.kalaazu.persistence.database.entities.clans_diplomacies.ClansDiplomaciesSqlAdapter;
import com.kalaazu.persistence.database.entities.clans_messages.ClansMessagesManagerImpl;
import com.kalaazu.persistence.database.entities.clans_messages.ClansMessagesSqlAdapter;
import com.kalaazu.persistence.database.entities.clans_news.ClansNewsManagerImpl;
import com.kalaazu.persistence.database.entities.clans_news.ClansNewsSqlAdapter;
import com.kalaazu.persistence.database.entities.clans_ranking.ClansRankingManagerImpl;
import com.kalaazu.persistence.database.entities.clans_ranking.ClansRankingSqlAdapter;
import com.kalaazu.persistence.database.entities.clans_roles.ClansRolesManagerImpl;
import com.kalaazu.persistence.database.entities.clans_roles.ClansRolesSqlAdapter;
import com.kalaazu.persistence.database.entities.clans_roles_permissions.ClansRolesPermissionsManagerImpl;
import com.kalaazu.persistence.database.entities.clans_roles_permissions.ClansRolesPermissionsSqlAdapter;
import com.kalaazu.persistence.database.entities.collectables.CollectablesManagerImpl;
import com.kalaazu.persistence.database.entities.collectables.CollectablesSqlAdapter;
import com.kalaazu.persistence.database.entities.events.EventsManagerImpl;
import com.kalaazu.persistence.database.entities.events.EventsSqlAdapter;
import com.kalaazu.persistence.database.entities.factions.FactionsManagerImpl;
import com.kalaazu.persistence.database.entities.factions.FactionsSqlAdapter;
import com.kalaazu.persistence.database.entities.galaxygates.GalaxygatesManagerImpl;
import com.kalaazu.persistence.database.entities.galaxygates.GalaxygatesSqlAdapter;
import com.kalaazu.persistence.database.entities.galaxygates_gg_spins.GalaxygatesGgSpinsManagerImpl;
import com.kalaazu.persistence.database.entities.galaxygates_gg_spins.GalaxygatesGgSpinsSqlAdapter;
import com.kalaazu.persistence.database.entities.galaxygates_gg_waves.GalaxygatesGgWavesManagerImpl;
import com.kalaazu.persistence.database.entities.galaxygates_gg_waves.GalaxygatesGgWavesSqlAdapter;
import com.kalaazu.persistence.database.entities.galaxygates_probabilities.GalaxygatesProbabilitiesManagerImpl;
import com.kalaazu.persistence.database.entities.galaxygates_probabilities.GalaxygatesProbabilitiesSqlAdapter;
import com.kalaazu.persistence.database.entities.galaxygates_spawns.GalaxygatesSpawnsManagerImpl;
import com.kalaazu.persistence.database.entities.galaxygates_spawns.GalaxygatesSpawnsSqlAdapter;
import com.kalaazu.persistence.database.entities.galaxygates_spins.GalaxygatesSpinsManagerImpl;
import com.kalaazu.persistence.database.entities.galaxygates_spins.GalaxygatesSpinsSqlAdapter;
import com.kalaazu.persistence.database.entities.galaxygates_stages.GalaxygatesStagesManagerImpl;
import com.kalaazu.persistence.database.entities.galaxygates_stages.GalaxygatesStagesSqlAdapter;
import com.kalaazu.persistence.database.entities.galaxygates_stages_spawns.GalaxygatesStagesSpawnsManagerImpl;
import com.kalaazu.persistence.database.entities.galaxygates_stages_spawns.GalaxygatesStagesSpawnsSqlAdapter;
import com.kalaazu.persistence.database.entities.galaxygates_waves.GalaxygatesWavesManagerImpl;
import com.kalaazu.persistence.database.entities.galaxygates_waves.GalaxygatesWavesSqlAdapter;
import com.kalaazu.persistence.database.entities.invitation_codes.InvitationCodesManagerImpl;
import com.kalaazu.persistence.database.entities.invitation_codes.InvitationCodesSqlAdapter;
import com.kalaazu.persistence.database.entities.invitation_codes_redeem_logs.InvitationCodesRedeemLogsManagerImpl;
import com.kalaazu.persistence.database.entities.invitation_codes_redeem_logs.InvitationCodesRedeemLogsSqlAdapter;
import com.kalaazu.persistence.database.entities.items.ItemsManagerImpl;
import com.kalaazu.persistence.database.entities.items.ItemsSqlAdapter;
import com.kalaazu.persistence.database.entities.key_value.KeyValueManagerImpl;
import com.kalaazu.persistence.database.entities.key_value.KeyValueSqlAdapter;
import com.kalaazu.persistence.database.entities.levels.LevelsManagerImpl;
import com.kalaazu.persistence.database.entities.levels.LevelsSqlAdapter;
import com.kalaazu.persistence.database.entities.levels_upgrades.LevelsUpgradesManagerImpl;
import com.kalaazu.persistence.database.entities.levels_upgrades.LevelsUpgradesSqlAdapter;
import com.kalaazu.persistence.database.entities.maps.MapsManagerImpl;
import com.kalaazu.persistence.database.entities.maps.MapsSqlAdapter;
import com.kalaazu.persistence.database.entities.maps_npcs.MapsNpcsManagerImpl;
import com.kalaazu.persistence.database.entities.maps_npcs.MapsNpcsSqlAdapter;
import com.kalaazu.persistence.database.entities.maps_portals.MapsPortalsManagerImpl;
import com.kalaazu.persistence.database.entities.maps_portals.MapsPortalsSqlAdapter;
import com.kalaazu.persistence.database.entities.maps_stations.MapsStationsManagerImpl;
import com.kalaazu.persistence.database.entities.maps_stations.MapsStationsSqlAdapter;
import com.kalaazu.persistence.database.entities.moderators.ModeratorsManagerImpl;
import com.kalaazu.persistence.database.entities.moderators.ModeratorsSqlAdapter;
import com.kalaazu.persistence.database.entities.moderators_logs.ModeratorsLogsManagerImpl;
import com.kalaazu.persistence.database.entities.moderators_logs.ModeratorsLogsSqlAdapter;
import com.kalaazu.persistence.database.entities.moderators_roles.ModeratorsRolesManagerImpl;
import com.kalaazu.persistence.database.entities.moderators_roles.ModeratorsRolesSqlAdapter;
import com.kalaazu.persistence.database.entities.moderators_roles_permissions.ModeratorsRolesPermissionsManagerImpl;
import com.kalaazu.persistence.database.entities.moderators_roles_permissions.ModeratorsRolesPermissionsSqlAdapter;
import com.kalaazu.persistence.database.entities.news.NewsManagerImpl;
import com.kalaazu.persistence.database.entities.news.NewsSqlAdapter;
import com.kalaazu.persistence.database.entities.npcs.NpcsManagerImpl;
import com.kalaazu.persistence.database.entities.npcs.NpcsSqlAdapter;
import com.kalaazu.persistence.database.entities.permissions.PermissionsManagerImpl;
import com.kalaazu.persistence.database.entities.permissions.PermissionsSqlAdapter;
import com.kalaazu.persistence.database.entities.quests.QuestsManagerImpl;
import com.kalaazu.persistence.database.entities.quests.QuestsSqlAdapter;
import com.kalaazu.persistence.database.entities.quests_conditions.QuestsConditionsManagerImpl;
import com.kalaazu.persistence.database.entities.quests_conditions.QuestsConditionsSqlAdapter;
import com.kalaazu.persistence.database.entities.ranks.RanksManagerImpl;
import com.kalaazu.persistence.database.entities.ranks.RanksSqlAdapter;
import com.kalaazu.persistence.database.entities.rewards.RewardsManagerImpl;
import com.kalaazu.persistence.database.entities.rewards.RewardsSqlAdapter;
import com.kalaazu.persistence.database.entities.rewards_collectables.RewardsCollectablesManagerImpl;
import com.kalaazu.persistence.database.entities.rewards_collectables.RewardsCollectablesSqlAdapter;
import com.kalaazu.persistence.database.entities.rewards_galaxygates.RewardsGalaxygatesManagerImpl;
import com.kalaazu.persistence.database.entities.rewards_galaxygates.RewardsGalaxygatesSqlAdapter;
import com.kalaazu.persistence.database.entities.rewards_npcs.RewardsNpcsManagerImpl;
import com.kalaazu.persistence.database.entities.rewards_npcs.RewardsNpcsSqlAdapter;
import com.kalaazu.persistence.database.entities.rewards_quests.RewardsQuestsManagerImpl;
import com.kalaazu.persistence.database.entities.rewards_quests.RewardsQuestsSqlAdapter;
import com.kalaazu.persistence.database.entities.rewards_ships.RewardsShipsManagerImpl;
import com.kalaazu.persistence.database.entities.rewards_ships.RewardsShipsSqlAdapter;
import com.kalaazu.persistence.database.entities.rewards_vouchers.RewardsVouchersManagerImpl;
import com.kalaazu.persistence.database.entities.rewards_vouchers.RewardsVouchersSqlAdapter;
import com.kalaazu.persistence.database.entities.server_logs.ServerLogsManagerImpl;
import com.kalaazu.persistence.database.entities.server_logs.ServerLogsSqlAdapter;
import com.kalaazu.persistence.database.entities.ships.ShipsManagerImpl;
import com.kalaazu.persistence.database.entities.ships.ShipsSqlAdapter;
import com.kalaazu.persistence.database.entities.skilltree_levels.SkilltreeLevelsManagerImpl;
import com.kalaazu.persistence.database.entities.skilltree_levels.SkilltreeLevelsSqlAdapter;
import com.kalaazu.persistence.database.entities.skilltree_skills.SkilltreeSkillsManagerImpl;
import com.kalaazu.persistence.database.entities.skilltree_skills.SkilltreeSkillsSqlAdapter;
import com.kalaazu.persistence.database.entities.skilltree_unlocks.SkilltreeUnlocksManagerImpl;
import com.kalaazu.persistence.database.entities.skilltree_unlocks.SkilltreeUnlocksSqlAdapter;
import com.kalaazu.persistence.database.entities.skylab_modules.SkylabModulesManagerImpl;
import com.kalaazu.persistence.database.entities.skylab_modules.SkylabModulesSqlAdapter;
import com.kalaazu.persistence.database.entities.techfactory_costs.TechfactoryCostsManagerImpl;
import com.kalaazu.persistence.database.entities.techfactory_costs.TechfactoryCostsSqlAdapter;
import com.kalaazu.persistence.database.entities.techfactory_drones.TechfactoryDronesManagerImpl;
import com.kalaazu.persistence.database.entities.techfactory_drones.TechfactoryDronesSqlAdapter;
import com.kalaazu.persistence.database.entities.techfactory_items.TechfactoryItemsManagerImpl;
import com.kalaazu.persistence.database.entities.techfactory_items.TechfactoryItemsSqlAdapter;
import com.kalaazu.persistence.database.entities.trade_items.TradeItemsManagerImpl;
import com.kalaazu.persistence.database.entities.trade_items.TradeItemsSqlAdapter;
import com.kalaazu.persistence.database.entities.users.UsersManagerImpl;
import com.kalaazu.persistence.database.entities.users.UsersSqlAdapter;
import com.kalaazu.persistence.database.entities.vouchers.VouchersManagerImpl;
import com.kalaazu.persistence.database.entities.vouchers.VouchersSqlAdapter;
import com.kalaazu.persistence.database.entities.vouchers_redeem_logs.VouchersRedeemLogsManagerImpl;
import com.kalaazu.persistence.database.entities.vouchers_redeem_logs.VouchersRedeemLogsSqlAdapter;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.common.injector.Injector;
import com.speedment.runtime.core.internal.AbstractApplicationBuilder;

/**
 * A generated base {@link
 * com.speedment.runtime.core.internal.AbstractApplicationBuilder} class for the
 * {@link com.speedment.runtime.config.Project} named kalaazu.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedKalaazuApplicationBuilder extends AbstractApplicationBuilder<KalaazuApplication, KalaazuApplicationBuilder> {

    protected GeneratedKalaazuApplicationBuilder() {
        super(KalaazuApplicationImpl.class, GeneratedKalaazuMetadata.class);
        withManager(AccountsManagerImpl.class);
        withManager(AccountsBanksManagerImpl.class);
        withManager(AccountsBanksLogsManagerImpl.class);
        withManager(AccountsClansRolesManagerImpl.class);
        withManager(AccountsConfigurationsManagerImpl.class);
        withManager(AccountsConfigurationsAccountsItemsManagerImpl.class);
        withManager(AccountsDestroysManagerImpl.class);
        withManager(AccountsDronesManagerImpl.class);
        withManager(AccountsGalaxygatesManagerImpl.class);
        withManager(AccountsHangarsManagerImpl.class);
        withManager(AccountsHistoryManagerImpl.class);
        withManager(AccountsItemsManagerImpl.class);
        withManager(AccountsMessagesManagerImpl.class);
        withManager(AccountsPetsManagerImpl.class);
        withManager(AccountsQuestsManagerImpl.class);
        withManager(AccountsRankingsManagerImpl.class);
        withManager(AccountsShipsManagerImpl.class);
        withManager(AccountsSkillsManagerImpl.class);
        withManager(AccountsSkylabsManagerImpl.class);
        withManager(AccountsTechfactoriesManagerImpl.class);
        withManager(AccountsTechfactoryItemsManagerImpl.class);
        withManager(ClansManagerImpl.class);
        withManager(ClansApplicationsManagerImpl.class);
        withManager(ClansBanksManagerImpl.class);
        withManager(ClansBanksLogsManagerImpl.class);
        withManager(ClansBattlestationsManagerImpl.class);
        withManager(ClansBattlestationsItemsManagerImpl.class);
        withManager(ClansBattlestationsLogsManagerImpl.class);
        withManager(ClansDiplomaciesManagerImpl.class);
        withManager(ClansMessagesManagerImpl.class);
        withManager(ClansNewsManagerImpl.class);
        withManager(ClansRankingManagerImpl.class);
        withManager(ClansRolesManagerImpl.class);
        withManager(ClansRolesPermissionsManagerImpl.class);
        withManager(CollectablesManagerImpl.class);
        withManager(EventsManagerImpl.class);
        withManager(FactionsManagerImpl.class);
        withManager(GalaxygatesManagerImpl.class);
        withManager(GalaxygatesGgSpinsManagerImpl.class);
        withManager(GalaxygatesGgWavesManagerImpl.class);
        withManager(GalaxygatesProbabilitiesManagerImpl.class);
        withManager(GalaxygatesSpawnsManagerImpl.class);
        withManager(GalaxygatesSpinsManagerImpl.class);
        withManager(GalaxygatesStagesManagerImpl.class);
        withManager(GalaxygatesStagesSpawnsManagerImpl.class);
        withManager(GalaxygatesWavesManagerImpl.class);
        withManager(InvitationCodesManagerImpl.class);
        withManager(InvitationCodesRedeemLogsManagerImpl.class);
        withManager(ItemsManagerImpl.class);
        withManager(KeyValueManagerImpl.class);
        withManager(LevelsManagerImpl.class);
        withManager(LevelsUpgradesManagerImpl.class);
        withManager(MapsManagerImpl.class);
        withManager(MapsNpcsManagerImpl.class);
        withManager(MapsPortalsManagerImpl.class);
        withManager(MapsStationsManagerImpl.class);
        withManager(ModeratorsManagerImpl.class);
        withManager(ModeratorsLogsManagerImpl.class);
        withManager(ModeratorsRolesManagerImpl.class);
        withManager(ModeratorsRolesPermissionsManagerImpl.class);
        withManager(NewsManagerImpl.class);
        withManager(NpcsManagerImpl.class);
        withManager(PermissionsManagerImpl.class);
        withManager(QuestsManagerImpl.class);
        withManager(QuestsConditionsManagerImpl.class);
        withManager(RanksManagerImpl.class);
        withManager(RewardsManagerImpl.class);
        withManager(RewardsCollectablesManagerImpl.class);
        withManager(RewardsGalaxygatesManagerImpl.class);
        withManager(RewardsNpcsManagerImpl.class);
        withManager(RewardsQuestsManagerImpl.class);
        withManager(RewardsShipsManagerImpl.class);
        withManager(RewardsVouchersManagerImpl.class);
        withManager(ServerLogsManagerImpl.class);
        withManager(ShipsManagerImpl.class);
        withManager(SkilltreeLevelsManagerImpl.class);
        withManager(SkilltreeSkillsManagerImpl.class);
        withManager(SkilltreeUnlocksManagerImpl.class);
        withManager(SkylabModulesManagerImpl.class);
        withManager(TechfactoryCostsManagerImpl.class);
        withManager(TechfactoryDronesManagerImpl.class);
        withManager(TechfactoryItemsManagerImpl.class);
        withManager(TradeItemsManagerImpl.class);
        withManager(UsersManagerImpl.class);
        withManager(VouchersManagerImpl.class);
        withManager(VouchersRedeemLogsManagerImpl.class);
        withComponent(AccountsSqlAdapter.class);
        withComponent(AccountsBanksSqlAdapter.class);
        withComponent(AccountsBanksLogsSqlAdapter.class);
        withComponent(AccountsClansRolesSqlAdapter.class);
        withComponent(AccountsConfigurationsSqlAdapter.class);
        withComponent(AccountsConfigurationsAccountsItemsSqlAdapter.class);
        withComponent(AccountsDestroysSqlAdapter.class);
        withComponent(AccountsDronesSqlAdapter.class);
        withComponent(AccountsGalaxygatesSqlAdapter.class);
        withComponent(AccountsHangarsSqlAdapter.class);
        withComponent(AccountsHistorySqlAdapter.class);
        withComponent(AccountsItemsSqlAdapter.class);
        withComponent(AccountsMessagesSqlAdapter.class);
        withComponent(AccountsPetsSqlAdapter.class);
        withComponent(AccountsQuestsSqlAdapter.class);
        withComponent(AccountsRankingsSqlAdapter.class);
        withComponent(AccountsShipsSqlAdapter.class);
        withComponent(AccountsSkillsSqlAdapter.class);
        withComponent(AccountsSkylabsSqlAdapter.class);
        withComponent(AccountsTechfactoriesSqlAdapter.class);
        withComponent(AccountsTechfactoryItemsSqlAdapter.class);
        withComponent(ClansSqlAdapter.class);
        withComponent(ClansApplicationsSqlAdapter.class);
        withComponent(ClansBanksSqlAdapter.class);
        withComponent(ClansBanksLogsSqlAdapter.class);
        withComponent(ClansBattlestationsSqlAdapter.class);
        withComponent(ClansBattlestationsItemsSqlAdapter.class);
        withComponent(ClansBattlestationsLogsSqlAdapter.class);
        withComponent(ClansDiplomaciesSqlAdapter.class);
        withComponent(ClansMessagesSqlAdapter.class);
        withComponent(ClansNewsSqlAdapter.class);
        withComponent(ClansRankingSqlAdapter.class);
        withComponent(ClansRolesSqlAdapter.class);
        withComponent(ClansRolesPermissionsSqlAdapter.class);
        withComponent(CollectablesSqlAdapter.class);
        withComponent(EventsSqlAdapter.class);
        withComponent(FactionsSqlAdapter.class);
        withComponent(GalaxygatesSqlAdapter.class);
        withComponent(GalaxygatesGgSpinsSqlAdapter.class);
        withComponent(GalaxygatesGgWavesSqlAdapter.class);
        withComponent(GalaxygatesProbabilitiesSqlAdapter.class);
        withComponent(GalaxygatesSpawnsSqlAdapter.class);
        withComponent(GalaxygatesSpinsSqlAdapter.class);
        withComponent(GalaxygatesStagesSqlAdapter.class);
        withComponent(GalaxygatesStagesSpawnsSqlAdapter.class);
        withComponent(GalaxygatesWavesSqlAdapter.class);
        withComponent(InvitationCodesSqlAdapter.class);
        withComponent(InvitationCodesRedeemLogsSqlAdapter.class);
        withComponent(ItemsSqlAdapter.class);
        withComponent(KeyValueSqlAdapter.class);
        withComponent(LevelsSqlAdapter.class);
        withComponent(LevelsUpgradesSqlAdapter.class);
        withComponent(MapsSqlAdapter.class);
        withComponent(MapsNpcsSqlAdapter.class);
        withComponent(MapsPortalsSqlAdapter.class);
        withComponent(MapsStationsSqlAdapter.class);
        withComponent(ModeratorsSqlAdapter.class);
        withComponent(ModeratorsLogsSqlAdapter.class);
        withComponent(ModeratorsRolesSqlAdapter.class);
        withComponent(ModeratorsRolesPermissionsSqlAdapter.class);
        withComponent(NewsSqlAdapter.class);
        withComponent(NpcsSqlAdapter.class);
        withComponent(PermissionsSqlAdapter.class);
        withComponent(QuestsSqlAdapter.class);
        withComponent(QuestsConditionsSqlAdapter.class);
        withComponent(RanksSqlAdapter.class);
        withComponent(RewardsSqlAdapter.class);
        withComponent(RewardsCollectablesSqlAdapter.class);
        withComponent(RewardsGalaxygatesSqlAdapter.class);
        withComponent(RewardsNpcsSqlAdapter.class);
        withComponent(RewardsQuestsSqlAdapter.class);
        withComponent(RewardsShipsSqlAdapter.class);
        withComponent(RewardsVouchersSqlAdapter.class);
        withComponent(ServerLogsSqlAdapter.class);
        withComponent(ShipsSqlAdapter.class);
        withComponent(SkilltreeLevelsSqlAdapter.class);
        withComponent(SkilltreeSkillsSqlAdapter.class);
        withComponent(SkilltreeUnlocksSqlAdapter.class);
        withComponent(SkylabModulesSqlAdapter.class);
        withComponent(TechfactoryCostsSqlAdapter.class);
        withComponent(TechfactoryDronesSqlAdapter.class);
        withComponent(TechfactoryItemsSqlAdapter.class);
        withComponent(TradeItemsSqlAdapter.class);
        withComponent(UsersSqlAdapter.class);
        withComponent(VouchersSqlAdapter.class);
        withComponent(VouchersRedeemLogsSqlAdapter.class);
    }

    @Override
    public KalaazuApplication build(Injector injector) {
        return injector.getOrThrow(KalaazuApplication.class);
    }
}