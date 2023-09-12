package com.kalaazu.server.entities;

import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.entity.CollectablesEntity;
import com.kalaazu.persistence.entity.MapsEntity;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.UUID;

/**
 * Collectable entity.
 * ===================
 * <p>
 * A collectable placed in a map.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@RequiredArgsConstructor
@Data
public class Collectable implements MapEntity {
    private final CollectablesEntity collectable;
    private final MapsEntity map;

    private UUID id;
    private Vector2 position;
}
