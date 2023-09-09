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
public class ClientUiSlotBarCategoryItemCommand extends OutCommand {
    public static final short short_554 = 1;
    public static final short TIMER = 3;
    public static final short SELECTION = 2;
    public static final short short_2465 = 0;
    public static final short NUMBER = 1;
    public static final short DOT = 3;
    public static final short BAR = 2;
    public static final short NONE = 0;

    private final short id = 23269;

    public short counterType;
    public ClientUiSlotBarCategoryItemTimerCommand timer;
    public ClientUiSlotBarCategoryItemStatusCommand status;
    public CooldownTypeCommand cooldownType;
    public short actionStyle;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);

        status.write(packet);
        timer.write(packet);
        packet.writeShort(0);
        cooldownType.write(packet);
        packet.writeInt(0);
        packet.writeShort(this.actionStyle);
        packet.writeShort(this.counterType);
    }
}
