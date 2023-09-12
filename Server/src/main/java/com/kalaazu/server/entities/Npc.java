package com.kalaazu.server.entities;

import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.entity.MapsEntity;
import com.kalaazu.persistence.entity.NpcsEntity;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.UUID;

/**
 * Npc.
 * ====
 * <p>
 * Represents an NPC in a map.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Data
@RequiredArgsConstructor
public class Npc implements MovableMapEntity {
    private final NpcsEntity npc;
    private final MapsEntity map;

    private UUID id;
    private Vector2 position;
    private Vector2 destination;

    public short getSpeed() {
        return npc.getSpeed();
    }
}
