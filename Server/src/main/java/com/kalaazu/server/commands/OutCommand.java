package com.kalaazu.server.commands;

import com.kalaazu.server.util.Packet;

/**
 * Out Command.
 * ============
 *
 * Base class for all outgoing game commands.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
public abstract class OutCommand extends Command {
    public abstract void write(Packet packet);
}
