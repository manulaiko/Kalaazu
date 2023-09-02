package com.kalaazu.server.config;

import io.netty.channel.nio.NioEventLoopGroup;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

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
    public NioEventLoopGroup bossGroup() {
        return new NioEventLoopGroup();
    }

    @Bean
    public NioEventLoopGroup workerGroup() {
        return new NioEventLoopGroup();
    }
}
