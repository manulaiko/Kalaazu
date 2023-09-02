package com.kalaazu.server.config;

import com.kalaazu.server.event.SendPacketEvent;
import com.kalaazu.server.util.Handler;
import com.kalaazu.server.util.Packet;
import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

/**
 * Game configuration.
 * ===================
 * <p>
 * Configures the game server.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Configuration
@RequiredArgsConstructor
public class GameConfig {
    private final ApplicationContext ctx;

    @Bean
    public Map<String, Handler> handlers() {
        var map = new HashMap<String, Handler>();

        map.put("I", (p, s) -> {
            var id = p.readInt();
            ctx.publishEvent(new SendPacketEvent(s, new Packet("0|" + id), this));
        });

        return map;
    }
}
