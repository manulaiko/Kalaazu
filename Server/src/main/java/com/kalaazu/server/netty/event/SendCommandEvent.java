package com.kalaazu.server.netty.event;

import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.netty.GameSession;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

/**
 * Send command event.
 * ===================
 * <p>
 * Use this event to send commands to the given game session.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Getter
public class SendCommandEvent extends ApplicationEvent {
    private final GameSession session;
    private final OutCommand command;

    public SendCommandEvent(GameSession session, OutCommand command, Object source) {
        super(source);

        this.session = session;
        this.command = command;
    }
}
