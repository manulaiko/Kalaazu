package com.kalaazu.persistence.database.entities.accounts_skills;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Accounts;
import com.kalaazu.persistence.database.entities.AccountsSkills;
import com.kalaazu.persistence.database.entities.SkilltreeLevels;
import com.kalaazu.persistence.database.entities.SkilltreeSkills;
import com.kalaazu.persistence.database.entities.accounts_skills.generated.GeneratedAccountsSkillsImpl;

/**
 * The default implementation of the {@link
 * AccountsSkills}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class AccountsSkillsImpl
        extends GeneratedAccountsSkillsImpl
        implements AccountsSkills {
    /**
     * The account.
     */
    private Accounts account;

    /**
     * The skill.
     */
    private SkilltreeSkills skill;

    /**
     * The level.
     */
    private SkilltreeLevels level;

    @Override
    public Accounts account() {
        if (this.account != null) {
            return this.account;
        }

        this.account = super.findAccountsId(
                Database.getInstance()
                        .db()
                        .manager(Accounts.class)
        );

        return this.account;
    }

    @Override
    public SkilltreeSkills skill() {
        if (this.skill != null) {
            return this.skill;
        }

        this.skill = super.findSkilltreeSkillsId(
                Database.getInstance()
                        .db()
                        .manager(SkilltreeSkills.class)
        );

        return this.skill;
    }

    @Override
    public SkilltreeLevels level() {
        if (this.level != null) {
            return this.level;
        }

        this.level = super.findSkilltreeLevelsId(
                Database.getInstance()
                        .db()
                        .manager(SkilltreeLevels.class)
        );

        return this.level;
    }
}