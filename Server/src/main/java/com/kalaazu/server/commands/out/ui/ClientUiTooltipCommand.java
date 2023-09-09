package com.kalaazu.server.commands.out.ui;

import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.util.Packet;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClientUiTooltipCommand extends OutCommand {
    public static final short STANDARD = 0;
    public static final short RED = 1;

    private final short id = 18572;

    private short color = 0;
    private ClientUiTooltipTextFormatCommand textFormat;
    private List<ClientUiTextReplacementCommand> textReplacements;
    private String baseKey = "";

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);

        packet.writeShort(0);
        packet.writeShort(this.color);
        packet.writeString(this.baseKey);
        textFormat.write(packet);
        packet.writeInt(this.textReplacements.size());
        textReplacements.forEach(t -> t.write(packet));
        packet.writeShort(0);
    }
}
