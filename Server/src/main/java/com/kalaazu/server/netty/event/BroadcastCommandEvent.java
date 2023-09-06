package com.kalaazu.server.netty.event;

import com.kalaazu.server.commands.OutCommand;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

/**
 * Broadcast packet event.
 * =======================
 * <p>
 * Use this event to send packets to all available sessions.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Getter
public class BroadcastCommandEvent extends ApplicationEvent {
    private final OutCommand command;

    public BroadcastCommandEvent(OutCommand command, Object source) {
        super(source);

        this.command = command;
    }
}
