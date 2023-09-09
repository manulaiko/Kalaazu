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
@NoArgsConstructor
@AllArgsConstructor
public class ClientUiTooltipsCommand extends OutCommand {
    private final short id = 11246;

    private List<ClientUiTooltipCommand> tooltips;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);

        packet.writeInt(this.tooltips.size());
        tooltips.forEach(t -> t.write(packet));
        packet.writeShort(0);
    }
}
