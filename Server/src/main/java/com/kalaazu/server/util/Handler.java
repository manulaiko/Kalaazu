package com.kalaazu.server.util;

import com.kalaazu.server.netty.GameSession;
import com.kalaazu.server.packets.Command;
import lombok.SneakyThrows;

/**
 * Abstract handler.
 * =================
 *
 * Base class for all packet handlers.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
public abstract class Handler<T extends Command> {
    public abstract short getId();

    @SneakyThrows
    public void handle(Packet packet, GameSession session) {
        var command = getClazz().getDeclaredConstructor()
                .newInstance();
        command.read(packet);

        handle(command, session);
    }

    public abstract void handle(T packet, GameSession session);
    public abstract Class<T> getClazz();
}
