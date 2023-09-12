package com.kalaazu.server.commands;

import com.kalaazu.server.util.Packet;

/**
 * In Command.
 * ===========
 * <p>
 * Base class for all incoming game commands.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
public abstract class InCommand extends Command {
    public abstract void read(Packet packet);
}
