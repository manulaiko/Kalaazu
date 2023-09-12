package com.kalaazu.server.entities;

import com.kalaazu.math.Vector2;

/**
 * Movable map entity.
 * ===================
 * <p>
 * A map entity that can move.
 * <p>
 * Movable entities have a destination and a speed.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
public interface MovableMapEntity extends MapEntity {
    Vector2 getDestination();

    short getSpeed();
}
