package com.kalaazu.server.commands.out.settings;

import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.util.Packet;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * User Keybindings command.
 * =========================
 * <p>
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
    private List<KeybindingCommand> keybindings;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);
        packet.writeBoolean(remove);
        packet.writeInt(keybindings.size());

        keybindings.forEach(k -> k.write(packet));
    }
}
