package com.kalaazu.persistence.database.entities.factions;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Factions;
import com.kalaazu.persistence.database.entities.Maps;
import com.kalaazu.persistence.database.entities.factions.generated.GeneratedFactionsImpl;

/**
 * The default implementation of the {@link
 * Factions}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class FactionsImpl
        extends GeneratedFactionsImpl
        implements Factions {
    /**
     * Home lower map.
     */
    private Maps lowerMap;

    /**
     * Home high map.
     */
    private Maps highMap;

    @Override
    public Maps lowMap() {
        if (this.lowerMap != null) {
            return this.lowerMap;
        }

        this.lowerMap = super.findLowMapsId(
                Database.getInstance()
                        .db()
                        .manager(Maps.class)
        );

        return this.lowerMap;
    }

    @Override
    public Maps highMap() {
        if (this.highMap != null) {
            return this.highMap;
        }

        this.highMap = super.findHighMapsId(
                Database.getInstance()
                        .db()
                        .manager(Maps.class)
        );

        return this.highMap;
    }
}