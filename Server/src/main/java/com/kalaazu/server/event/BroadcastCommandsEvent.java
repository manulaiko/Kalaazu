package com.kalaazu.server.event;

import com.kalaazu.server.commands.OutCommand;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

import java.util.List;

/**
 * Broadcast packets event.
 * ========================
 * <p>
 * Use this event to send packets to all available sessions.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Getter
public class BroadcastCommandsEvent extends ApplicationEvent {
    private final List<OutCommand> commands;

    public BroadcastCommandsEvent(List<OutCommand> commands, Object source) {
        super(source);

        this.commands = commands;
    }
}
