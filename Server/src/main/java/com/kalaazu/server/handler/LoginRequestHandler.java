package com.kalaazu.server.handler;

import com.kalaazu.persistence.service.UsersService;
import com.kalaazu.server.netty.GameSession;
import com.kalaazu.server.netty.event.EndGameSessionEvent;
import com.kalaazu.server.netty.event.EndGameSessionIfEvent;
import com.kalaazu.server.netty.event.SendPacketEvent;
import com.kalaazu.server.util.Handler;
import com.kalaazu.server.util.Packet;
import com.kalaazu.server.util.ServerCommands;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

/**
 * Login request handler.
 * ======================
 *
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

        ctx.publishEvent(new SendPacketEvent(session, new Packet("0|GUEST_PLEASE_REGISTER"), this));
    }
}
