package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.skilltree_levels.generated.GeneratedSkilltreeLevels;

/**
 * The main interface for entities of the {@code skilltree_levels}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
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