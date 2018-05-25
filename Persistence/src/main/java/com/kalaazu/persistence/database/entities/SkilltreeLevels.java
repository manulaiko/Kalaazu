package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.skilltree_levels.generated.GeneratedSkilltreeLevels;

/**
 * Skilltree levels table.
 * =======================
 *
 * Contains the costs to upgrade a skill to a certain level.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface SkilltreeLevels extends GeneratedSkilltreeLevels, Entity<Short> {
    /**
     * Returns the skill.
     *
     * @return The skill.
     */
    SkilltreeSkills getSkill();

    /**
     * Returns the level.
     *
     * @return The level.
     */
    Levels getLevel();
}