package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.skilltree_unlocks.generated.GeneratedSkilltreeUnlocks;

/**
 * Skilltree unlocks table.
 * ========================
 *
 * Contains the required conditions to unlock a skill.
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