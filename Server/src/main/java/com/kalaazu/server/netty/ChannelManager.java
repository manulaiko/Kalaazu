package com.kalaazu.server.netty;

import com.kalaazu.server.util.Handler;
import com.kalaazu.server.util.Packet;
import io.netty.channel.Channel;
import io.netty.channel.ChannelId;
import io.netty.channel.group.ChannelGroup;
import io.netty.channel.group.DefaultChannelGroup;
import io.netty.util.concurrent.GlobalEventExecutor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author manulaiko <manulaiko@gmail.com>
 */
@Component
@Slf4j
@RequiredArgsConstructor
public class ChannelManager {
    private final ChannelGroup channels = new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);
    private final Map<ChannelId, GameSession> sessions = new ConcurrentHashMap<>();

    private final Map<String, Handler> handlers;

    public void send(ChannelId channelId, Packet packet) {
        var channel = channels.find(channelId);
        if (channel != null) {
            channel.writeAndFlush(packet);
        }
    }

    public void send(ChannelId channelId, List<Packet> packet) {
        var channel = channels.find(channelId);
        if (channel != null) {
            packet.forEach(channel::write);
            channel.flush();
        }
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

    public void processPacket(Packet packet, ChannelId channelId) {
        var connection = sessions.get(channelId);
        if (connection == null) {
            log.info("Invalid connection {}, packet: {}", channelId, packet);

            return;
        }

        handlers.getOrDefault(packet.readString(), (p, gs) -> log.info("Received packet with no handler: {}", p))
                .handle(packet, connection);
    }
}
