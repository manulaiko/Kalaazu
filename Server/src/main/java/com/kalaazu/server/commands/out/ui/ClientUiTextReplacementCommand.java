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
public class ClientUiTextReplacementCommand extends OutCommand {
    private final short id = 1059;

    private String replacement = "";
    private String wildcard = "";
    private ClientUiTooltipTextFormatCommand tooltipTextFormat;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);

        packet.writeString(this.replacement);
        tooltipTextFormat.write(packet);
        packet.writeShort(0);
        packet.writeString(this.wildcard);
    }
}
