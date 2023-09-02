package com.kalaazu.server.netty.event;

import com.kalaazu.server.handler.LoginRequestHandler;
import com.kalaazu.server.netty.GameSession;
import io.netty.channel.ChannelId;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

import java.util.Map;
import java.util.function.Function;

/**
 * End game session if event.
 * ==========================
 *
 * Ends the game session that matches the condition.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Getter
public class EndGameSessionIfEvent extends ApplicationEvent {
    private final Function<Map.Entry<ChannelId, GameSession>, Boolean> condition;

    public EndGameSessionIfEvent(Function<Map.Entry<ChannelId, GameSession>, Boolean> condition, Object source) {
        super(source);

        this.condition = condition;
    }
}
