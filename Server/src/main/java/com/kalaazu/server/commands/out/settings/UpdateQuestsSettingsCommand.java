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
public class UpdateQuestsSettingsCommand extends OutCommand {
    private final short id = 21683;

    private boolean questsLevelOrderDescending;
    private boolean questsAvailableFilter = true;
    private boolean questsUnavailableFilter;
    private boolean questsCompletedFilter;

    public void write(Packet packet) {
        packet.writeShort(id);

        packet.writeBoolean(questsLevelOrderDescending);
        packet.writeBoolean(questsAvailableFilter);
        packet.writeBoolean(questsUnavailableFilter);
        packet.writeBoolean(questsCompletedFilter);
        packet.writeShort(0);
        packet.writeBoolean(false);
        packet.writeBoolean(false);
    }
}
