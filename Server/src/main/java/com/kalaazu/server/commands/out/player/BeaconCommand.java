package com.kalaazu.server.commands.out.player;

import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.util.Packet;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Beacon command.
 * ===============
 *
 * Updates the player's beacon information.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
public class BeaconCommand extends OutCommand {
    private final short id = 10084;

    private int i1;
    private int i2;
    private int i3;
    private int i4;
    private boolean isInDmz;
    private boolean isRepairing;
    private boolean isRepairbotSkilltree;
    private String repairBot;
    private boolean isInRadiation;

    @Override
    public void write(Packet param1) {
        param1.writeBoolean(isRepairing);
        param1.writeInt(i4 >> 4 | i4 << 28);
        param1.writeString(repairBot);
        param1.writeBoolean(isInDmz);
        param1.writeBoolean(isInRadiation);
        param1.writeInt(i2 >> 6 | i2 << 26);
        param1.writeBoolean(isRepairing);
        param1.writeInt(i3 >> 7 | i3 << 25);
        param1.writeShort(16384);
        param1.writeInt(i1 << 9 | i1 >> 23);
    }
}
