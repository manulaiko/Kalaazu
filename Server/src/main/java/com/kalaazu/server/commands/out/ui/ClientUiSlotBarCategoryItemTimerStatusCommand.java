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
public class ClientUiSlotBarCategoryItemTimerStatusCommand extends OutCommand {
    public static final short READY = 0;
    public static final short ACTIVE = 1;
    public static final short COOLDOWN = 2;

    private final short id = 686;

    private short status;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);

        packet.writeShort(637);
        packet.writeShort(this.status);
    }
}
