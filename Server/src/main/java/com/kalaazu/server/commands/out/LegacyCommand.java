package com.kalaazu.server.commands.out;

import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.util.Packet;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Legacy command.
 * ===============
 *
 * Sends a legacy command to the client.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class LegacyCommand extends OutCommand {
    private final short id = 4224;

    private String packet;

    @Override
    public void write(Packet packet) {
        packet.writeString(this.getPacket());
    }
}
