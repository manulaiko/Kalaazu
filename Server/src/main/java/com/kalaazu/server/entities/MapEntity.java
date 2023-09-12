package com.kalaazu.server.entities;

import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.entity.MapsEntity;

import java.util.UUID;

/**
 * Map entity.
 * ===========
 * <p>
 * Represents an entity that can be placed in the map.
 * <p>
 * All map entities have a position.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
public interface MapEntity {
    UUID getId();

    Vector2 getPosition();

    MapsEntity getMap();
}
