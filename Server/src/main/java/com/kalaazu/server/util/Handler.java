package com.kalaazu.server.util;

import com.kalaazu.server.commands.InCommand;
import com.kalaazu.server.netty.GameSession;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;

/**
 * Abstract handler.
 * =================
 * <p>
 * Base class for all packet handlers.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Slf4j
public abstract class Handler<T extends InCommand> {
    @Value("${app.game.packets.printIn}")
    private boolean printPackets;

    public abstract short getId();

    @SneakyThrows
    public void handle(Packet packet, GameSession session) {
        var command = getClazz().getDeclaredConstructor()
                .newInstance();
        command.read(packet);


        if (printPackets) {
            log.info("Packet received: <<<<< {}", command);
        }

        handle(command, session);
    }

    public abstract void handle(T packet, GameSession session);

    public abstract Class<T> getClazz();
}
