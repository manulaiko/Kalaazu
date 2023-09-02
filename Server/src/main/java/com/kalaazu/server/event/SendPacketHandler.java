package com.kalaazu.server.event;

import com.kalaazu.server.netty.ChannelManager;
import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

/**
 * Send packet handler.
 * ====================
 * <p>
 * Handles the sending of packets to a given session.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Component
@RequiredArgsConstructor
public class SendPacketHandler implements ApplicationListener<SendPacketEvent> {
    private final ChannelManager channelManager;

    /**
     * Handle an application event.
     *
     * @param event the event to respond to
     */
    @Override
    public void onApplicationEvent(SendPacketEvent event) {
        channelManager.send(event.getSession().getChannelId(), event.getPacket());
    }
}
