package com.kalaazu.server.commands.out.ui;

import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.util.Packet;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * Menu bar command.
 * =================
 * <p>
 * Sends the different menu bar items.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuBarCommand extends OutCommand {
    private final short id = 11623;

    private List<ClientUiMenuBarCommand> items;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);

        packet.writeInt(items.size());
        items.forEach(i -> i.write(packet));
    }
}
