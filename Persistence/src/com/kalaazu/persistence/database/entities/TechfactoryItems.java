package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.techfactory_items.generated.GeneratedTechfactoryItems;

import java.util.List;

/**
 * The main interface for entities of the {@code techfactory_items}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface TechfactoryItems extends GeneratedTechfactoryItems, Entity<Byte> {
    /**
     * Returns production costs.
     *
     * @return Production costs.
     */
    List<TechfactoryCosts> getCosts();
}