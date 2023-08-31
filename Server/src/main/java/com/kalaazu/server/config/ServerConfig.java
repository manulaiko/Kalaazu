package com.kalaazu.server.config;

import com.kalaazu.server.netty.GameSession;
import io.netty.channel.ChannelId;
import io.netty.channel.nio.NioEventLoopGroup;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Server config.
 * ==============
 * <p>
 * Configuration beams for the game socket server.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Configuration
public class ServerConfig {
    @Bean
    public Map<ChannelId, GameSession> gameConnections() {
        return new ConcurrentHashMap<>();
    }

    @Bean
    public NioEventLoopGroup bossGroup() {
        return new NioEventLoopGroup();
    }

    @Bean
    public NioEventLoopGroup workerGroup() {
        return new NioEventLoopGroup();
    }
}
