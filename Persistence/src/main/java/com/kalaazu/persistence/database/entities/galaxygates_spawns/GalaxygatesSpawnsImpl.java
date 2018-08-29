package com.kalaazu.persistence.database.entities.galaxygates_spawns;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.GalaxygatesSpawns;
import com.kalaazu.persistence.database.entities.Npcs;
import com.kalaazu.persistence.database.entities.galaxygates_spawns.generated.GeneratedGalaxygatesSpawnsImpl;

/**
 * The default implementation of the {@link
 * GalaxygatesSpawns}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class GalaxygatesSpawnsImpl
        extends GeneratedGalaxygatesSpawnsImpl
        implements GalaxygatesSpawns {
    /**
     * The npc.
     */
    private Npcs npc;

    @Override
    public Npcs npc() {
        if (this.npc != null) {
            return this.npc;
        }

        this.npc = super.findNpcsId(
                Database.instance()
                        .db()
                        .manager(Npcs.class)
        );

        return this.npc;
    }
}