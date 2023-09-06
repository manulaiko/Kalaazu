package com.kalaazu.server.commands.in;

import com.kalaazu.server.commands.InCommand;
import com.kalaazu.server.util.Packet;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Login request packet.
 * =====================
 *
 * Represents the incoming login request.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class LoginRequest extends InCommand {
    public static final short ID = 10996;

    private short id = ID;
    private int instanceId;
    private int userId;
    private short factionId;
    private String sessionId;
    private String version;

    public void read(Packet packet) {
        instanceId = packet.readInt();
        instanceId = (instanceId << 8) | (instanceId >> 24);

        userId = packet.readInt();
        userId = (userId << 8) | (userId >> 24);

        factionId = packet.readShort();
        sessionId = packet.readString();
        version = packet.readString();
    }
}
