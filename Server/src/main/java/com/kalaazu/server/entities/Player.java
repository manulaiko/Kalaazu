package com.kalaazu.server.entities;

import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.entity.MapsEntity;
import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.netty.GameSession;
import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

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
    private final GameSession gameSession;
    private final MapsEntity map;

    private int id;
    private Vector2 position;
    private Vector2 destination;
    private short speed;

    @Override
    public OutCommand getEntityCreationCommand() {
        return null;
    }
}
