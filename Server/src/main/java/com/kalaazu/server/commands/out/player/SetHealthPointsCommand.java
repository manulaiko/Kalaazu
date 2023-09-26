package com.kalaazu.server.commands.out.player;

import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.util.Packet;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Set health points command.
 * ==========================
 *
 * Updates the Ship window with the current health points.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
public class SetHealthPointsCommand extends OutCommand {
    private final short id = 15997;

    private int health;
    private int maxHealth;
    private int nanohull;
    private int maxNanohull;

    @Override
    public void write(Packet param1) {

        param1.writeInt(health >> 3 | health << 29);
        param1.writeInt(maxHealth << 6 | maxHealth >> 26);
        param1.writeInt(nanohull >> 8 | nanohull << 24);
        param1.writeInt(maxNanohull << 6 | maxNanohull >> 26);
    }
}
