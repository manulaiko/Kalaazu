package com.kalaazu.server.commands.out.ui;

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
@NoArgsConstructor
@AllArgsConstructor
public class UpdateWindowItemCommand extends ClientUiMenuBarItemCommand {
    private final short id = 14317;

    private int height;
    private Boolean maximized;
    private int width;
    private String title;
    private int y;
    private ClientUiTooltipsCommand helpText;
    private int x;

    public UpdateWindowItemCommand(boolean maximized, int height, boolean visible, int y, int x, ClientUiTooltipsCommand toolTip, String title, int width, ClientUiTooltipsCommand helpText, String itemId) {
        this.title = title;
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
        this.maximized = maximized;
        this.helpText = helpText;

        super.setVisible(visible);
        super.setItemId(itemId);
        super.setToolTip(toolTip);
    }

    public void write(Packet packet) {
        packet.writeShort(id);

        super.write(packet);
        packet.writeInt(this.height >> 14 | this.height << 18);
        packet.writeBoolean(this.maximized);
        packet.writeInt(this.width >> 2 | this.width << 30);
        packet.writeString(this.title);
        packet.writeShort(3358);
        packet.writeInt(this.y << 14 | this.y >> 18);
        this.helpText.write(packet);
        packet.writeInt(this.x >> 12 | this.x << 20);
    }
}
