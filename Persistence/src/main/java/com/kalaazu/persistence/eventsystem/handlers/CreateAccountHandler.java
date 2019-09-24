package com.kalaazu.persistence.eventsystem.handlers;

import com.kalaazu.eventsystem.Handler;
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
    public void handle() {/*
        String name       = super.get("name");
        int    usersID    = super.get("usersId");
        byte   factionsID = super.get("factionsId");

        var u = Database.instance()
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
                                .put("sessionId", account.sessionId())
        );
    }

    *//**
     * Adds the techfactory to the account.
     *
     * @param account New account
     *//*
    private void addTechfactories(Accounts account) {
        var techfactory = new AccountsTechfactoriesImpl();
        techfactory.accountsId(account.id());

        Database.instance()
                .create(techfactory, AccountsTechfactories.class);
    }

    *//**
     * Adds the ranking to the account.
     *
     * @param account New account.
     *//*
    private void addRanking(Accounts account) {
        var ranking = new AccountsRankingsImpl();
        ranking.accountsId(account.id());

        Database.instance()
                .create(ranking, AccountsRankings.class);
    }

    *//**
     * Adds the galaxy gates to the account.
     *
     * @param account New account.
     *//*
    private void addGalaxyGates(Accounts account) {
        var gates = Database.instance()
                            .all(Galaxygates.class);

        gates.forEach(gg -> {
            var gate = new AccountsGalaxygatesImpl();
            gate.accountsId(account.id())
                .galaxygatesId(gg.id());

            Database.instance()
                    .create(gate, AccountsGalaxygates.class);
        });
    }

    *//**
     * Adds the bank to the account.
     *
     * @param account New account.
     *//*
    private void addBank(Accounts account) {
        var bank = new AccountsBanksImpl();
        bank.accountsId(account.id());

        Database.instance()
                .create(bank, AccountsBanks.class);
    }

    @Override
    protected void onFail(Exception exception) {
        RegisterHandler.logger.warn("Couldn't register account!", exception);

        super.fail("Couldn't register account!");
    }


    *//**
     * Creates the welcome message for the new account.
     *
     * @param account New account.
     *//*
    private void addMessage(Accounts account) {
        var message = new AccountsMessagesImpl();
        message.toStatus(MessageStatus.UNREAD)
               .toAccountsId(account.id())
               .fromAccountsId(1) // System
               .fromStatus(MessageStatus.DELETED)
               .title("Welcome to Kalaazu!")
               .text(
                       "Hello space pilot!\n" +
                       "\n" +
                       "Welcome to Kalaazu, the next generation of private servers.\n" +
                       "Have fun and be sure to follow the rules, if you have any doubt you can reach us on our discord.\n" +
                       "\n" +
                       "-Kalaazu dev. team."
               );

        Database.instance()
                .create(message, AccountsMessages.class);
    }

    *//**
     * Adds the configurations to the hangar.
     *
     * @param account New account.
     * @param hangar  New hangar.
     * @param items   Configuration items.
     *//*
    private ArrayList<AccountsConfigurations> addConfigurations(
            Accounts account, AccountsHangars hangar, ArrayList<AccountsItems> items
    ) {
        var configurations = new ArrayList<AccountsConfigurations>();

        configurations.add(
                new AccountsConfigurationsImpl().configurationId((byte) 1)
                                                .name("Configuration 1")
                                                .accountsHangarsId(hangar.id())
        );
        configurations.add(
                new AccountsConfigurationsImpl().configurationId((byte) 2)
                                                .name("Configuration 2")
                                                .accountsHangarsId(hangar.id())
        );

        configurations.forEach(c -> {
            c = Database.instance()
                        .create(c, AccountsConfigurations.class);

            for (AccountsItems i: items) {
                var cItem = new AccountsConfigurationsAccountsItemsImpl();
                cItem.accountsConfigurationsId(c.id())
                     .accountsItemsId(i.id());

                if (
                        i.itemsId() == 164 ||
                        i.itemsId() == 109 ||
                        i.itemsId() == 121
                ) {
                    Database.instance()
                            .create(cItem, AccountsConfigurationsAccountsItems.class);
                }
            }

        });

        return configurations;
    }

    *//**
     * Creates and returns a ship for the account.
     *
     * @param account New account.
     *
     * @return Created ship.
     *//*
    private AccountsShips addShip(Accounts account) {
        var phoenix = Database.instance()
                              .find(1, Ships.class)
                              .orElse(new ShipsImpl());
        var faction = account.faction()
                             .orElse(new FactionsImpl());
        var ship = new AccountsShipsImpl();

        ship.accountsId(account.id())
            .gfx(phoenix.gfx())
            .health(phoenix.health())
            .shipsId(phoenix.id())
            .mapsId(faction.lowMapsId())
            .position(faction.lowMapsPosition());

        return Database.instance()
                       .create(ship, AccountsShips.class);
    }

    *//**
     * Creates and returns an hangar for the account.
     *
     * @param account New account.
     *
     * @return Created hangar.
     *//*
    private AccountsHangars addHangar(Accounts account, AccountsShips ship) {
        var hangar = new AccountsHangarsImpl();
        hangar.accountsId(account.id())
              .name("HANGAR")
              .accountsShipsId(ship.id());

        return Database.instance()
                       .create(hangar, AccountsHangars.class);
    }

    *//**
     * Adds the starting items to the account.
     *
     * @param account New account.
     *//*
    private ArrayList<AccountsItems> addItems(Accounts account) {
        var items = new ArrayList<AccountsItems>();

        // credits
        items.add(
                new AccountsItemsImpl().amount(100_000)
                                       .itemsId((short) 1)
        );

        // uridium
        items.add(
                new AccountsItemsImpl().amount(30_000)
                                       .itemsId((short) 2)
        );

        // jackpot
        items.add(
                new AccountsItemsImpl().amount(0)
                                       .itemsId((short) 3)
        );

        // experience
        items.add(
                new AccountsItemsImpl().amount(0)
                                       .itemsId((short) 4)
        );

        // honor
        items.add(
                new AccountsItemsImpl().amount(0)
                                       .itemsId((short) 5)
        );

        // jump voucher
        items.add(
                new AccountsItemsImpl().amount(0)
                                       .itemsId((short) 6)
        );

        // repair voucher
        items.add(
                new AccountsItemsImpl().amount(10)
                                       .itemsId((short) 7)
        );

        // galaxygate voucher
        items.add(
                new AccountsItemsImpl().amount(100)
                                       .itemsId((short) 8)
        );

        // logfiles
        items.add(
                new AccountsItemsImpl().amount(30)
                                       .itemsId((short) 173)
        );

        // a weapon
        items.add(
                new AccountsItemsImpl().itemsId((short) 121)
        );

        // a shield
        items.add(
                new AccountsItemsImpl().itemsId((short) 109)
        );

        // a repair bot
        items.add(
                new AccountsItemsImpl().itemsId((short) 164)
        );

        items.forEach(i -> {
            i.accountsId(account.id())
             .levelsId((byte) 1);

            Database.instance()
                    .create(i, AccountsItems.class);
        });

        return items;
    }

    *//**
     * Creates the account for the given user.
     *
     * @param user       Given user.
     * @param name       Account name.
     * @param factionsID Faction ID.
     *
     * @return Created account.
     *//*
    private Accounts addAccount(Users user, String name, byte factionsID) {
        var account = new AccountsImpl();

        account.usersId(user.id())
               .name(name)
               .factionsId(factionsID)
               .levelsId((byte) 1)
               .ranksId((byte) 1)
               .sessionId(StringUtils.sessionId());

        return Database.instance()
                       .create(account, Accounts.class);*/
    }
}
