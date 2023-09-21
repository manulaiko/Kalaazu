package com.kalaazu.server.entities;

import com.kalaazu.math.Vector;
import com.kalaazu.persistence.entity.CollectablesEntity;
import com.kalaazu.persistence.entity.MapsEntity;
import com.kalaazu.server.commands.OutCommand;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

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
    private Vector position;

    @Override
    public OutCommand getEntityCreationCommand() {
        return null;
    }
}
