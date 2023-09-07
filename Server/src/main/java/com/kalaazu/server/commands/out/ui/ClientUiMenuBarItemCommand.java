package com.kalaazu.server.commands.out.ui;

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
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ClientUiMenuBarItemCommand extends OutCommand {
    private final short id = 11362;

    private String itemId = "";
    private boolean visible = false;
    private ClientUiTooltipsCommand toolTip;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);

        this.toolTip.write(packet);
        packet.writeString(this.itemId);
        packet.writeBoolean(this.visible);
    }
}
