package com.kalaazu.server.commands.out.unknown;

import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.util.Packet;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
public class class_387 extends OutCommand {
    public static final short const_1714 = 2;
    public static final short const_2330 = 1;
    public static final short DEFAULT = 0;

    private final short id = 14030;

    private short var_4820;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);

        packet.writeShort(-21374);
        packet.writeShort(this.var_4820);
    }
}
