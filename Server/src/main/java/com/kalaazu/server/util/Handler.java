package com.kalaazu.server.util;

import com.kalaazu.server.netty.GameSession;

/**
 * @author manulaiko <manulaiko@gmail.com>
 */
public interface Handler {
    boolean canHandle(Packet packet);

    void handle(Packet packet, GameSession session);
}
