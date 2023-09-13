package com.kalaazu.server.entities;

import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.entity.MapsEntity;
import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.event.BroadcastCommandEvent;
import com.kalaazu.server.netty.GameSession;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * Player entity.
 * ==============
 * <p>
 * Represents a player in a map.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@RequiredArgsConstructor
@Data
@Component
@Scope("prototype")
@Slf4j
public class Player implements MovableMapEntity {
    private final ApplicationContext ctx;

    private int id;
    private Vector2 initialPosition = Vector2.Zero.cpy();
    private Vector2 position = Vector2.Zero.cpy();
    private Vector2 destination = Vector2.Zero.cpy();
    private short speed;
    private boolean moving;
    private long endMovementTime;
    private int totalMovementTime;

    private GameSession gameSession;
    private MapsEntity map;

    @Override
    public OutCommand getEntityCreationCommand() {
        return null;
    }

    @Override
    public void startMovement(Vector2 from, Vector2 to) {
        this.setMoving(true);

        this.setInitialPosition(from);
        this.setPosition(from);
        this.setDestination(to);

        this.setEndMovementTime(System.currentTimeMillis() + this.getMovementDuration());

        ctx.publishEvent(new BroadcastCommandEvent(this.getMovementCommand(), this));
    }

    @Async
    @Scheduled(fixedDelay = 100)
    public void tick() {
        log.info("tick");
        this.movementTick();
    }
}
