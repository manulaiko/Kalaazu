package com.kalaazu.server.netty.event;

import com.kalaazu.server.util.Packet;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

import java.util.List;

/**
 * Broadcast packets event.
 * ========================
 * <p>
 * Use this event to send packets to all available sessions.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Getter
public class BroadcastPacketsEvent extends ApplicationEvent {
    private final List<Packet> packets;

    public BroadcastPacketsEvent(List<Packet> packets, Object source) {
        super(source);

        this.packets = packets;
    }
}
