package com.kalaazu.server.util;

import com.kalaazu.server.netty.GameSession;

/**
 * @author manulaiko <manulaiko@gmail.com>
 */
public interface Handler {
    short getId();

    void handle(Packet packet, GameSession session);
}
