package com.kalaazu.server.commands.out.player;

import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.util.Packet;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Set speed command.
 * ==================
 * <p>
 * Updates the hero speed.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
public class SetSpeedCommand extends OutCommand {
    private final short id = 4082;

    private int speed;

    @Override
    public void write(Packet packet) {
        packet.writeInt(speed << 2 | speed >> 30);
        packet.writeInt(speed << 8 | speed >> 24);
        packet.writeShort(0);
    }
}
