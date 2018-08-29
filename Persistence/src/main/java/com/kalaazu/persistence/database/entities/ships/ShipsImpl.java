package com.kalaazu.persistence.database.entities.ships;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Items;
import com.kalaazu.persistence.database.entities.Ships;
import com.kalaazu.persistence.database.entities.ships.generated.GeneratedShipsImpl;

/**
 * The default implementation of the {@link
 * Ships}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class ShipsImpl
        extends GeneratedShipsImpl
        implements Ships {
    /**
     * The item.
     */
    private Items item;

    @Override
    public Items item() {
        if (this.item != null) {
            return this.item;
        }

        this.item = super.findItemsId(
                Database.instance()
                        .db()
                        .manager(Items.class)
        );

        return this.item;
    }
}