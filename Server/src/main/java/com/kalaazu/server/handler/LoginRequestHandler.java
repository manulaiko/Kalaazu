package com.kalaazu.server.handler;

import com.kalaazu.persistence.entity.AccountsEntity;
import com.kalaazu.persistence.service.UsersService;
import com.kalaazu.server.commands.in.LoginRequest;
import com.kalaazu.server.commands.out.map.ShipInitializationCommand;
import com.kalaazu.server.event.GameSessionStartedEvent;
import com.kalaazu.server.netty.GameSession;
import com.kalaazu.server.event.EndGameSessionEvent;
import com.kalaazu.server.event.EndGameSessionIfEvent;
import com.kalaazu.server.event.SendCommandEvent;
import com.kalaazu.server.service.GameSettingsService;
import com.kalaazu.server.util.Handler;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;

/**
 * Login request handler.
 * ======================
 * <p>
 * Handles an incoming login request packet (LOGIN|USER_ID|SESSION_ID).
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Component
@Slf4j
@RequiredArgsConstructor
public class LoginRequestHandler extends Handler<LoginRequest> {
    @Getter
    private final short id = LoginRequest.ID;

    @Getter
    private final Class<LoginRequest> clazz = LoginRequest.class;

    private final ApplicationContext ctx;
    private final UsersService users;
    private final GameSettingsService gameSettingsService;

    private static CalculatedItems getCalculatedItems(AccountsEntity account) {
        // Stats
        var exp = 0L;
        var hon = 0L;
        var cre = 0L;
        var uri = 0L;
        var jpt = 0L;

        // Cargo
        var prometium = 0L;
        var endurium = 0L;
        var terbium = 0L;
        var prometid = 0L;
        var duranium = 0L;
        var promerium = 0L;
        var xenomit = 0L;
        var seprom = 0L;
        var palladium = 0L;

        var cargo = 0L;

        // Ammo
        var lbc10 = 0L;
        var mvb25 = 0L;
        var mcb50 = 0L;
        var ucb100 = 0L;
        var sab50 = 0L;
        var rsb75 = 0L;
        var cbo100 = 0L;
        var job100 = 0L;

        var ammo = 0L;

        // Rockets
        var r310 = 0L;
        var plt2026 = 0L;
        var plt2021 = 0L;
        var plt3030 = 0L;
        var dcr250 = 0L;
        var bdr1211 = 0L;
        var wizx = 0L;
        var pld8 = 0L;

        var rockets = 0L;

        // Hellstorm
        var cbr100 = 0L;
        var eco10 = 0L;
        var hstrm01 = 0L;
        var sar01 = 0L;
        var sar02 = 0L;
        var ubr100 = 0L;
        var shg01 = 0L;
        var shg02 = 0L;
        var bdr1212 = 0L;

        var hellstorm = 0;

        // Mines
        var acm01 = 0L;
        var ddm01 = 0L;
        var empm01 = 0L;
        var sabm01 = 0L;
        var rb02 = 0L;
        var rbe01 = 0L;
        var rbe02 = 0L;
        var sl01 = 0L;

        var mines = 0L;

        for (var item : account.getAccountsItems()) {
            var i = item.getItemsId();
            var amount = item.getAmount();

            switch (i) {
                case 1 -> cre = amount;
                case 2 -> uri = amount;
                case 3 -> jpt = amount;
                case 4 -> exp = amount;
                case 5 -> hon = amount;

                case 236 -> prometium = amount;
                case 237 -> endurium = amount;
                case 238 -> terbium = amount;
                case 239 -> prometid = amount;
                case 240 -> duranium = amount;
                case 241 -> xenomit = amount;
                case 242 -> promerium = amount;
                case 243 -> seprom = amount;
                case 244 -> palladium = amount;
            }
        }

        cargo = prometium + endurium + terbium + prometid + duranium + promerium + seprom + palladium;

        return new CalculatedItems(
                exp,
                hon,
                cre,
                uri,
                jpt,
                prometium,
                endurium,
                terbium,
                prometid,
                duranium,
                promerium,
                xenomit,
                seprom,
                palladium,
                cargo,
                lbc10,
                mvb25,
                mcb50,
                ucb100,
                sab50,
                rsb75,
                cbo100,
                job100,
                r310,
                plt2026,
                plt2021,
                plt3030,
                dcr250,
                bdr1211,
                wizx,
                pld8,
                cbr100,
                eco10,
                hstrm01,
                sar01,
                sar02,
                ubr100,
                shg01,
                shg02,
                bdr1212,
                acm01,
                ddm01,
                empm01,
                sabm01,
                rb02,
                rbe01,
                rbe02,
                sl01
        );
    }

    @Override
    public void handle(LoginRequest packet, GameSession session) {
        log.info("Incoming login request from userID {} with sessionID {}", packet.getUserId(), packet.getSessionId());

        var user = users.find(packet.getUserId());
        if (user == null) {
            log.info("Invalid user ID {}", packet.getUserId());

            return;
        }

        var account = user.getAccounts()
                .stream()
                .filter(a -> a.getSessionId().equalsIgnoreCase(packet.getSessionId()))
                .findFirst()
                .orElse(null);

        if (account == null) {
            log.info("Invalid session ID {}", packet.getSessionId());

            ctx.publishEvent(new EndGameSessionEvent(session, this));

            return;
        }

        // End previous sessions of this account.
        ctx.publishEvent(new EndGameSessionIfEvent((s) -> {
            var acc = s.getValue().getAccount();

            return (acc != null && acc.getId() == account.getId());
        }, this));

        session.setAccount(account);

        this.sendInitialPackets(account, session);
        ctx.publishEvent(new GameSessionStartedEvent(session, this));
    }

    private void sendInitialPackets(AccountsEntity account, GameSession session) {
        gameSettingsService.sendSettings(account.getAccountsSettings(), session);

        var hangar = account.getAccountsHangarsByAccountsHangarsId();
        var ship = hangar.getAccountsShipsByAccountsShipsId();
        var config = hangar.getAccountsConfigurationsByAccountsConfigurationsId();

        session.setShip(ship);
        session.setMapId(ship.getMapsId());
        session.setHangar(hangar);
        session.setConfiguration(config);

        var premium = account.getPremiumDate() != null && account.getPremiumDate().before(Timestamp.from(Instant.now()));

        var items = getCalculatedItems(account);

        var clan = account.getClansByClansId();
        var clanId = 0;
        var clanTag = "";

        if (clan != null) {
            clanId = clan.getId();
            clanTag = clan.getTag();
        }

        var shipInitialization = new ShipInitializationCommand(
                account.getId(),
                account.getName(),
                ship.getShipsByShipsId().getItemsByItemsId().getLootId(),
                config.getSpeed(),
                ship.getShield(),
                config.getShield(),
                ship.getHealth(),
                config.getHealth(),
                (int) items.cargo,
                ship.getShipsByShipsId().getCargo(),
                ship.getNanohull(),
                ship.getShipsByShipsId().getHealth(),
                ship.getPosition().getX(),
                ship.getPosition().getY(),
                ship.getMapsId(),
                account.getFactionsId(),
                clanId,
                3,
                premium,
                items.exp,
                items.hon,
                account.getLevelsId(),
                items.cre,
                items.uri,
                (int) items.jpt,
                account.getRanksId(),
                clanTag,
                0, // TODO account rings
                true,
                false, // TODO account cloacked
                new ArrayList<>()
        );

        ctx.publishEvent(new SendCommandEvent(session, shipInitialization, this));

/*        settings.parallelStream()
                .forEach(s -> loginPackets.add(new Packet(
                        s.getName().equals("SET") ? ServerCommands.SET_ATTRIBUTE : ServerCommands.CLIENT_SETTING,
                        s.getName(),
                        s.getValue()
                )));


        //ID del user|Nombre?|naveID|vel|escudoMin|escudoMax|hpMin|hpMax|cargaMin|cargaMax|pos1|pos2|
        //mapaID|factionID(empresa?)|clanID|maxLaser|maxMisil|expansion(lookArmas)|premium|experiencia|honor|
        //nivel|creditos|uridiums|jackpot|rango?|tituloClan|galaxyGatesFin(estrellitas)|Invisibilidad

        var heroInit = new Packet(
                ServerCommands.HERO_INIT,
                account.getId(),
                account.getName(),
                ship.getGfx(),
                config.getSpeed(),
                ship.getShield(),
                config.getShield(),
                ship.getHealth(),
                config.getHealth(),
                items.cargo(), // TODO calculate ship current cargo
                ship.getShipsByShipsId().getCargo(),
                position.getX(),
                position.getY(),
                mapId,
                factionId,
                clanId,
                ship.getShipsByShipsId().getBatteries(),
                ship.getShipsByShipsId().getRockets(),
                3, // Expansion type
                premium ? 1 : 0,
                items.exp(),
                items.hon(),
                account.getLevelsByLevelsId().getId(),
                items.cre(),
                items.uri(),
                items.jpt(),
                account.getRanksByRanksId().getId(),
                clanTag,
                0, // TODO account rings
                0, // Unused
                0 // TODO account cloacked
        );

        var mapInit = new Packet(
                ServerCommands.MAP_INIT,
                mapId
        );

        var handshake = new Packet(
                ServerCommands.CLIENT_SETTING,
                ServerCommands.MAP_READY_HANDSHAKE
        );

        loginPackets.add(heroInit);
        loginPackets.add(mapInit);
        loginPackets.add(handshake);

        ctx.publishEvent(new SendPacketsEvent(session, loginPackets, this));*/
    }

    private record CalculatedItems(
            long exp,
            long hon,
            long cre,
            long uri,
            long jpt,

            // Cargo
            long prometium,
            long endurium,
            long terbium,
            long prometid,
            long duranium,
            long promerium,
            long xenomit,
            long seprom,
            long palladium,

            long cargo,

            // Ammo
            long lbc10,
            long mvb25,
            long mcb50,
            long ucb100,
            long sab50,
            long rsb75,
            long cbo100,
            long job100,

            // Rockets
            long r310,
            long plt2026,
            long plt2021,
            long plt3030,
            long dcr250,
            long bdr1211,
            long wizx,
            long pld8,

            // Hellstorm
            long cbr100,
            long eco10,
            long hstrm01,
            long sar01,
            long sar02,
            long ubr100,
            long shg01,
            long shg02,
            long bdr1212,

            // Mines
            long acm01,
            long ddm01,
            long empm01,
            long sabm01,
            long rb02,
            long rbe01,
            long rbe02,
            long sl01
    ) {
    }
}
