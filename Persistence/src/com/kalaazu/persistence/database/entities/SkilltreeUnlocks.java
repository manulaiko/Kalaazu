package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.skilltree_unlocks.generated.GeneratedSkilltreeUnlocks;

/**
 * The main interface for entities of the {@code skilltree_unlocks}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface SkilltreeUnlocks extends GeneratedSkilltreeUnlocks, Entity<Short> {
    /**
     * Returns the skill to upgrade.
     *
     * @return Skill to upgrade.
     */
    SkilltreeLevels getUpgrade();

    /**
     * Returns the required skill.
     *
     * @return Required skill.
     */
    SkilltreeLevels getRequired();
}