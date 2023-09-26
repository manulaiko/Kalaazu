package com.kalaazu.server.commands.out.player;

import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.util.Packet;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Set shield points command.
 * ==========================
 *
 * Updates the Ship window with the current shield points.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
public class SetShieldPointsCommand extends OutCommand {
    private final short id = 4550;

    private int shield;
    private int maxShield;

    @Override
    public void write(Packet packet) {
        packet.writeInt(shield >> 12 | shield << 20);
        packet.writeInt(maxShield >> 7 | maxShield << 25);
    }
}
