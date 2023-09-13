package com.kalaazu.server.commands.out.map;

import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.commands.out.unknown.class_387;
import com.kalaazu.server.util.Packet;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * Create Ship command.
 * ====================
 * <p>
 * Creates a ship on the map.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
public class CreateShipCommand extends OutCommand {
    private final short id = 7270;

    private int entityId;
    private String name;
    private int factionId;
    private int rankId;
    private int clanId;
    private int motherShipId;
    private int expansionStage;
    private int x;
    private int y;
    private int positionIndex;
    private String shipType;
    private String clanTag;
    private int galaxyGatesDone;
    private boolean useSystemFont;
    private boolean isNpc;
    private boolean warnBox;
    private boolean isCloaked;
    private List<VisualModifierCommand> modifiers;
    private MinimapEntityDiplomacyStatusCommand clanDiplomacy;
    private class_387 var_4196;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);

        packet.writeString(name);
        packet.writeInt(galaxyGatesDone >> 13 | galaxyGatesDone << 19);
        packet.writeBoolean(useSystemFont);
        packet.writeInt(factionId >> 7 | factionId << 25);
        packet.writeInt(expansionStage << 6 | expansionStage >> 26);
        packet.writeString(shipType);
        packet.writeInt(rankId >> 4 | rankId << 28);
        packet.writeBoolean(isNpc);
        packet.writeInt(clanId << 3 | clanId >> 29);
        clanDiplomacy.write(packet);
        packet.writeBoolean(warnBox);
        packet.writeInt(motherShipId >> 16 | motherShipId << 16);
        packet.writeString(clanTag);
        packet.writeInt(modifiers.size());
        modifiers.forEach(m -> m.write(packet));
        packet.writeBoolean(isCloaked);
        packet.writeInt(entityId >> 14 | entityId << 18);
        packet.writeInt(positionIndex << 3 | positionIndex >> 29);
        packet.writeInt(x << 4 | x >> 28);
        var_4196.write(packet);
        packet.writeInt(y << 9 | y >> 23);
    }
}
