package com.kalaazu.server.handler;

import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.entity.AccountsItemsEntity;
import com.kalaazu.persistence.service.UsersService;
import com.kalaazu.server.netty.GameSession;
import com.kalaazu.server.netty.event.EndGameSessionEvent;
import com.kalaazu.server.netty.event.EndGameSessionIfEvent;
import com.kalaazu.server.netty.event.SendPacketEvent;
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
import java.util.Arrays;

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

    @Override
    public boolean canHandle(Packet packet) {
        return packet.readString().equalsIgnoreCase(ServerCommands.LOGIN_REQUEST);
    }

    @Override
    public void handle(Packet packet, GameSession session) {
        var userId = packet.readInt();
        var sessionId = packet.readString();

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

        var exp = 0L;
        var hon = 0L;
        var cre = 0L;
        var uri = 0L;
        var jpt = 0L;

        for (AccountsItemsEntity item : account.getAccountsItems()) {
            var i = item.getItemsByItemsId();
            var amount = item.getAmount();

            switch (i.getId()) {
                case 1 -> cre = amount;
                case 2 -> uri = amount;
                case 3 -> jpt = amount;
                case 4 -> exp = amount;
                case 5 -> hon = amount;
            }
        }

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

        var heroInit = new Packet();
        heroInit.write(
                ServerCommands.HERO_INIT,
                account.getId(),
                account.getName(),
                ship.getGfx(),
                config.getSpeed(),
                config.getShield(), // TODO calculate ship current shield
                config.getShield(),
                ship.getHealth(),
                ship.getHealth(), // TODO calculate configuration max health
                0, // TODO calculate ship current cargo
                ship.getShipsByShipsId().getCargo(),
                position.getX(),
                position.getY(),
                mapId,
                factionId,
                clanId,
                100_000, // TODO calculate account batteries
                10_000, // TODO calculate account rockets
                3, // FE
                premium ? 1 : 0,
                exp,
                hon,
                account.getLevelsByLevelsId().getId(),
                cre,
                uri,
                jpt,
                account.getRanksByRanksId().getId(),
                clanTag,
                0, // TODO account rings
                0, // idk,
                0 // TODO account cloacked
        );

        var mapInit = new Packet();
        mapInit.write(
                ServerCommands.MAP_INIT,
                mapId
        );

        ctx.publishEvent(new SendPacketsEvent(session, Arrays.asList(heroInit, mapInit), this));
    }
}
