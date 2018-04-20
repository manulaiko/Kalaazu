package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "skilltree_skills", schema = "kalaazu")
public class SkilltreeSkill {
    private int id;

    private String name;

    private String description;

    private byte category;

    private boolean isAdvanced;

    private String bonusType;

    private int bonusAmount;

    private BigDecimal bonusFactor;

    private Collection<AccountsSkill> accountsSkillsById;

    private Collection<SkilltreeLevel> skilltreeLevelsById;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "category")
    public byte getCategory() {
        return category;
    }

    public void setCategory(byte category) {
        this.category = category;
    }

    @Basic
    @Column(name = "is_advanced")
    public boolean isAdvanced() {
        return isAdvanced;
    }

    public void setAdvanced(boolean advanced) {
        isAdvanced = advanced;
    }

    @Basic
    @Column(name = "bonus_type")
    public String getBonusType() {
        return bonusType;
    }

    public void setBonusType(String bonusType) {
        this.bonusType = bonusType;
    }

    @Basic
    @Column(name = "bonus_amount")
    public int getBonusAmount() {
        return bonusAmount;
    }

    public void setBonusAmount(int bonusAmount) {
        this.bonusAmount = bonusAmount;
    }

    @Basic
    @Column(name = "bonus_factor")
    public BigDecimal getBonusFactor() {
        return bonusFactor;
    }

    public void setBonusFactor(BigDecimal bonusFactor) {
        this.bonusFactor = bonusFactor;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        SkilltreeSkill that = (SkilltreeSkill) o;
        return id == that.id &&
               category == that.category &&
               isAdvanced == that.isAdvanced &&
               bonusAmount == that.bonusAmount &&
               Objects.equals(name, that.name) &&
               Objects.equals(description, that.description) &&
               Objects.equals(bonusType, that.bonusType) &&
               Objects.equals(bonusFactor, that.bonusFactor);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, name, description, category, isAdvanced, bonusType, bonusAmount, bonusFactor);
    }

    @OneToMany(mappedBy = "skilltreeSkillsBySkilltreeSkillsId")
    public Collection<AccountsSkill> getAccountsSkillsById() {
        return accountsSkillsById;
    }

    public void setAccountsSkillsById(
            Collection<AccountsSkill> accountsSkillsById
    ) {
        this.accountsSkillsById = accountsSkillsById;
    }

    @OneToMany(mappedBy = "skilltreeSkillsBySkilltreeSkillsId")
    public Collection<SkilltreeLevel> getSkilltreeLevelsById() {
        return skilltreeLevelsById;
    }

    public void setSkilltreeLevelsById(
            Collection<SkilltreeLevel> skilltreeLevelsById
    ) {
        this.skilltreeLevelsById = skilltreeLevelsById;
    }
}
