package com.kalaazu.persistence.database.entities.skilltree_levels;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Levels;
import com.kalaazu.persistence.database.entities.SkilltreeLevels;
import com.kalaazu.persistence.database.entities.SkilltreeSkills;
import com.kalaazu.persistence.database.entities.skilltree_levels.generated.GeneratedSkilltreeLevelsImpl;

/**
 * The default implementation of the {@link
 * SkilltreeLevels}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class SkilltreeLevelsImpl
        extends GeneratedSkilltreeLevelsImpl
        implements SkilltreeLevels {
    /**
     * The skill.
     */
    private SkilltreeSkills skill;

    /**
     * The level.
     */
    private Levels level;

    @Override
    public SkilltreeSkills getSkill() {
        if (this.skill != null) {
            return this.skill;
        }

        this.skill = super.findSkilltreeSkillsId(
                Database.getInstance()
                        .getDb()
                        .manager(SkilltreeSkills.class)
        );

        return this.skill;
    }

    @Override
    public Levels getLevel() {
        if (this.level != null) {
            return this.level;
        }

        this.level = super.findLevelsId(
                Database.getInstance()
                        .getDb()
                        .manager(Levels.class)
        );

        return this.level;
    }
}