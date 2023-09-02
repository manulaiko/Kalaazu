package com.kalaazu.server.netty;

import com.kalaazu.server.netty.event.BroadcastPacketEvent;
import com.kalaazu.server.netty.event.BroadcastPacketsEvent;
import com.kalaazu.server.netty.event.SendPacketEvent;
import com.kalaazu.server.netty.event.SendPacketsEvent;
import com.kalaazu.server.util.Handler;
import com.kalaazu.server.util.Packet;
import io.netty.channel.Channel;
import io.netty.channel.ChannelId;
import io.netty.channel.group.ChannelGroup;
import io.netty.channel.group.DefaultChannelGroup;
import io.netty.util.concurrent.GlobalEventExecutor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Channel manager.
 * ================
 *
 * Manages the actions related to channels.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Component
@Slf4j
@RequiredArgsConstructor
public class ChannelManager {
    private final ChannelGroup channels = new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);
    private final Map<ChannelId, GameSession> sessions = new ConcurrentHashMap<>();

    private final Map<String, Handler> handlers;

    private void send(ChannelId channelId, Packet packet) {
        var channel = channels.find(channelId);
        if (channel != null) {
            channel.writeAndFlush(packet);
        }
    }

    private void send(ChannelId channelId, List<Packet> packet) {
        var channel = channels.find(channelId);
        if (channel != null) {
            packet.forEach(channel::write);
            channel.flush();
        }
    }

    private void send(Packet packet) {
        channels.writeAndFlush(packet);
    }

    private void send(List<Packet> packet) {
        packet.forEach(channels::write);
        channels.flush();
    }

    public void startGameSession(GameSession session, Channel channel) {
        sessions.put(session.getChannelId(), session);
        channels.add(channel);
    }

    public void endGameSession(GameSession session) {
        endGameSession(session.getChannelId());
    }

    public void endGameSession(ChannelId channelId) {
        sessions.remove(channelId);
    }

    /**
     * Process the incoming packet.
     *
     * @param packet Received packet.
     * @param channelId Channel that received the packet.
     */
    public void processPacket(Packet packet, ChannelId channelId) {
        var connection = sessions.get(channelId);
        if (connection == null) {
            log.info("Invalid connection {}, packet: {}", channelId, packet);

            return;
        }

        handlers.getOrDefault(packet.readString(), (p, gs) -> log.info("Received packet with no handler: {}", p))
                .handle(packet, connection);
    }

    @EventListener
    public void handleSendPacket(SendPacketEvent event) {
        this.send(event.getSession().getChannelId(), event.getPacket());
    }

    @EventListener
    public void handleSendPackets(SendPacketsEvent event) {
        this.send(event.getSession().getChannelId(), event.getPackets());
    }

    @EventListener
    public void handleBroadcastPacket(BroadcastPacketEvent event) {
        this.send(event.getPacket());
    }

    @EventListener
    public void handleBroadcastPacket(BroadcastPacketsEvent event) {
        this.send(event.getPackets());
    }
}