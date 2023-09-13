package com.kalaazu.server.commands.out.map;

import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.util.Packet;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Clan diplomacy command.
 * =======================
 *
 * Sets the entity diplomacy status.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
public class MinimapEntityDiplomacyStatusCommand extends OutCommand {
    public static final short NONE = 0;
    public static final short ALLIED = 1;
    public static final short NEUTRAL = 2;
    public static final short ENEMY = 3;

    private final short id = 27378;

    private short type;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);

        packet.writeShort(type);
    }
}
