package com.kalaazu.persistence.database.entities.levels_upgrades;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Levels;
import com.kalaazu.persistence.database.entities.LevelsUpgrades;
import com.kalaazu.persistence.database.entities.levels_upgrades.generated.GeneratedLevelsUpgradesImpl;

/**
 * The default implementation of the {@link
 * LevelsUpgrades}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class LevelsUpgradesImpl
        extends GeneratedLevelsUpgradesImpl
        implements LevelsUpgrades {
    /**
     * The level.
     */
    private Levels level;

    @Override
    public Levels level() {
        if (this.level != null) {
            return this.level;
        }

        this.level = super.findLevelsId(
                Database.getInstance()
                        .db()
                        .manager(Levels.class)
        );

        return this.level;
    }
}