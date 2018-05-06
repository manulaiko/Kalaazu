package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.levels_upgrades.generated.GeneratedLevelsUpgrades;

/**
 * Level upgrades table.
 * =====================
 *
 * Contains the costs to upgrade to each level.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface LevelsUpgrades extends GeneratedLevelsUpgrades, Entity<Integer> {
    /**
     * Returns the level.
     *
     * @return The level.
     */
    Levels getLevel();
}