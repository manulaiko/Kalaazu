package com.kalaazu.server.packets;

import com.kalaazu.server.util.Packet;

/**
 * Command class.
 * ==============
 *
 * Base class for all game commands.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
public abstract class Command {
    public abstract void read(Packet packet);
}
