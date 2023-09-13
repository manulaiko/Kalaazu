package com.kalaazu.server.util;

import com.kalaazu.server.netty.GameSession;

/**
 * Abstract legacy handler.
 * ========================
 * <p>
 * Base class for all legacy packet handlers.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
public interface LegacyHandler {
    String getId();

    void handle(LegacyPacket packet, GameSession session);
}
