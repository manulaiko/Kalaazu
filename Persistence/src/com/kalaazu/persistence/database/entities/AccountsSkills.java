package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_skills.generated.GeneratedAccountsSkills;

/**
 * The main interface for entities of the {@code accounts_skills}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface AccountsSkills extends GeneratedAccountsSkills, Entity<Integer> {
    /**
     * Returns the account.
     *
     * @return The account.
     */
    Accounts getAccount();

    /**
     * Returns the skill.
     *
     * @return The skill.
     */
    SkilltreeSkills getSkill();

    /**
     * Returns the skill level.
     *
     * @return Skill level.
     */
    SkilltreeLevels getLevel();
}