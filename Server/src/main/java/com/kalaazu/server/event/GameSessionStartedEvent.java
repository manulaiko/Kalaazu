package com.kalaazu.server.event;

import com.kalaazu.server.netty.GameSession;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

/**
 * Game session started event.
 * ===========================
 * <p>
 * Fired when a new game session connects to the server and the
 * initial packets are sent.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Getter
public class GameSessionStartedEvent extends ApplicationEvent {
    private final GameSession session;

    public GameSessionStartedEvent(GameSession session, Object source) {
        super(source);

        this.session = session;
    }
}
