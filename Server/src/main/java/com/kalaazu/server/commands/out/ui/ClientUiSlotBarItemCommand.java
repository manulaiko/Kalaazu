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
public class ClientUiSlotBarItemCommand extends OutCommand {
    private final short id = 14620;

    private String itemId;
    private short slotId;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);

        packet.writeString(this.itemId);
        packet.writeInt(this.slotId << 5 | this.slotId >> 27);
    }
}
