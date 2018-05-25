package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.ships.generated.GeneratedShips;

/**
 * Ships table.
 * ============
 *
 * Contains the ships an account can have.
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