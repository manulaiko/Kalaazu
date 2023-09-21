package com.kalaazu.server.entities;

import com.kalaazu.math.Vector;
import com.kalaazu.persistence.entity.MapsEntity;
import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.event.PlayerMovementStartedEvent;
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
    private Vector initialPosition = Vector.ZERO.cpy();
    private Vector position = Vector.ZERO.cpy();
    private Vector destination = Vector.ZERO.cpy();
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

    @Async
    @Scheduled(fixedDelay = 100)
    public void tick() {
        this.movementTick();
    }
}
