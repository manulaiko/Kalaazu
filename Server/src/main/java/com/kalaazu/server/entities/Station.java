package com.kalaazu.server.entities;

import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.entity.MapsEntity;
import com.kalaazu.persistence.entity.MapsStationsEntity;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.UUID;

/**
 * Station entity.
 * ===============
 *
 * Represents a station in a map.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@RequiredArgsConstructor
@Data
public class Station implements MapEntity {
    private final MapsStationsEntity station;
    private final MapsEntity map;

    private UUID id;
    private Vector2 position;
}
