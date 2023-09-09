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
public class CooldownTypeCommand extends OutCommand {
    public static final short short_378 = 20;
    public static final short ROCKET_PROBABILITY_MAXIMIZER = 15;
    public static final short short_317 = 24;
    public static final short short_1124 = 26;
    public static final short SPEED_LEECH = 17;
    public static final short short_755 = 2;
    public static final short short_1220 = 31;
    public static final short short_2642 = 32;
    public static final short NONE = 0;
    public static final short short_1587 = 5;
    public static final short short_1048 = 41;
    public static final short short_1736 = 23;
    public static final short BATTLE_REPAIR_BOT = 18;
    public static final short short_2172 = 38;
    public static final short SINGULARITY = 34;
    public static final short short_918 = 22;
    public static final short ENERGY_CHAIN_IMPULSE = 14;
    public static final short short_1085 = 19;
    public static final short short_899 = 8;
    public static final short short_1699 = 6;
    public static final short RAPID_SALVO_BLAST = 9;
    public static final short short_888 = 2;
    public static final short short_1952 = 40;
    public static final short ENERGY_LEECH_ARRAY = 13;
    public static final short MINE = 1;
    public static final short short_2204 = 37;
    public static final short short_2419 = 43;
    public static final short SHIELD_BACKUP = 16;
    public static final short short_138 = 30;
    public static final short PLASMA = 7;
    public static final short short_1789 = 10;
    public static final short short_2342 = 42;
    public static final short short_2738 = 25;
    public static final short short_1815 = 33;
    public static final short short_987 = 36;
    public static final short ROCKET = 4;
    public static final short short_798 = 12;
    public static final short short_255 = 21;
    public static final short short_2047 = 28;
    public static final short ROCKET_LAUNCHER = 11;
    public static final short short_1554 = 39;
    public static final short short_1428 = 27;
    public static final short SPEED_BUFF = 35;
    public static final short short_1439 = 3;

    private final short id = 7786;


    private short type = 0;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);

        packet.writeShort(this.type);
        packet.writeShort(0);
    }
}
