package com.kalaazu.persistence.database.entities.galaxygates_spins;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.GalaxygatesSpins;
import com.kalaazu.persistence.database.entities.Items;
import com.kalaazu.persistence.database.entities.galaxygates_spins.generated.GeneratedGalaxygatesSpinsImpl;

/**
 * The default implementation of the {@link
 * GalaxygatesSpins}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class GalaxygatesSpinsImpl
        extends GeneratedGalaxygatesSpinsImpl
        implements GalaxygatesSpins {
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