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
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClientUiSlotBarCategoryItemStatusCommand extends OutCommand {
    public static final short DEFAULT = 0;
    public static final short BLUE = 4;
    public static final short YELLOW = 3;
    public static final short short_1167 = 5;
    public static final short RED = 1;
    public static final short GREEN = 2;
    public static final short short_790 = 6;

    private final short id = 12754;

    public boolean available = false;
    public double maxCounterValue = 0;
    public boolean buyable = false;
    public boolean selected = false;
    public double counterValue = 0;
    public boolean blocked = false;
    public String iconLootId = "";
    public boolean visible = false;
    public boolean activatable = false;
    public short counterStyle = 0;
    public String lootId = "";
    public ClientUiTooltipsCommand toolTipItemBar;
    public ClientUiTooltipsCommand toolTipSlotBar;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);

        packet.writeBoolean(this.buyable);
        packet.writeDouble(this.counterValue);
        packet.writeShort(0);
        packet.writeBoolean(this.blocked);
        packet.writeString(this.lootId);
        packet.writeBoolean(this.available);
        packet.writeBoolean(this.activatable);
        packet.writeShort(this.counterStyle);
        toolTipItemBar.write(packet);
        packet.writeShort(0);
        toolTipSlotBar.write(packet);
        packet.writeDouble(this.maxCounterValue);
        packet.writeBoolean(this.selected);
        packet.writeString(this.iconLootId);
        packet.writeBoolean(this.visible);
    }
}
