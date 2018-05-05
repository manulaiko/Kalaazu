package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.ships.generated.GeneratedShips;

/**
 * The main interface for entities of the {@code ships}-table in the database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Ships extends GeneratedShips, Entity<Byte> {
    /**
     * Returns the ship item.
     *
     * @return Ship item.
     */
    Items getItem();
}