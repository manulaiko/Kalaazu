module kalaazu.persistence {
    exports com.kalaazu.persistence;
    exports com.kalaazu.persistence.database.entities;
    exports com.kalaazu.persistence.eventsystem.events;

    opens com.kalaazu.persistence.database.entities.accounts to injector;
    opens com.kalaazu.persistence.database.entities.accounts_banks to injector;
    opens com.kalaazu.persistence.database.entities.accounts_banks_logs to injector;
    opens com.kalaazu.persistence.database.entities.accounts_clans_roles to injector;
    opens com.kalaazu.persistence.database.entities.accounts_configurations to injector;
    opens com.kalaazu.persistence.database.entities.accounts_configurations_accounts_items to injector;
    opens com.kalaazu.persistence.database.entities.accounts_destroys to injector;
    opens com.kalaazu.persistence.database.entities.accounts_drones to injector;
    opens com.kalaazu.persistence.database.entities.accounts_galaxygates to injector;
    opens com.kalaazu.persistence.database.entities.accounts_hangars to injector;
    opens com.kalaazu.persistence.database.entities.accounts_history to injector;
    opens com.kalaazu.persistence.database.entities.accounts_items to injector;
    opens com.kalaazu.persistence.database.entities.accounts_messages to injector;
    opens com.kalaazu.persistence.database.entities.accounts_pets to injector;
    opens com.kalaazu.persistence.database.entities.accounts_quests to injector;
    opens com.kalaazu.persistence.database.entities.accounts_rankings to injector;
    opens com.kalaazu.persistence.database.entities.accounts_ships to injector;
    opens com.kalaazu.persistence.database.entities.accounts_skills to injector;
    opens com.kalaazu.persistence.database.entities.accounts_skylabs to injector;
    opens com.kalaazu.persistence.database.entities.accounts_techfactories to injector;
    opens com.kalaazu.persistence.database.entities.accounts_techfactory_items to injector;
    opens com.kalaazu.persistence.database.entities.clans to injector;
    opens com.kalaazu.persistence.database.entities.clans_applications to injector;
    opens com.kalaazu.persistence.database.entities.clans_banks to injector;
    opens com.kalaazu.persistence.database.entities.clans_banks_logs to injector;
    opens com.kalaazu.persistence.database.entities.clans_battlestations to injector;
    opens com.kalaazu.persistence.database.entities.clans_battlestations_items to injector;
    opens com.kalaazu.persistence.database.entities.clans_battlestations_logs to injector;
    opens com.kalaazu.persistence.database.entities.clans_diplomacies to injector;
    opens com.kalaazu.persistence.database.entities.clans_messages to injector;
    opens com.kalaazu.persistence.database.entities.clans_news to injector;
    opens com.kalaazu.persistence.database.entities.clans_ranking to injector;
    opens com.kalaazu.persistence.database.entities.clans_roles to injector;
    opens com.kalaazu.persistence.database.entities.clans_roles_permissions to injector;
    opens com.kalaazu.persistence.database.entities.collectables to injector;
    opens com.kalaazu.persistence.database.entities.events to injector;
    opens com.kalaazu.persistence.database.entities.factions to injector;
    opens com.kalaazu.persistence.database.entities.galaxygates to injector;
    opens com.kalaazu.persistence.database.entities.galaxygates_gg_spins to injector;
    opens com.kalaazu.persistence.database.entities.galaxygates_gg_waves to injector;
    opens com.kalaazu.persistence.database.entities.galaxygates_probabilities to injector;
    opens com.kalaazu.persistence.database.entities.galaxygates_spawns to injector;
    opens com.kalaazu.persistence.database.entities.galaxygates_spins to injector;
    opens com.kalaazu.persistence.database.entities.galaxygates_stages to injector;
    opens com.kalaazu.persistence.database.entities.galaxygates_stages_spawns to injector;
    opens com.kalaazu.persistence.database.entities.galaxygates_waves to injector;
    opens com.kalaazu.persistence.database.entities.invitation_codes to injector;
    opens com.kalaazu.persistence.database.entities.invitation_codes_redeem_logs to injector;
    opens com.kalaazu.persistence.database.entities.items to injector;
    opens com.kalaazu.persistence.database.entities.key_value to injector;
    opens com.kalaazu.persistence.database.entities.levels to injector;
    opens com.kalaazu.persistence.database.entities.levels_upgrades to injector;
    opens com.kalaazu.persistence.database.entities.maps to injector;
    opens com.kalaazu.persistence.database.entities.maps_npcs to injector;
    opens com.kalaazu.persistence.database.entities.maps_portals to injector;
    opens com.kalaazu.persistence.database.entities.maps_stations to injector;
    opens com.kalaazu.persistence.database.entities.moderators to injector;
    opens com.kalaazu.persistence.database.entities.moderators_logs to injector;
    opens com.kalaazu.persistence.database.entities.moderators_roles to injector;
    opens com.kalaazu.persistence.database.entities.moderators_roles_permissions to injector;
    opens com.kalaazu.persistence.database.entities.news to injector;
    opens com.kalaazu.persistence.database.entities.npcs to injector;
    opens com.kalaazu.persistence.database.entities.permissions to injector;
    opens com.kalaazu.persistence.database.entities.quests to injector;
    opens com.kalaazu.persistence.database.entities.quests_conditions to injector;
    opens com.kalaazu.persistence.database.entities.ranks to injector;
    opens com.kalaazu.persistence.database.entities.rewards to injector;
    opens com.kalaazu.persistence.database.entities.rewards_collectables to injector;
    opens com.kalaazu.persistence.database.entities.rewards_galaxygates to injector;
    opens com.kalaazu.persistence.database.entities.rewards_npcs to injector;
    opens com.kalaazu.persistence.database.entities.rewards_ships to injector;
    opens com.kalaazu.persistence.database.entities.rewards_quests to injector;
    opens com.kalaazu.persistence.database.entities.rewards_vouchers to injector;
    opens com.kalaazu.persistence.database.entities.server_logs to injector;
    opens com.kalaazu.persistence.database.entities.ships to injector;
    opens com.kalaazu.persistence.database.entities.skilltree_levels to injector;
    opens com.kalaazu.persistence.database.entities.skilltree_skills to injector;
    opens com.kalaazu.persistence.database.entities.skilltree_unlocks to injector;
    opens com.kalaazu.persistence.database.entities.skylab_modules to injector;
    opens com.kalaazu.persistence.database.entities.techfactory_costs to injector;
    opens com.kalaazu.persistence.database.entities.techfactory_drones to injector;
    opens com.kalaazu.persistence.database.entities.techfactory_items to injector;
    opens com.kalaazu.persistence.database.entities.trade_items to injector;
    opens com.kalaazu.persistence.database.entities.users to injector;
    opens com.kalaazu.persistence.database.entities.vouchers to injector;
    opens com.kalaazu.persistence.database.entities.vouchers_redeem_logs to injector;
    opens com.kalaazu.persistence.database.entities.accounts.generated to injector;
    opens com.kalaazu.persistence.database.entities.accounts_banks.generated to injector;
    opens com.kalaazu.persistence.database.entities.accounts_banks_logs.generated to injector;
    opens com.kalaazu.persistence.database.entities.accounts_clans_roles.generated to injector;
    opens com.kalaazu.persistence.database.entities.accounts_configurations.generated to injector;
    opens com.kalaazu.persistence.database.entities.accounts_configurations_accounts_items.generated to injector;
    opens com.kalaazu.persistence.database.entities.accounts_destroys.generated to injector;
    opens com.kalaazu.persistence.database.entities.accounts_drones.generated to injector;
    opens com.kalaazu.persistence.database.entities.accounts_galaxygates.generated to injector;
    opens com.kalaazu.persistence.database.entities.accounts_hangars.generated to injector;
    opens com.kalaazu.persistence.database.entities.accounts_history.generated to injector;
    opens com.kalaazu.persistence.database.entities.accounts_items.generated to injector;
    opens com.kalaazu.persistence.database.entities.accounts_messages.generated to injector;
    opens com.kalaazu.persistence.database.entities.accounts_pets.generated to injector;
    opens com.kalaazu.persistence.database.entities.accounts_quests.generated to injector;
    opens com.kalaazu.persistence.database.entities.accounts_rankings.generated to injector;
    opens com.kalaazu.persistence.database.entities.accounts_ships.generated to injector;
    opens com.kalaazu.persistence.database.entities.accounts_skills.generated to injector;
    opens com.kalaazu.persistence.database.entities.accounts_skylabs.generated to injector;
    opens com.kalaazu.persistence.database.entities.accounts_techfactories.generated to injector;
    opens com.kalaazu.persistence.database.entities.accounts_techfactory_items.generated to injector;
    opens com.kalaazu.persistence.database.entities.clans.generated to injector;
    opens com.kalaazu.persistence.database.entities.clans_applications.generated to injector;
    opens com.kalaazu.persistence.database.entities.clans_banks.generated to injector;
    opens com.kalaazu.persistence.database.entities.clans_banks_logs.generated to injector;
    opens com.kalaazu.persistence.database.entities.clans_battlestations.generated to injector;
    opens com.kalaazu.persistence.database.entities.clans_battlestations_items.generated to injector;
    opens com.kalaazu.persistence.database.entities.clans_battlestations_logs.generated to injector;
    opens com.kalaazu.persistence.database.entities.clans_diplomacies.generated to injector;
    opens com.kalaazu.persistence.database.entities.clans_messages.generated to injector;
    opens com.kalaazu.persistence.database.entities.clans_news.generated to injector;
    opens com.kalaazu.persistence.database.entities.clans_ranking.generated to injector;
    opens com.kalaazu.persistence.database.entities.clans_roles.generated to injector;
    opens com.kalaazu.persistence.database.entities.clans_roles_permissions.generated to injector;
    opens com.kalaazu.persistence.database.entities.collectables.generated to injector;
    opens com.kalaazu.persistence.database.entities.events.generated to injector;
    opens com.kalaazu.persistence.database.entities.factions.generated to injector;
    opens com.kalaazu.persistence.database.entities.galaxygates.generated to injector;
    opens com.kalaazu.persistence.database.entities.galaxygates_gg_spins.generated to injector;
    opens com.kalaazu.persistence.database.entities.galaxygates_gg_waves.generated to injector;
    opens com.kalaazu.persistence.database.entities.galaxygates_probabilities.generated to injector;
    opens com.kalaazu.persistence.database.entities.galaxygates_spawns.generated to injector;
    opens com.kalaazu.persistence.database.entities.galaxygates_spins.generated to injector;
    opens com.kalaazu.persistence.database.entities.galaxygates_stages.generated to injector;
    opens com.kalaazu.persistence.database.entities.galaxygates_stages_spawns.generated to injector;
    opens com.kalaazu.persistence.database.entities.galaxygates_waves.generated to injector;
    opens com.kalaazu.persistence.database.entities.invitation_codes.generated to injector;
    opens com.kalaazu.persistence.database.entities.invitation_codes_redeem_logs.generated to injector;
    opens com.kalaazu.persistence.database.entities.items.generated to injector;
    opens com.kalaazu.persistence.database.entities.key_value.generated to injector;
    opens com.kalaazu.persistence.database.entities.levels.generated to injector;
    opens com.kalaazu.persistence.database.entities.levels_upgrades.generated to injector;
    opens com.kalaazu.persistence.database.entities.maps.generated to injector;
    opens com.kalaazu.persistence.database.entities.maps_npcs.generated to injector;
    opens com.kalaazu.persistence.database.entities.maps_portals.generated to injector;
    opens com.kalaazu.persistence.database.entities.maps_stations.generated to injector;
    opens com.kalaazu.persistence.database.entities.moderators.generated to injector;
    opens com.kalaazu.persistence.database.entities.moderators_logs.generated to injector;
    opens com.kalaazu.persistence.database.entities.moderators_roles.generated to injector;
    opens com.kalaazu.persistence.database.entities.moderators_roles_permissions.generated to injector;
    opens com.kalaazu.persistence.database.entities.news.generated to injector;
    opens com.kalaazu.persistence.database.entities.npcs.generated to injector;
    opens com.kalaazu.persistence.database.entities.permissions.generated to injector;
    opens com.kalaazu.persistence.database.entities.quests.generated to injector;
    opens com.kalaazu.persistence.database.entities.quests_conditions.generated to injector;
    opens com.kalaazu.persistence.database.entities.ranks.generated to injector;
    opens com.kalaazu.persistence.database.entities.rewards.generated to injector;
    opens com.kalaazu.persistence.database.entities.rewards_collectables.generated to injector;
    opens com.kalaazu.persistence.database.entities.rewards_galaxygates.generated to injector;
    opens com.kalaazu.persistence.database.entities.rewards_npcs.generated to injector;
    opens com.kalaazu.persistence.database.entities.rewards_ships.generated to injector;
    opens com.kalaazu.persistence.database.entities.rewards_quests.generated to injector;
    opens com.kalaazu.persistence.database.entities.rewards_vouchers.generated to injector;
    opens com.kalaazu.persistence.database.entities.server_logs.generated to injector;
    opens com.kalaazu.persistence.database.entities.ships.generated to injector;
    opens com.kalaazu.persistence.database.entities.skilltree_levels.generated to injector;
    opens com.kalaazu.persistence.database.entities.skilltree_skills.generated to injector;
    opens com.kalaazu.persistence.database.entities.skilltree_unlocks.generated to injector;
    opens com.kalaazu.persistence.database.entities.skylab_modules.generated to injector;
    opens com.kalaazu.persistence.database.entities.techfactory_costs.generated to injector;
    opens com.kalaazu.persistence.database.entities.techfactory_drones.generated to injector;
    opens com.kalaazu.persistence.database.entities.techfactory_items.generated to injector;
    opens com.kalaazu.persistence.database.entities.trade_items.generated to injector;
    opens com.kalaazu.persistence.database.entities.users.generated to injector;
    opens com.kalaazu.persistence.database.entities.vouchers.generated to injector;
    opens com.kalaazu.persistence.database.entities.vouchers_redeem_logs.generated to injector;
    opens com.kalaazu.persistence.database to injector;
    opens com.kalaazu.persistence.database.generated to injector;

    requires kalaazu.utils;
    requires vertx.core;
    requires java.sql;
    requires runtime.core;
    requires runtime.field;
    requires runtime.typemapper;
    requires runtime.bulk;
    requires runtime.config;
    requires annotation;
    requires function;
    requires invariant;
    requires injector;
    requires logger;
    requires lazy;
    requires mapstream;
    requires singleton.stream;
    requires tuple;
}