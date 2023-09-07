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
public class ClientUITooltipTextFormatCommand extends OutCommand {
    public static final short const_1089 = 3;
    public static final short const_234 = 7;
    public static final short const_1964 = 6;
    public static final short LOCALIZED = 5;
    public static final short PLAIN = 0;
    public static final short const_2514 = 1;
    public static final short const_2280 = 2;
    public static final short const_2046 = 4;

    private final short id = 24892;

    private short format = 0;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);

        packet.writeShort(format);
        packet.writeShort(26386);
    }
}
