package com.kalaazu.server.entities;

import com.kalaazu.math.Vector2;

/**
 * Map entity.
 * ===========
 *
 * Represents an entity that can be placed in the map.
 *
 * All map entities have a position.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
public interface MapEntity {
    Vector2 getPosition();
}
