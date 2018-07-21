package com.kalaazu.persistence.database.entities.techfactory_costs;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Items;
import com.kalaazu.persistence.database.entities.TechfactoryCosts;
import com.kalaazu.persistence.database.entities.TechfactoryItems;
import com.kalaazu.persistence.database.entities.techfactory_costs.generated.GeneratedTechfactoryCostsImpl;

/**
 * The default implementation of the {@link
 * TechfactoryCosts}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class TechfactoryCostsImpl
        extends GeneratedTechfactoryCostsImpl
        implements TechfactoryCosts {
    /**
     * The techfactoryItem.
     */
    private TechfactoryItems techfactoryItem;

    /**
     * The item.
     */
    private Items item;

    @Override
    public TechfactoryItems getTechfactoryItem() {
        if (this.techfactoryItem != null) {
            return this.techfactoryItem;
        }

        this.techfactoryItem = super.findTechfactoryItemsId(
                Database.getInstance()
                        .db()
                        .manager(TechfactoryItems.class)
        );

        return this.techfactoryItem;
    }

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