package com.kalaazu.server.entities;

import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.entity.MapsEntity;
import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.commands.out.map.MoveEntityCommand;
import com.kalaazu.server.event.BroadcastCommandEvent;
import com.kalaazu.server.event.SendCommandEvent;
import com.kalaazu.server.event.SendCommandsEvent;
import com.kalaazu.server.netty.GameSession;
import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.springframework.context.ApplicationContext;

import java.util.UUID;

/**
 * Player entity.
 * ==============
 *
 * Represents a player in a map.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@RequiredArgsConstructor
@Getter
@Setter
public class Player implements MovableMapEntity {
    private final ApplicationContext ctx;

    private final GameSession gameSession;
    private final MapsEntity map;
    private final int id;

    private Vector2 initialPosition = new Vector2(Vector2.Zero);
    private Vector2 position = new Vector2(Vector2.Zero);
    private Vector2 destination = new Vector2(Vector2.Zero);
    private short speed;
    private boolean moving;
    private long endMovementTime;
    private int totalMovementTime;

    @Override
    public OutCommand getEntityCreationCommand() {
        return null;
    }

    @Override
    public void move(Vector2 from, Vector2 to) {
        this.setMoving(true);

        this.setInitialPosition(from);
        this.setPosition(from);
        this.setDestination(to);

        this.setEndMovementTime(System.currentTimeMillis() + this.getMovementDuration());

        ctx.publishEvent(new SendCommandEvent(gameSession, this.getMovementCommand(), this));
    }
}
