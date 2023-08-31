package com.kalaazu.server.config;

import com.kalaazu.server.util.Handler;
import com.kalaazu.server.util.Packet;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

/**
 * Game configuration.
 * ===================
 *
 * Configures the game server.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Configuration
public class GameConfig {
    @Bean
    public Map<String, Handler> handlers() {
        var map = new HashMap<String, Handler>();

        map.put("I", (p, s) -> {
            var id = p.readInt();
            s.send(new Packet("0|"+ id));
        });

        return map;
    }
}
