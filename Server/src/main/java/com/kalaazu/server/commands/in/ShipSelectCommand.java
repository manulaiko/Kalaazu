package com.kalaazu.server.commands.in;

import com.kalaazu.server.commands.InCommand;
import com.kalaazu.server.util.Packet;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Select command.
 * ===============
 * <p>
 * Received when a player selects a ship.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class ShipSelectCommand extends InCommand {
    public static final short ID = 18091;

    private final short id = ID;

    private int targetId;
    private int posX;
    private int posY;
    private int name_13;
    private int name_95;

    @Override
    public void read(Packet packet) {
        name_13 = packet.readInt();
        posX = packet.readInt();
        posY = packet.readInt();
        targetId = packet.readInt();
        name_95 = packet.readInt();

        targetId = targetId >> 14 | targetId << 18;
        posY = posY >> 14 | posY << 18;
        posX = posX << 12 | posX >> 20;
        name_13 = name_13 << 5 | name_13 >> 27;
        name_95 = name_95 >> 7 | name_95 << 25;
    }
}
