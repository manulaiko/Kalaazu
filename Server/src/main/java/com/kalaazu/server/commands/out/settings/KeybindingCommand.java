package com.kalaazu.server.commands.out.settings;

import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.util.Packet;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class KeybindingCommand extends OutCommand {
    private short id = 423;

    private short actionType;
    private short charCode;
    private int parameter;
    private List<Integer> keys;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);
        packet.writeShort(actionType);
        packet.writeShort(charCode);
        packet.writeShort(0);

        packet.writeInt(keys.size());
        keys.forEach(k -> {
            packet.writeInt((k >> 5) | (k << 27));
        });

        packet.writeInt(parameter);
    }
}
