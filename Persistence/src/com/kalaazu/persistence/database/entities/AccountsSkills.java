package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.accounts_skills.generated.GeneratedAccountsSkills;

/**
 * Accounts' skills table.
 * =======================
 *
 * Contains the skills of an account.
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