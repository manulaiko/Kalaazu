package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.techfactory_items.generated.GeneratedTechfactoryItems;

import java.util.List;

/**
 * Techfactory items table.
 * ========================
 *
 * Contains the items that can be produced in the techfactory.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface TechfactoryItems extends GeneratedTechfactoryItems, Entity<Byte> {
    /**
     * Returns production costs.
     *
     * @return Production costs.
     */
    List<TechfactoryCosts> costs();
}