package com.kalaazu.server.entities;

import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.entity.MapsEntity;
import com.kalaazu.server.netty.GameSession;
import lombok.Data;
import lombok.RequiredArgsConstructor;

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
@Data
public class Player implements MovableMapEntity {
    private final GameSession gameSession;
    private final MapsEntity map;

    private UUID id;
    private Vector2 position;
    private Vector2 destination;
    private short speed;
}
