package com.kalaazu.cms.service;

import com.kalaazu.persistence.entity.*;
import com.kalaazu.persistence.service.*;
import com.kalaazu.util.StringUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Register service.
 * =================
 * <p>
 * Provides the logic for user registration.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class RegisterService {
    private final UsersService users;
    private final AccountsService accounts;
    private final LevelsService levels;
    private final AccountsHangarsService hangars;
    private final ItemsService items;
    private final AccountsItemsService accountsItems;
    private final AccountsShipsService accountsShips;
    private final AccountsSettingsService accountsSettings;
    private final ShipsService ships;
    private final FactionsService factions;
    private final AccountsConfigurationsService accountsConfigs;
    private final AccountsConfigurationsAccountsItemsService accountsConfigItems;
    private final RanksService ranks;

    private Map<Short, Integer> getDefaultStartingItems() {
        var items = new HashMap<Short, Integer>();

        // Credits
        items.put((short) 1, 150_000);
        // Uridium
        items.put((short) 2, 10_000);
        // Jackpot
        items.put((short) 3, 0);
        // Exp
        items.put((short) 4, 0);
        // Honor
        items.put((short) 5, 0);

        // LCB-10
        items.put((short) 59, 10_000);
        // R-310
        items.put((short) 87, 1_000);

        // LF-1
        items.put((short) 121, 1);
        // REP-1
        items.put((short) 164, 1);
        return items;
    }

    private Map<String, String> getDefaultSettings() {
        var settings = new HashMap<String, String>();

        settings.put("SET", "1|1|1|1|1|1|1|1|1|1|1|0|0|1|1|0|0|1|1|0|0|1|1|1|1");
        settings.put("MINIMAP_SCALE", "11");
        settings.put("DISPLAY_PLAYER_NAMES", "1");
        settings.put("DISPLAY_CHAT", "1");
        settings.put("PLAY_MUSIC", "0");
        settings.put("PLAY_SFX", "0");
        settings.put("BAR_STATUS", "23,1,24,1,25,1,26,1,27,1");
        settings.put("WINDOW_SETTINGS,4", "0,444,5,1,1,674,5,1,3,972,676,1,5,10,10,1,10,2,420,1,13,315,212,0,20,2,723,1,23,1059,200,1,24,412,187,0");
        settings.put("AUTO_REFINEMENT", "1");
        settings.put("QUICKSLOT_STOP_ATTACK", "1");
        settings.put("DOUBLECLICK_ATTACK", "1");
        settings.put("AUTO_START", "0");
        settings.put("DISPLAY_NOTIFICATIONS", "1");
        settings.put("SHOW_DRONES", "1");
        settings.put("DISPLAY_WINDOW_BACKGROUND", "1");
        settings.put("ALWAYS_DRAGGABLE_WINDOWS", "1");
        settings.put("PRELOAD_USER_SHIPS", "1");
        settings.put("QUALITY_PRESETTING", "3");
        settings.put("QUALITY_CUSTOMIZED", "0");
        settings.put("QUALITY_BACKGROUND", "3");
        settings.put("QUALITY_POIZONE", "3");
        settings.put("QUALITY_SHIP", "3");
        settings.put("QUALITY_ENGINE", "3");
        settings.put("QUALITY_COLLECTABLE", "3");
        settings.put("QUALITY_ATTACK", "3");
        settings.put("QUALITY_EFFECT", "3");
        settings.put("QUALITY_EXPLOSION", "3");
        settings.put("QUICKBAR_SLOT", "3,4,5,6,7,39,11,12,13,57");
        settings.put("SLOTMENU_POSITION", "313,451");
        settings.put("SLOTMENU_ORDER", "0");

        return settings;
    }

    /**
     * Performs the user registration.
     *
     * @param username User name.
     * @param password User password.
     * @param email    User email.
     * @return Registered account.
     * @throws Exception If something goes wrong.
     */
    public AccountsEntity register(String username, String password, String email) throws Exception {
        var u = username.trim();
        var p = password.trim();
        var e = email.trim();

        if (u.isEmpty() || p.isEmpty() || e.isEmpty()) {
            throw new Exception("All fields are required!");
        }

        if (!StringUtils.isEmail(e)) {
            throw new Exception("Invalid email!");
        }

        var user = users.register(u, p, e);
        var account = this.createAccount(user);

        var ship = this.createShip(account);
        var hangar = this.createHangar(account, ship);
        var items = this.createItems(account);
        var configs = this.createConfigs(hangar);
        var settings = this.createSettings(account);

        this.addItemsToConfig(items, configs);
        this.setActiveConfig(configs.values().iterator().next(), hangar);
        this.setActiveHangar(hangar, account);

        account.addShip(ship);
        items.forEach(account::addItem);
        account.addHangar(hangar);
        settings.forEach(account::addSetting);

        return account;
    }

    /**
     * Sets the active configuration of the hangar.
     *
     * @param config Active configuration.
     * @param hangar Configuration owner.
     */
    private void setActiveConfig(AccountsConfigurationsEntity config, AccountsHangarsEntity hangar) {
        hangar.setAccountsConfigurationsByAccountsConfigurationsId(config);

        this.hangars.update(hangar);
    }

    /**
     * Sets the active hangar of the account.
     *
     * @param hangar  Active hangar.
     * @param account Hangar owner.
     */
    private void setActiveHangar(AccountsHangarsEntity hangar, AccountsEntity account) {
        account.setAccountsHangarsByAccountsHangarsId(hangar);

        this.accounts.update(account);
    }

    /**
     * Adds the items to the configurations.
     *
     * @param items   Account items.
     * @param configs Account configurations.
     */
    private void addItemsToConfig(List<AccountsItemsEntity> items, Map<Integer, AccountsConfigurationsEntity> configs) {
        configs.forEach((configId, config) -> items.forEach((item) -> {
            var configItem = new AccountsConfigurationsAccountsItemsEntity();
            configItem.setAccountsItemsByAccountsItemsId(item);
            configItem.setAccountsConfigurationsByAccountsConfigurationsId(config);

            this.accountsConfigItems.create(configItem);

            // Update config stats
            var i = item.getItemsByItemsId();
            switch (i.getType()) {
                case LASER -> config.setDamage(config.getDamage() + i.getBonus());
                case SHIELD_GENERATOR -> config.setShield(config.getShield() + i.getBonus());
                case SPEED_GENERATOR -> config.setSpeed((short) (config.getSpeed() + i.getBonus()));
            }
        }));
    }

    /**
     * Creates the account for the user.
     *
     * @param user User that will own the account.
     * @return Created account.
     */
    private AccountsEntity createAccount(UsersEntity user) {
        var account = new AccountsEntity();
        account.setName(user.getName());
        account.setSessionId(StringUtils.sessionId());

        account.setUsersByUsersId(user);
        account.setLevelsByLevelsId(this.levels.find((byte) 1));
        account.setFactionsByFactionsId(this.factions.find((byte) 1)); // Default to MMO
        account.setRanksByRanksId(this.ranks.find((byte) 1));

        return this.accounts.create(account);
    }

    /**
     * Creates the initial items of the account.
     *
     * @param account Account that will own the items.
     */
    private List<AccountsItemsEntity> createItems(AccountsEntity account) {
        var ret = new ArrayList<AccountsItemsEntity>();
        var items = getDefaultStartingItems();

        items.forEach((id, amount) -> {
            var item = new AccountsItemsEntity();
            item.setAmount(amount);
            item.setAccountsByAccountsId(account);
            item.setItemsByItemsId(this.items.find(id));
            item.setLevelsByLevelsId(this.levels.find((byte) 1));

            var i = this.accountsItems.create(item);

            ret.add(i);
        });

        return ret;
    }

    /**
     * Creates the default account settings.
     *
     * @param account Account that will own the settings.
     */
    private List<AccountsSettingsEntity> createSettings(AccountsEntity account) {
        var ret = new ArrayList<AccountsSettingsEntity>();
        var settings = getDefaultSettings();

        settings.forEach((key, value) -> {
            var set = new AccountsSettingsEntity();
            set.setType(1);
            set.setName(key);
            set.setValue(value);
            set.setAccountsByAccountsId(account);

            var id = this.accountsSettings.create(set);

            ret.add(id);
        });

        return ret;
    }

    /**
     * Creates the ship of the account.
     *
     * @param account Account that will own the ship.
     * @return Created ship.
     */
    private AccountsShipsEntity createShip(AccountsEntity account) {
        var phoenix = this.ships.find((byte) 1); // Phoenix

        var ship = new AccountsShipsEntity();
        ship.setShipsByShipsId(phoenix);
        ship.setHealth(phoenix.getHealth());
        ship.setGfx(phoenix.getGfx());

        ship.setAccountsByAccountsId(account);
        ship.setMapsByMapsId(account.getFactionsByFactionsId().getLowMapsByLowMapsId());
        ship.setPosition(account.getFactionsByFactionsId().getLowMapsPosition());

        return this.accountsShips.create(ship);
    }

    /**
     * Creates the account configurations.
     *
     * @param hangar Account hangar that will own the configuration.
     * @return Created configurations.
     */
    private Map<Integer, AccountsConfigurationsEntity> createConfigs(AccountsHangarsEntity hangar) {
        var configs = new HashMap<Integer, AccountsConfigurationsEntity>();

        for (byte i = 0; i < 2; i++) {
            var config = new AccountsConfigurationsEntity();
            config.setConfigurationId(i);
            config.setAccountsHangarsByAccountsHangarsId(hangar);

            var c = this.accountsConfigs.create(config);

            configs.put(c.getId(), c);
        }

        return configs;
    }

    /**
     * Creates the hangar of the account.
     *
     * @param account Account that will own the hangar.
     * @param ship    Account ship.
     * @return Created hangar.
     */
    private AccountsHangarsEntity createHangar(AccountsEntity account, AccountsShipsEntity ship) {
        var hangar = new AccountsHangarsEntity();
        hangar.setAccountsByAccountsId(account);
        hangar.setAccountsShipsByAccountsShipsId(ship);

        return this.hangars.create(hangar);
    }
}
