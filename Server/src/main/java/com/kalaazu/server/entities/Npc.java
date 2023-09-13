package com.kalaazu.server.entities;

import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.entity.MapsEntity;
import com.kalaazu.persistence.entity.NpcsEntity;
import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.commands.out.map.MinimapEntityDiplomacyStatusCommand;
import com.kalaazu.server.commands.out.map.CreateShipCommand;
import com.kalaazu.server.commands.out.unknown.class_387;
import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;

/**
 * Npc.
 * ====
 * <p>
 * Represents an NPC in a map.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Getter
@Setter
@RequiredArgsConstructor
public class Npc implements MovableMapEntity {
    private final NpcsEntity npc;
    private final MapsEntity map;

    private int id;
    private Vector2 position = new Vector2(Vector2.Zero);
    private Vector2 destination = new Vector2(Vector2.Zero);
    private boolean moving;
    private long movementStartTime;
    private int totalMovementTime;

    public short getSpeed() {
        return npc.getSpeed();
    }

    @Override
    public OutCommand getEntityCreationCommand() {
        return new CreateShipCommand(
                id,
                npc.getName(),
                0,
                0,
                0,
                MinimapEntityDiplomacyStatusCommand.ENEMY,
                3,
                (int)position.getX(),
                (int)position.getY(),
                MinimapEntityDiplomacyStatusCommand.ENEMY,
                String.valueOf(npc.getGfx()),
                "",
                0,
                false,
                true,
                false,
                false,
                new ArrayList<>(),
                new MinimapEntityDiplomacyStatusCommand(MinimapEntityDiplomacyStatusCommand.ENEMY),
                new class_387(class_387.DEFAULT)
        );

        /*
        0
95
28
102
0
27
46
46
58
58
123
32
66
111
115
115
32
75
114
105
115
116
97
108
108
105
110
32
125
58
58
46
46
0
0
0
0
0
0
0
0
0
0
0
0
192
0
2
50
57
0
0
0
0
1
0
0
0
0
106
242
0
3
0
0
3
0
0
0
0
0
0
0
0
0
140
152
0
4
0
0
0
24
0
0
168
240
54
206
172
130
0
0
0
15
164
0
         */
    }
}
