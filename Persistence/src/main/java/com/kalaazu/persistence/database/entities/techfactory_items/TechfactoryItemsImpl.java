package com.kalaazu.persistence.database.entities.techfactory_items;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.TechfactoryCosts;
import com.kalaazu.persistence.database.entities.TechfactoryItems;
import com.kalaazu.persistence.database.entities.techfactory_items.generated.GeneratedTechfactoryItemsImpl;

import java.util.List;
import java.util.stream.Collectors;

/**
 * The default implementation of the {@link
 * TechfactoryItems}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class TechfactoryItemsImpl
        extends GeneratedTechfactoryItemsImpl
        implements TechfactoryItems {
    /**
     * Production costs.
     */
    private List<TechfactoryCosts> costs;

    @Override
    public List<TechfactoryCosts> costs() {
        if (this.costs != null) {
            return this.costs;
        }

        this.costs = Database.getInstance()
                             .all(TechfactoryCosts.class)
                             .filter(TechfactoryCosts.TECHFACTORY_ITEMS_ID.equal(super.getId()))
                             .collect(Collectors.toList());

        return this.costs;
    }
}