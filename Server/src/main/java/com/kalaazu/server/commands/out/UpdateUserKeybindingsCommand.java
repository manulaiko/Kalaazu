package com.kalaazu.server.commands.out;

import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.util.Packet;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * User Keybindings command.
 * =========================
 *
 * Command that updates the user's keybindings.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
public class UpdateUserKeybindingsCommand extends OutCommand {
    private final short id = 13016;

    private boolean remove;
    private List<Keybinding> keybindings;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);
        packet.writeBoolean(remove);
        packet.writeInt(keybindings.size());

        keybindings.forEach(k -> k.write(packet));
    }

    @EqualsAndHashCode(callSuper = true)
    @Data
    public static class Keybinding extends OutCommand {
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
            packet.writeShort(-20216);

            packet.writeInt(keys.size());
            keys.forEach(k -> {
                packet.writeInt((k >> 5) | (k << 27));
            });

            packet.writeInt(parameter);
        }
    }
}
