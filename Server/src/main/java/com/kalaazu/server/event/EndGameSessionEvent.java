package com.kalaazu.server.event;

import com.kalaazu.server.netty.GameSession;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

/**
 * End game session event.
 * =======================
 * <p>
 * Ends the given game session.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Getter
public class EndGameSessionEvent extends ApplicationEvent {
    private final GameSession session;

    public EndGameSessionEvent(GameSession session, Object source) {
        super(source);

        this.session = session;
    }
}
