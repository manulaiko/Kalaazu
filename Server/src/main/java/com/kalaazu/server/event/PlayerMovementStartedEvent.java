package com.kalaazu.server.event;

import com.kalaazu.server.entities.Player;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

/**
 * Player movement started.
 * ========================
 * <p>
 * Event fired when a player starts moving.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Getter
public class PlayerMovementStartedEvent extends ApplicationEvent {
    private final Player player;

    public PlayerMovementStartedEvent(Player player, Object source) {
        super(source);

        this.player = player;
    }
}
