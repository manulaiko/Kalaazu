package com.kalaazu.cms.service;

import com.kalaazu.persistence.entity.*;
import com.kalaazu.persistence.service.*;
import com.kalaazu.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Register service.
 * =================
 *
 * Provides the logic for user registration.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class RegisterService {
    @Autowired
    private UsersService users;

    @Autowired
    private AccountsService accounts;

    @Autowired
    private LevelsService levels;

    @Autowired
    private AccountsHangarsService hangars;

    @Autowired
    private ItemsService items;

    @Autowired
    private AccountsItemsService accountsItems;

    @Autowired
    private AccountsShipsService accountsShips;

    @Autowired
    private ShipsService ships;

    @Autowired
    private FactionsService factions;

    @Autowired
    private AccountsConfigurationsService accountsConfigs;

    @Autowired
    private AccountsConfigurationsAccountsItemsService accountsConfigItems;

    @Autowired
    private RanksService ranks;

    /**
     * Performs the user registration.
     *
     * @param username User name.
     * @param password User password.
     * @param email    User email.
     *
     * @return Registered account session ID.
     *
     * @throws Exception If something goes wrong.
     */
    public String register(String username, String password, String email) throws Exception {
        var u = username.trim();
        var p = password.trim();
        var e = email.trim();

        if (u.isEmpty() || p.isEmpty() || e.isEmpty()) {
            throw new Exception("All fields are required!");
        }

        var user    = users.register(u, p, e);
        var account = this.createAccount(user);

        var ship    = this.createShip(account);
        var hangar  = this.createHangar(account, ship);
        var items   = this.createItems(account);
        var configs = this.createConfigs(hangar);

        this.addItemsToConfig(items, configs);
        this.addConfigToHangar(configs.values().iterator().next(), hangar);
        this.addHangarToAccount(hangar, account);

        return account.getSessionId();
    }

    /**
     * Sets the active configuration of the hangar.
     *
     * @param config Active configuration.
     * @param hangar Configuration owner.
     */
    private void addConfigToHangar(AccountsConfigurationsEntity config, AccountsHangarsEntity hangar) {
        hangar.setAccountsConfigurationsByAccountsConfigurationsId(config);

        this.hangars.update(hangar);
    }

    /**
     * Sets the active hangar of the account.
     *
     * @param hangar  Active hangar.
     * @param account Hangar owner.
     */
    private void addHangarToAccount(AccountsHangarsEntity hangar, AccountsEntity account) {
        account.setAccountsHangarsByAccountsHangarsId(hangar);

        this.accounts.update(account);
    }

    /**
     * Adds the items to the configurations.
     *
     * @param items   Account items.
     * @param configs Account configurations.
     */
    private void addItemsToConfig(
            Map<Short, AccountsItemsEntity> items, Map<Integer, AccountsConfigurationsEntity> configs
    ) {
        configs.forEach((configId, config) -> items.forEach((itemId, item) -> {
            var configItem = new AccountsConfigurationsAccountsItemsEntity();
            configItem.setAccountsItemsByAccountsItemsId(item);
            configItem.setAccountsConfigurationsByAccountsConfigurationsId(config);

            this.accountsConfigItems.create(configItem);

            // Update config stats
            var i = item.getItemsByItemsId();
            switch (i.getType()) {
                case LASER:
                    config.setDamage(config.getDamage() + i.getBonus());

                    break;

                case SHIELD_GENERATOR:
                    config.setShield(config.getShield() + i.getBonus());

                    break;

                case SPEED_GENERATOR:
                    config.setSpeed((short) (config.getSpeed() + i.getBonus()));

                    break;
            }
        }));
    }

    /**
     * Creates the account for the user.
     *
     * @param user User that will own the account.
     *
     * @return Created account.
     */
    private AccountsEntity createAccount(UsersEntity user) {
        System.out.println("USER ID " + user.getId());
        System.out.println("User " + user);
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
    private Map<Short, AccountsItemsEntity> createItems(AccountsEntity account) {
        var ret   = new HashMap<Short, AccountsItemsEntity>();
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

        items.forEach((id, amount) -> {
            var item = new AccountsItemsEntity();
            item.setAmount(amount);
            item.setAccountsByAccountsId(account);
            item.setItemsByItemsId(this.items.find(id));
            item.setLevelsByLevelsId(this.levels.find((byte) 1));

            var i = this.accountsItems.create(item);

            ret.put((short) i.getId(), i);
        });

        return ret;
    }

    /**
     * Creates the ship of the account.
     *
     * @param account Account that will own the ship.
     *
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
     *
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
     *
     * @return Created hangar.
     */
    private AccountsHangarsEntity createHangar(AccountsEntity account, AccountsShipsEntity ship) {
        var hangar = new AccountsHangarsEntity();
        hangar.setAccountsByAccountsId(account);
        hangar.setAccountsShipsByAccountsShipsId(ship);

        return this.hangars.create(hangar);
    }
}
