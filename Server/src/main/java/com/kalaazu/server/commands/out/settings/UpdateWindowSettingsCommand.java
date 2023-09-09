package com.kalaazu.server.commands.out.settings;

import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.util.Packet;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UpdateWindowSettingsCommand extends OutCommand {
    private final short id = 1110;

    private boolean hideAllWindows;
    private int scale = 0;
    private String barState = "";

    public void write(Packet packet) {
        packet.writeShort(id);

        packet.writeString(barState);
        packet.writeInt(scale << 13 | scale >> 19);
        packet.writeBoolean(hideAllWindows);
        packet.writeShort(0);
        packet.writeShort(0);
    }
}
