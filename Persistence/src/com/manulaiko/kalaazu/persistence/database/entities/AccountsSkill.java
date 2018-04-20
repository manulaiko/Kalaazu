package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_skills", schema = "kalaazu")
public class AccountsSkill {
    private int id;

    private int accountsId;

    private int skilltreeSkillsId;

    private int skilltreeLevelsId;

    private Account accountsByAccountsId;

    private SkilltreeSkill skilltreeSkillsBySkilltreeSkillsId;

    private SkilltreeLevel skilltreeLevelsBySkilltreeLevelsId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "accounts_id")
    public int getAccountsId() {
        return accountsId;
    }

    public void setAccountsId(int accountsId) {
        this.accountsId = accountsId;
    }

    @Basic
    @Column(name = "skilltree_skills_id")
    public int getSkilltreeSkillsId() {
        return skilltreeSkillsId;
    }

    public void setSkilltreeSkillsId(int skilltreeSkillsId) {
        this.skilltreeSkillsId = skilltreeSkillsId;
    }

    @Basic
    @Column(name = "skilltree_levels_id")
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

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }

    @ManyToOne
    @JoinColumn(name = "skilltree_skills_id", referencedColumnName = "id", nullable = false)
    public SkilltreeSkill getSkilltreeSkillsBySkilltreeSkillsId() {
        return skilltreeSkillsBySkilltreeSkillsId;
    }

    public void setSkilltreeSkillsBySkilltreeSkillsId(
            SkilltreeSkill skilltreeSkillsBySkilltreeSkillsId
    ) {
        this.skilltreeSkillsBySkilltreeSkillsId = skilltreeSkillsBySkilltreeSkillsId;
    }

    @ManyToOne
    @JoinColumn(name = "skilltree_levels_id", referencedColumnName = "id", nullable = false)
    public SkilltreeLevel getSkilltreeLevelsBySkilltreeLevelsId() {
        return skilltreeLevelsBySkilltreeLevelsId;
    }

    public void setSkilltreeLevelsBySkilltreeLevelsId(
            SkilltreeLevel skilltreeLevelsBySkilltreeLevelsId
    ) {
        this.skilltreeLevelsBySkilltreeLevelsId = skilltreeLevelsBySkilltreeLevelsId;
    }
}
