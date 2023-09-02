package com.kalaazu.server.netty.event;

import com.kalaazu.server.util.Packet;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

/**
 * Broadcast packet event.
 * =======================
 * <p>
 * Use this event to send packets to all available sessions.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Getter
public class BroadcastPacketEvent extends ApplicationEvent {
    private final Packet packet;

    public BroadcastPacketEvent(Packet packet, Object source) {
        super(source);

        this.packet = packet;
    }
}
