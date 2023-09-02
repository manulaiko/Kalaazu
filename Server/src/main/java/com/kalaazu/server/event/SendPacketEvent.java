package com.kalaazu.server.event;

import com.kalaazu.server.netty.GameSession;
import com.kalaazu.server.util.Packet;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

/**
 * Send packet event.
 * ==================
 * <p>
 * Use this event to send packets to the given game session.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Getter
public class SendPacketEvent extends ApplicationEvent {
    private final GameSession session;
    private final Packet packet;

    public SendPacketEvent(GameSession session, Packet packet, Object source) {
        super(source);

        this.session = session;
        this.packet = packet;
    }
}
