package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.skilltree_skills.generated.GeneratedSkilltreeSkills;

import java.util.List;

/**
 * The main interface for entities of the {@code skilltree_skills}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface SkilltreeSkills extends GeneratedSkilltreeSkills, Entity<Byte> {
    /**
     * Returns skill levels.
     *
     * @return Skill levels.
     */
    List<SkilltreeLevels> getLevels();
}