package com.kalaazu.server.commands.in;

import com.kalaazu.server.commands.InCommand;
import com.kalaazu.server.util.LegacyPacket;
import com.kalaazu.server.util.Packet;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Legacy command.
 * ===============
 *
 * Command that uses the legacy string pipe-based format.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class LegacyCommand extends InCommand {
    public static final short ID = 4224;

    private final short id = ID;
    private LegacyPacket packet;


    @Override
    public void read(Packet packet) {
        this.packet = new LegacyPacket(packet.readString());
    }
}
