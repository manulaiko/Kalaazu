package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.skilltree_skills.generated.GeneratedSkilltreeSkills;

import java.util.List;

/**
 * Skilltree skills table.
 * =======================
 *
 * Contains the different skills.
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