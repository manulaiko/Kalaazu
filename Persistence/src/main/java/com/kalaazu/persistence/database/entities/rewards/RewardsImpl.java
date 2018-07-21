package com.kalaazu.persistence.database.entities.rewards;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Items;
import com.kalaazu.persistence.database.entities.Rewards;
import com.kalaazu.persistence.database.entities.rewards.generated.GeneratedRewardsImpl;

/**
 * The default implementation of the {@link
 * Rewards}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class RewardsImpl
        extends GeneratedRewardsImpl
        implements Rewards {
    /**
     * The item.
     */
    private Items item;

    @Override
    public Items getItem() {
        if (this.item != null) {
            return this.item;
        }

        this.item = super.findItemsId(
                Database.getInstance()
                        .db()
                        .manager(Items.class)
        );

        return this.item;
    }
}