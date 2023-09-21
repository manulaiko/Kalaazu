package com.kalaazu.server.handler;

import com.kalaazu.server.commands.in.LegacyCommand;
import com.kalaazu.server.netty.GameSession;
import com.kalaazu.server.util.Handler;
import com.kalaazu.server.util.LegacyHandler;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Legacy packet handler.
 * ======================
 * <p>
 * Handler for the legacy packets.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Slf4j
@Component
public class LegacyPacketHandler extends Handler<LegacyCommand> {
    private final short id = LegacyCommand.ID;
    private final Class<LegacyCommand> clazz = LegacyCommand.class;

    private final List<LegacyHandler> handlers;

    @Override
    public void handle(LegacyCommand packet, GameSession session) {
        var p = packet.getPacket();

        var id = p.readString();

        handlers.stream()
                .filter(h -> h.getId().equalsIgnoreCase(id))
                .findFirst()
                .ifPresent(h -> h.handle(p, session));
    }
}
