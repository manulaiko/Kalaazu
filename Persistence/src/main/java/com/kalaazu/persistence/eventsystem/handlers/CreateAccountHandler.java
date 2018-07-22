package com.kalaazu.persistence.eventsystem.handlers;

import com.kalaazu.eventsystem.Handler;
import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.*;
import com.kalaazu.persistence.database.entities.accounts.AccountsImpl;
import com.kalaazu.persistence.database.entities.accounts_banks.AccountsBanksImpl;
import com.kalaazu.persistence.database.entities.accounts_configurations.AccountsConfigurationsImpl;
import com.kalaazu.persistence.database.entities.accounts_configurations_accounts_items.AccountsConfigurationsAccountsItemsImpl;
import com.kalaazu.persistence.database.entities.accounts_galaxygates.AccountsGalaxygatesImpl;
import com.kalaazu.persistence.database.entities.accounts_hangars.AccountsHangarsImpl;
import com.kalaazu.persistence.database.entities.accounts_items.AccountsItemsImpl;
import com.kalaazu.persistence.database.entities.accounts_messages.AccountsMessagesImpl;
import com.kalaazu.persistence.database.entities.accounts_rankings.AccountsRankingsImpl;
import com.kalaazu.persistence.database.entities.accounts_ships.AccountsShipsImpl;
import com.kalaazu.persistence.database.entities.accounts_techfactories.AccountsTechfactoriesImpl;
import com.kalaazu.persistence.database.entities.factions.FactionsImpl;
import com.kalaazu.persistence.database.entities.ships.ShipsImpl;
import com.kalaazu.persistence.database.mappers.MessageStatus;
import com.kalaazu.util.StringUtils;
import io.vertx.core.json.JsonObject;
import io.vertx.core.logging.Logger;
import io.vertx.core.logging.LoggerFactory;

import java.util.ArrayList;

/**
 * Register handler.
 * =================
 *
 * Registers an user in the database.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class CreateAccountHandler extends Handler {
    /**
     * Console logger.
     */
    public static final Logger logger = LoggerFactory.getLogger(RegisterHandler.class);

    @Override
    public void handle() {
        String name       = super.get("name");
        int    usersID    = super.get("usersId");
        byte   factionsID = super.get("factionsId");

        var u = Database.getInstance()
                        .find(usersID, Users.class);

        if (!u.isPresent()) {
            super.fail("The user does not exist!");

            return;
        }


        var user           = u.get();
        var account        = this.addAccount(user, name, factionsID);
        var items          = this.addItems(account);
        var ship           = this.addShip(account);
        var hangar         = this.addHangar(account, ship);
        var configurations = this.addConfigurations(account, hangar, items);
        this.addGalaxyGates(account);
        this.addTechfactories(account);
        this.addBank(account);
        this.addRanking(account);
        this.addMessage(account);

        super.reply(
                new JsonObject().put("isError", false)
                                .put("sessionId", account.getSessionId())
        );
    }

    /**
     * Adds the techfactory to the account.
     *
     * @param account New account
     */
    private void addTechfactories(Accounts account) {
        var techfactory = new AccountsTechfactoriesImpl();
        techfactory.setAccountsId(account.getId());

        Database.getInstance()
                .create(techfactory, AccountsTechfactories.class);
    }

    /**
     * Adds the ranking to the account.
     *
     * @param account New account.
     */
    private void addRanking(Accounts account) {
        var ranking = new AccountsRankingsImpl();
        ranking.setAccountsId(account.getId());

        Database.getInstance()
                .create(ranking, AccountsRankings.class);
    }

    /**
     * Adds the galaxy gates to the account.
     *
     * @param account New account.
     */
    private void addGalaxyGates(Accounts account) {
        var gates = Database.getInstance()
                            .all(Galaxygates.class);

        gates.forEach(gg -> {
            var gate = new AccountsGalaxygatesImpl();
            gate.setAccountsId(account.getId())
                .setGalaxygatesId(gg.getId());

            Database.getInstance()
                    .create(gate, AccountsGalaxygates.class);
        });
    }

    /**
     * Adds the bank to the account.
     *
     * @param account New account.
     */
    private void addBank(Accounts account) {
        var bank = new AccountsBanksImpl();
        bank.setAccountsId(account.getId());

        Database.getInstance()
                .create(bank, AccountsBanks.class);
    }

    @Override
    protected void onFail(Exception exception) {
        RegisterHandler.logger.warn("Couldn't register account!", exception);

        super.fail("Couldn't register account!");
    }


    /**
     * Creates the welcome message for the new account.
     *
     * @param account New account.
     */
    private void addMessage(Accounts account) {
        var message = new AccountsMessagesImpl();
        message.setToStatus(MessageStatus.UNREAD)
               .setToAccountsId(account.getId())
               .setFromAccountsId(1) // System
               .setFromStatus(MessageStatus.DELETED)
               .setTitle("Welcome to Kalaazu!")
               .setText(
                       "Hello space pilot!\n" +
                       "\n" +
                       "Welcome to Kalaazu, the next generation of private servers.\n" +
                       "Have fun and be sure to follow the rules, if you have any doubt you can reach us on our discord.\n" +
                       "\n" +
                       "-Kalaazu dev. team."
               );

        Database.getInstance()
                .create(message, AccountsMessages.class);
    }

    /**
     * Adds the configurations to the hangar.
     *
     * @param account New account.
     * @param hangar  New hangar.
     * @param items   Configuration items.
     */
    private ArrayList<AccountsConfigurations> addConfigurations(
            Accounts account, AccountsHangars hangar, ArrayList<AccountsItems> items
    ) {
        var configurations = new ArrayList<AccountsConfigurations>();

        configurations.add(
                new AccountsConfigurationsImpl().setConfigurationId((byte) 1)
                                                .setName("Configuration 1")
                                                .setAccountsHangarsId(hangar.getId())
        );
        configurations.add(
                new AccountsConfigurationsImpl().setConfigurationId((byte) 2)
                                                .setName("Configuration 2")
                                                .setAccountsHangarsId(hangar.getId())
        );

        configurations.forEach(c -> {
            c = Database.getInstance()
                        .create(c, AccountsConfigurations.class);

            for (AccountsItems i: items) {
                var cItem = new AccountsConfigurationsAccountsItemsImpl();
                cItem.setAccountsConfigurationsId(c.getId())
                     .setAccountsItemsId(i.getId());

                if (
                        i.getItemsId() == 164 ||
                        i.getItemsId() == 109 ||
                        i.getItemsId() == 121
                ) {
                    Database.getInstance()
                            .create(cItem, AccountsConfigurationsAccountsItems.class);
                }
            }

        });

        return configurations;
    }

    /**
     * Creates and returns a ship for the account.
     *
     * @param account New account.
     *
     * @return Created ship.
     */
    private AccountsShips addShip(Accounts account) {
        var phoenix = Database.getInstance()
                              .find(1, Ships.class)
                              .orElse(new ShipsImpl());
        var faction = account.faction()
                             .orElse(new FactionsImpl());
        var ship = new AccountsShipsImpl();

        ship.setAccountsId(account.getId())
            .setGfx(phoenix.getGfx())
            .setHealth(phoenix.getHealth())
            .setShipsId(phoenix.getId())
            .setMapsId(faction.getLowMapsId())
            .setPosition(faction.getLowMapsPosition());

        return Database.getInstance()
                       .create(ship, AccountsShips.class);
    }

    /**
     * Creates and returns an hangar for the account.
     *
     * @param account New account.
     *
     * @return Created hangar.
     */
    private AccountsHangars addHangar(Accounts account, AccountsShips ship) {
        var hangar = new AccountsHangarsImpl();
        hangar.setAccountsId(account.getId())
              .setName("HANGAR")
              .setAccountsShipsId(ship.getId());

        return Database.getInstance()
                       .create(hangar, AccountsHangars.class);
    }

    /**
     * Adds the starting items to the account.
     *
     * @param account New account.
     */
    private ArrayList<AccountsItems> addItems(Accounts account) {
        var items = new ArrayList<AccountsItems>();

        // credits
        items.add(
                new AccountsItemsImpl().setAmount(100_000)
                                       .setItemsId((short) 1)
        );

        // uridium
        items.add(
                new AccountsItemsImpl().setAmount(30_000)
                                       .setItemsId((short) 2)
        );

        // jackpot
        items.add(
                new AccountsItemsImpl().setAmount(0)
                                       .setItemsId((short) 3)
        );

        // experience
        items.add(
                new AccountsItemsImpl().setAmount(0)
                                       .setItemsId((short) 4)
        );

        // honor
        items.add(
                new AccountsItemsImpl().setAmount(0)
                                       .setItemsId((short) 5)
        );

        // jump voucher
        items.add(
                new AccountsItemsImpl().setAmount(0)
                                       .setItemsId((short) 6)
        );

        // repair voucher
        items.add(
                new AccountsItemsImpl().setAmount(10)
                                       .setItemsId((short) 7)
        );

        // galaxygate voucher
        items.add(
                new AccountsItemsImpl().setAmount(100)
                                       .setItemsId((short) 8)
        );

        // logfiles
        items.add(
                new AccountsItemsImpl().setAmount(30)
                                       .setItemsId((short) 173)
        );

        // a weapon
        items.add(
                new AccountsItemsImpl().setItemsId((short) 121)
        );

        // a shield
        items.add(
                new AccountsItemsImpl().setItemsId((short) 109)
        );

        // a repair bot
        items.add(
                new AccountsItemsImpl().setItemsId((short) 164)
        );

        items.forEach(i -> {
            i.setAccountsId(account.getId())
             .setLevelsId((byte) 1);

            Database.getInstance()
                    .create(i, AccountsItems.class);
        });

        return items;
    }

    /**
     * Creates the account for the given user.
     *
     * @param user       Given user.
     * @param name       Account name.
     * @param factionsID Faction ID.
     *
     * @return Created account.
     */
    private Accounts addAccount(Users user, String name, byte factionsID) {
        var account = new AccountsImpl();

        account.setUsersId(user.getId())
               .setName(name)
               .setFactionsId(factionsID)
               .setLevelsId((byte) 1)
               .setRanksId((byte) 1)
               .setSessionId(StringUtils.sessionId());

        return Database.getInstance()
                       .create(account, Accounts.class);
    }
}
