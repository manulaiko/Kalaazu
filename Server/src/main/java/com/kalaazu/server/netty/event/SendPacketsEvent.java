package com.kalaazu.server.netty.event;

import com.kalaazu.server.netty.GameSession;
import com.kalaazu.server.util.Packet;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

import java.util.List;

/**
 * Send packets event.
 * ===================
 * <p>
 * Use this event to send packets to the given game session.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Getter
public class SendPacketsEvent extends ApplicationEvent {
    private final GameSession session;
    private final List<Packet> packets;

    public SendPacketsEvent(GameSession session, List<Packet> packets, Object source) {
        super(source);

        this.session = session;
        this.packets = packets;
    }
}
