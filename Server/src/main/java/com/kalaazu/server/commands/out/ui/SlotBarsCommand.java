package com.kalaazu.server.commands.out.ui;

import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.util.Packet;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * Slot bars commands.
 * ===================
 * <p>
 * Contains the information of the different slot bars.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SlotBarsCommand extends OutCommand {
    private final short id = 30106;

    private String position;
    private List<ClientUiSlotBarCommand> slotBars;
    private List<ClientUiSlotBarCategoryCommand> categories;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);

        packet.writeInt(slotBars.size());
        slotBars.forEach(s -> s.write(packet));
        packet.writeShort(-16701);
        packet.writeInt(categories.size());
        categories.forEach(c -> c.write(packet));
        packet.writeShort(36649);
        packet.writeString(position);
    }
}
