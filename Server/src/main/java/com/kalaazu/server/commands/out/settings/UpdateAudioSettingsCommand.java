package com.kalaazu.server.commands.out.settings;

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
public class UpdateAudioSettingsCommand extends OutCommand {
    private final short id = 27262;

    private boolean notSet = false;
    private boolean playCombatMusic = false;
    private int voice = 0;
    private int sound = 0;
    private int music = 0;


    public void write(Packet packet) {
        packet.writeShort(id);

        packet.writeShort(0);
        packet.writeInt(voice << 9 | voice >> 23);
        packet.writeInt(sound << 7 | sound >> 25);
        packet.writeBoolean(playCombatMusic);
        packet.writeInt(music >> 4 | music << 28);
        packet.writeShort(0);
        packet.writeBoolean(notSet);
    }
}
