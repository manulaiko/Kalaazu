package com.kalaazu.server.handler;

import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.entity.AccountsEntity;
import com.kalaazu.persistence.entity.AccountsSettingsEntity;
import com.kalaazu.persistence.service.UsersService;
import com.kalaazu.server.netty.GameSession;
import com.kalaazu.server.netty.event.EndGameSessionEvent;
import com.kalaazu.server.netty.event.EndGameSessionIfEvent;
import com.kalaazu.server.netty.event.SendPacketsEvent;
import com.kalaazu.server.util.Handler;
import com.kalaazu.server.util.Packet;
import com.kalaazu.server.util.ServerCommands;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.stream.Collectors;

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
public class LoginRequestHandler implements Handler {
    private final UsersService users;
    private final ApplicationContext ctx;

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
            var i = item.getItemsByItemsId();
            var amount = item.getAmount();

            switch (i.getId()) {
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

        return new CalculatedItems(exp, hon, cre, uri, jpt, cargo);
    }

    @Override
    public boolean canHandle(Packet packet) {
        return packet.readString().equalsIgnoreCase(ServerCommands.LOGIN_REQUEST);
    }

    @Override
    public void handle(Packet packet, GameSession session) {
        var userId = packet.readInt();
        var sessionId = packet.readString();

        var loginPackets = new ArrayList<Packet>();

        log.info("Incoming login request from userID {} with sessionID {}", userId, sessionId);

        var user = users.find(userId);
        if (user == null) {
            log.info("Invalid user ID {}", userId);

            return;
        }

        var account = user.getAccounts()
                .stream()
                .filter(a -> a.getSessionId().equalsIgnoreCase(sessionId))
                .findFirst()
                .orElse(null);

        if (account == null) {
            log.info("Invalid session ID {}", sessionId);

            ctx.publishEvent(new EndGameSessionEvent(session, this));

            return;
        }

        // End previous sessions of this account.
        ctx.publishEvent(new EndGameSessionIfEvent((s) -> {
            var acc = s.getValue().getAccount();

            return (acc != null && acc.getId() == account.getId());
        }, this));

        session.setAccount(account);

        var hangar = account.getAccountsHangarsByAccountsHangarsId();
        var ship = hangar.getAccountsShipsByAccountsShipsId();
        var config = hangar.getAccountsConfigurationsByAccountsConfigurationsId();
        var position = new Vector2(ship.getPosition());

        var premium = account.getPremiumDate() != null && account.getPremiumDate().before(Timestamp.from(Instant.now()));

        var items = getCalculatedItems(account);

        var clan = account.getClansByClansId();
        var clanId = 0;
        var clanTag = "";

        if (clan != null) {
            clanId = clan.getId();
            clanTag = clan.getTag();
        }

        var faction = account.getFactionsByFactionsId();
        var factionId = 0;

        if (faction != null) {
            factionId = faction.getId();
        }

        var mapId = ship.getMapsByMapsId().getId();

        var settings = account.getAccountsSettings();

        settings.parallelStream()
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

        ctx.publishEvent(new SendPacketsEvent(session, loginPackets, this));
    }

    private record CalculatedItems(
            long exp,
            long hon,
            long cre,
            long uri,
            long jpt,
            long cargo
    ) {
    }
}
