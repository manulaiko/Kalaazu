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
public class ClientUiSlotBarCategoryCommand extends OutCommand {
    private final short id = 23559;

    public List<ClientUiSlotBarCategoryItemCommand> items;
    public String tooltip = "";

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);

        packet.writeString(tooltip);
        packet.writeInt(items.size());
        items.forEach(i -> i.write(packet));
    }
}
