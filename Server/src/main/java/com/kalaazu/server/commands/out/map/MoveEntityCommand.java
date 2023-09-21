package com.kalaazu.server.commands.out.map;

import com.kalaazu.math.Vector;
import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.util.Packet;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Move entity command.
 * ====================
 * <p>
 * Moves an entity across the map.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
public class MoveEntityCommand extends OutCommand {
    private final short id = 29819;

    private int entityId;
    private Vector destination;
    private int travelTime;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);

        var x = (int) destination.getX();
        var y = (int) destination.getY();

        packet.writeShort(0);
        packet.writeInt(y >> 13 | y << 19);
        packet.writeInt(entityId >> 12 | entityId << 20);
        packet.writeInt(x >> 4 | x << 28);
        packet.writeInt(travelTime >> 13 | travelTime << 19);
    }
}
