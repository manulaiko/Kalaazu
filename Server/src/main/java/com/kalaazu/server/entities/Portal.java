package com.kalaazu.server.entities;

import com.kalaazu.math.Vector;
import com.kalaazu.persistence.entity.MapsEntity;
import com.kalaazu.persistence.entity.MapsPortalsEntity;
import com.kalaazu.server.commands.OutCommand;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

/**
 * Portal entity.
 * ==============
 *
 * Represents a portal in a map.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@RequiredArgsConstructor
@Getter
@Setter
public class Portal implements MapEntity {
    private final MapsPortalsEntity portal;
    private final MapsEntity map;

    private int id;
    private Vector position;

    @Override
    public OutCommand getEntityCreationCommand() {
        return null;
    }
}
