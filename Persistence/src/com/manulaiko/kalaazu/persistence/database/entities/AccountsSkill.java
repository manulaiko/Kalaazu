package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class AccountsSkill {
    private int id;

    private int accountsId;

    private int skilltreeSkillsId;

    private int skilltreeLevelsId;

    private Account accountsByAccountsId;

    private SkilltreeSkill skilltreeSkillsBySkilltreeSkillsId;

    private SkilltreeLevel skilltreeLevelsBySkilltreeLevelsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountsId() {
        return accountsId;
    }

    public void setAccountsId(int accountsId) {
        this.accountsId = accountsId;
    }

    public int getSkilltreeSkillsId() {
        return skilltreeSkillsId;
    }

    public void setSkilltreeSkillsId(int skilltreeSkillsId) {
        this.skilltreeSkillsId = skilltreeSkillsId;
    }

    public int getSkilltreeLevelsId() {
        return skilltreeLevelsId;
    }

    public void setSkilltreeLevelsId(int skilltreeLevelsId) {
        this.skilltreeLevelsId = skilltreeLevelsId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AccountsSkill that = (AccountsSkill) o;
        return id == that.id &&
               accountsId == that.accountsId &&
               skilltreeSkillsId == that.skilltreeSkillsId &&
               skilltreeLevelsId == that.skilltreeLevelsId;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, accountsId, skilltreeSkillsId, skilltreeLevelsId);
    }

    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }

    public SkilltreeSkill getSkilltreeSkillsBySkilltreeSkillsId() {
        return skilltreeSkillsBySkilltreeSkillsId;
    }

    public void setSkilltreeSkillsBySkilltreeSkillsId(
            SkilltreeSkill skilltreeSkillsBySkilltreeSkillsId
    ) {
        this.skilltreeSkillsBySkilltreeSkillsId = skilltreeSkillsBySkilltreeSkillsId;
    }

    public SkilltreeLevel getSkilltreeLevelsBySkilltreeLevelsId() {
        return skilltreeLevelsBySkilltreeLevelsId;
    }

    public void setSkilltreeLevelsBySkilltreeLevelsId(
            SkilltreeLevel skilltreeLevelsBySkilltreeLevelsId
    ) {
        this.skilltreeLevelsBySkilltreeLevelsId = skilltreeLevelsBySkilltreeLevelsId;
    }
}
