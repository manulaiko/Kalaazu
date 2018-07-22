package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.techfactory_costs.generated.GeneratedTechfactoryCosts;

/**
 * Techfactory costs table.
 * ========================
 *
 * Contains the production costs for the techfactory items.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface TechfactoryCosts extends GeneratedTechfactoryCosts, Entity<Byte> {
    /**
     * Returns the techfactory item.
     *
     * @return Techfactory item.
     */
    TechfactoryItems techfactoryItem();

    /**
     * Returns the item.
     *
     * @return Item.
     */
    Items item();
}