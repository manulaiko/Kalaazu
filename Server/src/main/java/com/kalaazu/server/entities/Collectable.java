package com.kalaazu.server.entities;

import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.entity.CollectablesEntity;
import com.kalaazu.persistence.entity.MapsEntity;
import com.kalaazu.server.commands.OutCommand;
import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

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
@Getter
@Setter
public class Collectable implements MapEntity {
    private final CollectablesEntity collectable;
    private final MapsEntity map;

    private int id;
    private Vector2 position;

    @Override
    public OutCommand getEntityCreationCommand() {
        return null;
    }
}
