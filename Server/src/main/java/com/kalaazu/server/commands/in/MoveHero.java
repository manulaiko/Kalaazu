package com.kalaazu.server.commands.in;

import com.kalaazu.math.Vector;
import com.kalaazu.server.commands.InCommand;
import com.kalaazu.server.util.Packet;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Move hero packet.
 * =================
 *
 * Received when the player moves.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class MoveHero extends InCommand {
    public static final short ID = 17063;

    private final short id = ID;

    private Vector from;
    private Vector to;

    @Override
    public void read(Packet packet) {
        var targetY = packet.readInt();
        var positionX = packet.readInt();

        packet.readShort();

        var targetX = packet.readInt();
        var positionY = packet.readInt();

        targetY = (targetY << 8) | (targetY >>> 24);
        positionX = (positionX << 15) | (positionX >>> 17);
        targetX = (targetX >>> 4) | (targetX << 28);
        positionY = (positionY << 5) | (positionY >>> 27);

        from = new Vector(positionX, positionY);
        to = new Vector(targetX, targetY);
    }
}
