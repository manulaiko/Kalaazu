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
public class ClientUiSlotBarCategoryItemTimerCommand extends OutCommand {
    private final short id = 31208;

    public ClientUiSlotBarCategoryItemTimerStatusCommand timerState;
    public String var1474;
    public boolean activatable;
    public double time;
    public double maxTime;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);

        packet.writeDouble(this.time);
        packet.writeString(this.var1474);
        packet.writeBoolean(this.activatable);
        packet.writeDouble(this.maxTime);
        timerState.write(packet);
    }
}
