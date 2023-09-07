package com.kalaazu.server.commands.out.settings;

import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.util.Packet;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * Update user settings command.
 * =============================
 * <p>
 * Updates in game settings.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UpdateUserSettingsCommand extends OutCommand {
    private final short id = 18381;

    private UpdateQualitySettingsCommand qualitySettings;
    private UpdateQuestsSettingsCommand questSettings;
    private UpdateDisplaySettingsCommand displaySettings;
    private UpdateWindowSettingsCommand windowSettings;
    private UpdateGameplaySettingsCommand gameplaySettings;
    private UpdateAudioSettingsCommand audioSettings;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);
        qualitySettings.write(packet);
        questSettings.write(packet);
        displaySettings.write(packet);
        windowSettings.write(packet);
        gameplaySettings.write(packet);
        packet.writeShort(-23775);
        audioSettings.write(packet);
    }
}
