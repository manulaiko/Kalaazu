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
    Accounts account();

    /**
     * Returns the skill.
     *
     * @return The skill.
     */
    SkilltreeSkills skill();

    /**
     * Returns the skill level.
     *
     * @return Skill level.
     */
    SkilltreeLevels level();
}