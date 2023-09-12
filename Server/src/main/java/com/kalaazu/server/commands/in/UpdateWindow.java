package com.kalaazu.server.commands.in;

import com.kalaazu.server.commands.InCommand;
import com.kalaazu.server.util.Packet;
import lombok.Data;

/**
 * @author manulaiko <manulaiko@gmail.com>
 */
@Data
public class UpdateWindow extends InCommand {
    public static final short ID = 7606;

    private short id = ID;
    private int y;
    private int width;
    private String itemId;
    private int height;
    private int x;
    private boolean maximized;

    @Override
    public void read(Packet packet) {
        this.y = packet.readInt();
        this.y = (this.y >> 11) | (this.y << 21);
        this.width = packet.readInt();
        this.width = (this.width >> 8) | (this.width << 24);
        this.itemId = packet.readString();
        this.height = packet.readInt();
        this.height = (this.height << 8) | (this.height >> 24);
        this.x = packet.readInt();
        this.x = (this.x >> 11) | (this.x << 21);
        this.maximized = packet.readBoolean();
    }
}
