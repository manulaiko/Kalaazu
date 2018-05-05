package com.kalaazu.persistence.database.entities.skilltree_skills;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.SkilltreeLevels;
import com.kalaazu.persistence.database.entities.SkilltreeSkills;
import com.kalaazu.persistence.database.entities.skilltree_skills.generated.GeneratedSkilltreeSkillsImpl;

import java.util.List;
import java.util.stream.Collectors;

/**
 * The default implementation of the {@link
 * SkilltreeSkills}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class SkilltreeSkillsImpl
        extends GeneratedSkilltreeSkillsImpl
        implements SkilltreeSkills {
    /**
     * Skill levels.
     */
    private List<SkilltreeLevels> levels;

    @Override
    public List<SkilltreeLevels> getLevels() {
        if (this.levels != null) {
            return this.levels;
        }

        this.levels = Database.getInstance()
                              .all(SkilltreeLevels.class)
                              .filter(l -> l.getSkilltreeSkillsId() == super.getId())
                              .collect(Collectors.toList());

        return this.levels;
    }
}