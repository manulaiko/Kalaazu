package com.kalaazu.server.netty;

import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.netty.event.*;
import com.kalaazu.server.util.Handler;
import com.kalaazu.server.util.Packet;
import io.netty.channel.Channel;
import io.netty.channel.ChannelId;
import io.netty.channel.group.ChannelGroup;
import io.netty.channel.group.DefaultChannelGroup;
import io.netty.util.concurrent.GlobalEventExecutor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Channel manager.
 * ================
 * <p>
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

    private final List<Handler<?>> packetHandlers;

    @Value("${app.game.printPackets}")
    private boolean printPackets;

    private void send(ChannelId channelId, OutCommand command) {
        var channel = channels.find(channelId);
        if (channel == null) {
            return;
        }

        if (printPackets) {
            log.info("Packet sent: >>>>> {}", command.getId());
        }

        var p = new Packet();
        command.write(p);

        channel.writeAndFlush(p);
    }

    private void send(ChannelId channelId, List<OutCommand> commands) {
        var channel = channels.find(channelId);
        if (channel == null) {
            return;
        }

        if (printPackets) {
            commands.forEach(p -> log.info("Packet sent: <<<< {}", p.getId()));
        }

        commands.stream()
                .map(c -> {
                    var p = new Packet();
                    c.write(p);

                    return p;
                })
                .forEach(channels::write);
    }

    private void send(OutCommand command) {
        var packet = new Packet();
        command.write(packet);

        channels.writeAndFlush(packet);
    }

    private void send(List<OutCommand> packet) {
        packet.stream()
                .map(c -> {
                    var p = new Packet();
                    c.write(p);

                    return p;
                })
                .forEach(channels::write);
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
        channels.close(channel -> channel.id().equals(channelId));
    }

    /**
     * Process the incoming packet.
     *
     * @param packet    Received packet.
     * @param channelId Channel that received the packet.
     */
    public void processPacket(Packet packet, ChannelId channelId) {
        var connection = sessions.get(channelId);
        if (connection == null) {
            log.info("Invalid connection {}, packet: {}", channelId, packet);

            return;
        }

        var packetId = packet.readShort();

        if (printPackets) {
            log.info("Packet received: <<<<< {}", packetId);
        }

        packetHandlers.stream()
                .filter(p -> p.getId() == packetId)
                .findFirst()
                .ifPresentOrElse(
                        (h) -> h.handle(packet, connection),
                        () -> log.info("Received packet with no handler: {}", packetId)
                );
    }

    // Event Handlers //

    @EventListener
    public void handleSendPacket(SendCommandEvent event) {
        this.send(event.getSession().getChannelId(), event.getCommand());
    }

    @EventListener
    public void handleSendPackets(SendCommandsEvent event) {
        this.send(event.getSession().getChannelId(), event.getCommands());
    }

    @EventListener
    public void handleBroadcastPacket(BroadcastCommandEvent event) {
        this.send(event.getCommand());
    }

    @EventListener
    public void handleBroadcastPacket(BroadcastCommandsEvent event) {
        this.send(event.getCommands());
    }

    @EventListener
    public void handleEndGameSessionIf(EndGameSessionIfEvent event) {
        var condition = event.getCondition();

        sessions.entrySet()
                .stream()
                .filter(condition::apply)
                .map(Map.Entry::getKey)
                .forEach(this::endGameSession);
    }

    @EventListener
    public void handleEndGameSession(EndGameSessionEvent event) {
        this.endGameSession(event.getSession());
    }
}
