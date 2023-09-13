package com.kalaazu.server.entities;

import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.entity.MapsEntity;
import com.kalaazu.persistence.entity.MapsStationsEntity;
import com.kalaazu.server.commands.OutCommand;
import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

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
@Getter
@Setter
public class Station implements MapEntity {
    private final MapsStationsEntity station;
    private final MapsEntity map;

    private int id;
    private Vector2 position;

    @Override
    public OutCommand getEntityCreationCommand() {
        return null;
    }
}
