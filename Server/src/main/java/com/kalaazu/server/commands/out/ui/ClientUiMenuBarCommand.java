package com.kalaazu.server.commands.out.ui;

import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.util.Packet;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClientUiMenuBarCommand extends OutCommand {
    public static final short NOT_ASSIGNED = 0;
    public static final short GENERIC_FEATURE_BAR = 2;
    public static final short GAME_FEATURE_BAR = 1;

    private final short id = 21788;

    private String position = "";
    private short menuId = 0;
    private List<ClientUiMenuBarItemCommand> menuBarItems;
    private String layoutId = "";

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);

        packet.writeShort(this.menuId);
        packet.writeString(this.layoutId);
        packet.writeString(this.position);
        packet.writeInt(this.menuBarItems.size());
        menuBarItems.forEach(i -> i.write(packet));
    }
}
