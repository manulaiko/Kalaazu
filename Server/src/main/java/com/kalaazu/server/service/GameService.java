package com.kalaazu.server.service;

import com.kalaazu.server.netty.GameSession;
import com.kalaazu.server.netty.InboundHandler;
import com.kalaazu.server.util.Handler;
import com.kalaazu.server.util.Packet;
import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @author manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class GameService {
    private final Map<String, Handler> handlers;

    public void processPacket(Packet packet, GameSession gameSession) {
        handlers.getOrDefault(packet.readString(), (p, gs) -> log.info("Received packet with no handler: {}", p))
                .handle(packet, gameSession);
    }
}
