package com.kalaazu.server.commands.out.map;

import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.util.Packet;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author manulaiko <manulaiko@gmail.com>
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class VisualModifierCommand extends OutCommand {
    public static final short FORTIFY = 2;
    public static final short SURGEON_PLAGUE = 50;
    public static final short BUFFZONE = 32;
    public static final short BATTLE_REPAIR_BOT = 53;
    public static final short varl1M = 47;
    public static final short DAMAGE_ICON = 43;
    public static final short varsy = 38;
    public static final short ENERGY_LEECH_ARRAY = 52;
    public static final short vard2V = 39;
    public static final short PROTECT_OWNER = 3;
    public static final short ULTIMATE_EMP_TARGET = 7;
    public static final short varR4L = 49;
    public static final short DRAW_FIRE_OWNER = 5;
    public static final short OWNS_BATTLESTATION = 31;
    public static final short SHIP_WARP = 15;
    public static final short INACTIVE = 8;
    public static final short MIRRORED_CONTROLS = 20;
    public static final short vara2t = 48;
    public static final short HADES_PLUS = 36;
    public static final short BATTLESTATION_DOWNTIME_TIMER = 28;
    public static final short HADES_MINUS = 37;
    public static final short GHOST_EFFECT = 19;
    public static final short INVINCIBILITY = 26;
    public static final short CAMERA = 45;
    public static final short var747 = 51;
    public static final short EMERGENCY_REPAIR = 25;
    public static final short GREEN_GLOW = 22;
    public static final short varN2t = 42;
    public static final short BLOCKED_ZONE_EXPLOSION = 33;
    public static final short GENERIC_GLOW = 24;
    public static final short BATTLESTATION_INSTALLING = 29;
    public static final short PRISMATIC_SHIELD = 10;
    public static final short BATTLESTATION_DEFLECTOR = 27;
    public static final short SINGULARITY = 13;
    public static final short LEGENDARY_NPC_NAME = 35;
    public static final short NPC_INFILTRATOR = 16;
    public static final short TRAVEL_MODE = 0;
    public static final short varp0 = 46;
    public static final short BATTLESTATION_CONSTRUCTING = 30;
    public static final short WEAKEN_SHIELDS = 11;
    public static final short HEALING_POD = 1;
    public static final short PROTECT_TARGET = 4;
    public static final short FORTRESS = 9;
    public static final short STICKY_BOMB = 21;
    public static final short DRAW_FIRE_TARGET = 6;
    public static final short LEONOV_EFFECT = 17;
    public static final short varT1t = 44;
    public static final short varq2J = 40;
    public static final short WIZARD_ATTACK = 18;
    public static final short NPC_DECLOAK_ZONE = 34;
    public static final short SINGULARITY_TARGET = 14;
    public static final short RED_GLOW = 23;
    public static final short WEAKEN_SHIELDS_TARGET = 12;
    public static final short varY2t = 41;

    private final short id = 12647;

    private int attribute;
    private int userId;
    private int count;
    private String lootId;
    private short modifier;
    private boolean activated;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);

        packet.writeInt(userId << 11 | userId >> 21);
        packet.writeInt(count >> 15 | count << 17);
        packet.writeString(lootId);
        packet.writeBoolean(activated);
        packet.writeInt(attribute >> 3 | attribute << 29);
        packet.writeShort(modifier);
        packet.writeShort(0);
    }
}
