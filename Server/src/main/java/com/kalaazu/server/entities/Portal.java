package com.kalaazu.server.entities;

import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.entity.MapsEntity;
import com.kalaazu.persistence.entity.MapsPortalsEntity;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.UUID;

/**
 * Portal entity.
 * ==============
 *
 * Represents a portal in a map.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@RequiredArgsConstructor
@Data
public class Portal implements MapEntity {
    private final MapsPortalsEntity portal;
    private final MapsEntity map;

    private UUID id;
    private Vector2 position;
}
