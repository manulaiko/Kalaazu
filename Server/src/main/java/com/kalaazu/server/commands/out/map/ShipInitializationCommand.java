package com.kalaazu.server.commands.out.map;

import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.util.Packet;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * Ship initialization command.
 * ============================
 * <p>
 * Contains the user's ship information needed to start the game.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShipInitializationCommand extends OutCommand {
    private final short id = 7511;

    private int userId;
    private String username;
    private String shipType;
    private short speed;
    private int shield;
    private int maxShield;
    private int health;
    private int maxHealth;
    private int cargo;
    private int maxCargo;
    private int nanohull;
    private int maxNanohull;
    private float x;
    private float y;
    private byte mapId;
    private byte factionId;
    private int clanId;
    private int expansionStage;
    private boolean premium;
    private long experience;
    private long honor;
    private short levelId;
    private long credits;
    private long uridium;
    private int jackpot;
    private byte rankId;
    private String clanTag;
    private int rings;
    private boolean alive;
    private boolean cloaked;
    private List<VisualModifierCommand> modifiers;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);

        packet.writeInt(factionId << 12 | factionId >> 20);
        packet.writeString(shipType);
        packet.writeBoolean(alive);
        packet.writeShort(0);
        packet.writeInt(maxCargo >> 16 | maxCargo << 16);
        packet.writeInt(levelId << 9 | levelId >> 23);
        packet.writeInt(maxNanohull >> 14 | maxNanohull << 18);
        packet.writeBoolean(cloaked);
        packet.writeInt(speed >> 10 | speed << 22);
        packet.writeDouble(uridium);
        packet.writeInt(mapId >> 9 | mapId << 23);
        packet.writeInt(shield >> 10 | shield << 22);
        packet.writeInt(expansionStage << 8 | expansionStage >> 24);
        packet.writeDouble(credits);
        packet.writeInt(nanohull >> 13 | nanohull << 19);
        packet.writeString(username);
        packet.writeInt((int) x >> 5 | (int) x << 27);
        packet.writeDouble(experience);
        packet.writeBoolean(premium);
        packet.writeString(clanTag);
        packet.writeInt(cargo >> 10 | cargo << 22);
        packet.writeInt(maxShield << 6 | maxShield >> 26);
        packet.writeInt(maxHealth >> 5 | maxHealth << 27);
        packet.writeInt(userId << 1 | userId >> 31);
        packet.writeInt(rings >> 1 | rings << 31);
        packet.writeDouble(honor);
        packet.writeInt(clanId >> 8 | clanId << 24);
        packet.writeInt(rankId << 3 | rankId >> 29);
        packet.writeFloat(jackpot);
        packet.writeInt(health << 3 | health >> 29);
        packet.writeInt(modifiers.size());
        modifiers.forEach(m -> m.write(packet));
        packet.writeInt((int) y << 1 | (int) y >> 31);
        packet.writeBoolean(true);
    }
}
