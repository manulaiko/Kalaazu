package com.kalaazu.server.netty;

import com.kalaazu.server.util.Packet;
import io.netty.channel.Channel;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;

import java.util.List;

/**
 * @author manulaiko <manulaiko@gmail.com>
 */
@AllArgsConstructor
public class GameSession {
    private final Channel channel;

    @SneakyThrows
    public void send(Packet packet) {
        channel.writeAndFlush(packet).sync();
    }

    public void send(List<Packet> packet) {
        packet.forEach(channel::write);
        channel.flush();
    }
}
