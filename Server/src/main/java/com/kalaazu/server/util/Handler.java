package com.kalaazu.server.util;

import com.kalaazu.server.commands.InCommand;
import com.kalaazu.server.netty.GameSession;
import lombok.SneakyThrows;

/**
 * Abstract handler.
 * =================
 * <p>
 * Base class for all packet handlers.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
public abstract class Handler<T extends InCommand> {
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
