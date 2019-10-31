package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "skilltree_skills", schema = "kalaazu", catalog = "")
public class SkilltreeSkillsEntity {
    private byte   id;
    private String name;
    private String description;
    private byte   type;
    private byte   isAdvanced;
    private String bonusType;
    private int    bonusAmount;
    private byte   bonusFactor;

    @Id
    @Column(name = "id", nullable = false)
    public byte getId() {
        return id;
    }

    public void setId(byte id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name", nullable = false, length = 255)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "description", nullable = false, length = -1)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "type", nullable = false)
    public byte getType() {
        return type;
    }

    public void setType(byte type) {
        this.type = type;
    }

    @Basic
    @Column(name = "is_advanced", nullable = false)
    public byte getIsAdvanced() {
        return isAdvanced;
    }

    public void setIsAdvanced(byte isAdvanced) {
        this.isAdvanced = isAdvanced;
    }

    @Basic
    @Column(name = "bonus_type", nullable = false, length = 255)
    public String getBonusType() {
        return bonusType;
    }

    public void setBonusType(String bonusType) {
        this.bonusType = bonusType;
    }

    @Basic
    @Column(name = "bonus_amount", nullable = false)
    public int getBonusAmount() {
        return bonusAmount;
    }

    public void setBonusAmount(int bonusAmount) {
        this.bonusAmount = bonusAmount;
    }

    @Basic
    @Column(name = "bonus_factor", nullable = false)
    public byte getBonusFactor() {
        return bonusFactor;
    }

    public void setBonusFactor(byte bonusFactor) {
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
        SkilltreeSkillsEntity that = (SkilltreeSkillsEntity) o;
        return id == that.id &&
               type == that.type &&
               isAdvanced == that.isAdvanced &&
               bonusAmount == that.bonusAmount &&
               bonusFactor == that.bonusFactor &&
               Objects.equals(name, that.name) &&
               Objects.equals(description, that.description) &&
               Objects.equals(bonusType, that.bonusType);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, description, type, isAdvanced, bonusType, bonusAmount, bonusFactor);
    }
}
