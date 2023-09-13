package com.kalaazu.server.entities;

import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.entity.MapsEntity;
import com.kalaazu.persistence.entity.NpcsEntity;
import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.commands.out.map.CreateShipCommand;
import com.kalaazu.server.commands.out.map.MinimapEntityDiplomacyStatusCommand;
import com.kalaazu.server.commands.out.unknown.class_387;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Scope;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.ArrayList;

/**
 * Npc.
 * ====
 * <p>
 * Represents an NPC in a map.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Data
@RequiredArgsConstructor
@Component
@Scope("prototype")
public class Npc implements MovableMapEntity {
    private int id;
    private Vector2 initialPosition = Vector2.Zero.cpy();
    private Vector2 position = Vector2.Zero.cpy();
    private Vector2 destination = Vector2.Zero.cpy();
    private boolean moving;
    private long endMovementTime;
    private int totalMovementTime;
    private short speed;

    private NpcsEntity npc;
    private MapsEntity map;

    @Override
    public void startMovement(Vector2 from, Vector2 to) {

    }

    @Async
    @Scheduled(fixedDelay = 500)
    public void tick() {

    }

    @Override
    public OutCommand getEntityCreationCommand() {
        return new CreateShipCommand(
                id,
                npc.getName(),
                0,
                0,
                0,
                MinimapEntityDiplomacyStatusCommand.ENEMY,
                3,
                (int) position.getX(),
                (int) position.getY(),
                MinimapEntityDiplomacyStatusCommand.ENEMY,
                String.valueOf(npc.getGfx()),
                "",
                0,
                false,
                true,
                false,
                false,
                new ArrayList<>(),
                new MinimapEntityDiplomacyStatusCommand(MinimapEntityDiplomacyStatusCommand.ENEMY),
                new class_387(class_387.DEFAULT)
        );
    }
}
