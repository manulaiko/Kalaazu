package com.kalaazu.server.util;

import com.kalaazu.server.netty.GameSession;

/**
 * @author manulaiko <manulaiko@gmail.com>
 */
public interface Handler {
    void handle(Packet packet, GameSession session);
}
