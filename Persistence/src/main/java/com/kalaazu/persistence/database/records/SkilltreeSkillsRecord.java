/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.records;


import com.kalaazu.persistence.database.tables.SkilltreeSkills;
import org.jooq.Field;
import org.jooq.Record1;
import org.jooq.Record8;
import org.jooq.Row8;
import org.jooq.impl.UpdatableRecordImpl;

import javax.annotation.processing.Generated;


/**
 * The available skills.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class SkilltreeSkillsRecord extends UpdatableRecordImpl<SkilltreeSkillsRecord> implements Record8<Byte, String, String, Byte, Byte, String, Integer, Byte> {

    private static final long serialVersionUID = 287225234;

    /**
     * Create a detached SkilltreeSkillsRecord
     */
    public SkilltreeSkillsRecord() {
        super(SkilltreeSkills.SKILLTREE_SKILLS);
    }

    /**
     * Create a detached, initialised SkilltreeSkillsRecord
     */
    public SkilltreeSkillsRecord(
            Byte id, String name, String description, Byte type, Byte isAdvanced, String bonusType, Integer bonusAmount,
            Byte bonusFactor
    ) {
        super(SkilltreeSkills.SKILLTREE_SKILLS);

        set(0, id);
        set(1, name);
        set(2, description);
        set(3, type);
        set(4, isAdvanced);
        set(5, bonusType);
        set(6, bonusAmount);
        set(7, bonusFactor);
    }

    /**
     * Getter for <code>kalaazu.skilltree_skills.id</code>. Primary Key.
     */
    public Byte getId() {
        return (Byte) get(0);
    }

    /**
     * Setter for <code>kalaazu.skilltree_skills.id</code>. Primary Key.
     */
    public void setId(Byte value) {
        set(0, value);
    }

    /**
     * Getter for <code>kalaazu.skilltree_skills.name</code>. Skill name.
     */
    public String getName() {
        return (String) get(1);
    }

    /**
     * Setter for <code>kalaazu.skilltree_skills.name</code>. Skill name.
     */
    public void setName(String value) {
        set(1, value);
    }

    /**
     * Getter for <code>kalaazu.skilltree_skills.description</code>. Skill description.
     */
    public String getDescription() {
        return (String) get(2);
    }

    /**
     * Setter for <code>kalaazu.skilltree_skills.description</code>. Skill description.
     */
    public void setDescription(String value) {
        set(2, value);
    }

    /**
     * Getter for <code>kalaazu.skilltree_skills.type</code>. 0 = blue, 1 = purple, 2 = red.
     */
    public Byte getType() {
        return (Byte) get(3);
    }

    /**
     * Setter for <code>kalaazu.skilltree_skills.type</code>. 0 = blue, 1 = purple, 2 = red.
     */
    public void setType(Byte value) {
        set(3, value);
    }

    /**
     * Getter for <code>kalaazu.skilltree_skills.is_advanced</code>. Whether it's an advanced skill or not.
     */
    public Byte getIsAdvanced() {
        return (Byte) get(4);
    }

    /**
     * Setter for <code>kalaazu.skilltree_skills.is_advanced</code>. Whether it's an advanced skill or not.
     */
    public void setIsAdvanced(Byte value) {
        set(4, value);
    }

    /**
     * Getter for <code>kalaazu.skilltree_skills.bonus_type</code>. Type of bonus the skill awards.
     */
    public String getBonusType() {
        return (String) get(5);
    }

    /**
     * Setter for <code>kalaazu.skilltree_skills.bonus_type</code>. Type of bonus the skill awards.
     */
    public void setBonusType(String value) {
        set(5, value);
    }

    /**
     * Getter for <code>kalaazu.skilltree_skills.bonus_amount</code>. Amount of bonus the skill awards.
     */
    public Integer getBonusAmount() {
        return (Integer) get(6);
    }

    /**
     * Setter for <code>kalaazu.skilltree_skills.bonus_amount</code>. Amount of bonus the skill awards.
     */
    public void setBonusAmount(Integer value) {
        set(6, value);
    }

    // -------------------------------------------------------------------------
    // Primary key information
    // -------------------------------------------------------------------------

    /**
     * Getter for <code>kalaazu.skilltree_skills.bonus_factor</code>. Factor the bonus increases with each upgrade.
     */
    public Byte getBonusFactor() {
        return (Byte) get(7);
    }

    // -------------------------------------------------------------------------
    // Record8 type implementation
    // -------------------------------------------------------------------------

    /**
     * Setter for <code>kalaazu.skilltree_skills.bonus_factor</code>. Factor the bonus increases with each upgrade.
     */
    public void setBonusFactor(Byte value) {
        set(7, value);
    }

    @Override
    public Record1<Byte> key() {
        return (Record1) super.key();
    }

    @Override
    public Row8<Byte, String, String, Byte, Byte, String, Integer, Byte> fieldsRow() {
        return (Row8) super.fieldsRow();
    }

    @Override
    public Row8<Byte, String, String, Byte, Byte, String, Integer, Byte> valuesRow() {
        return (Row8) super.valuesRow();
    }

    @Override
    public Field<Byte> field1() {
        return SkilltreeSkills.SKILLTREE_SKILLS.ID;
    }

    @Override
    public Field<String> field2() {
        return SkilltreeSkills.SKILLTREE_SKILLS.NAME;
    }

    @Override
    public Field<String> field3() {
        return SkilltreeSkills.SKILLTREE_SKILLS.DESCRIPTION;
    }

    @Override
    public Field<Byte> field4() {
        return SkilltreeSkills.SKILLTREE_SKILLS.TYPE;
    }

    @Override
    public Field<Byte> field5() {
        return SkilltreeSkills.SKILLTREE_SKILLS.IS_ADVANCED;
    }

    @Override
    public Field<String> field6() {
        return SkilltreeSkills.SKILLTREE_SKILLS.BONUS_TYPE;
    }

    @Override
    public Field<Integer> field7() {
        return SkilltreeSkills.SKILLTREE_SKILLS.BONUS_AMOUNT;
    }

    @Override
    public Field<Byte> field8() {
        return SkilltreeSkills.SKILLTREE_SKILLS.BONUS_FACTOR;
    }

    @Override
    public Byte component1() {
        return getId();
    }

    @Override
    public String component2() {
        return getName();
    }

    @Override
    public String component3() {
        return getDescription();
    }

    @Override
    public Byte component4() {
        return getType();
    }

    @Override
    public Byte component5() {
        return getIsAdvanced();
    }

    @Override
    public String component6() {
        return getBonusType();
    }

    @Override
    public Integer component7() {
        return getBonusAmount();
    }

    @Override
    public Byte component8() {
        return getBonusFactor();
    }

    @Override
    public Byte value1() {
        return getId();
    }

    @Override
    public String value2() {
        return getName();
    }

    @Override
    public String value3() {
        return getDescription();
    }

    @Override
    public Byte value4() {
        return getType();
    }

    @Override
    public Byte value5() {
        return getIsAdvanced();
    }

    @Override
    public String value6() {
        return getBonusType();
    }

    @Override
    public Integer value7() {
        return getBonusAmount();
    }

    @Override
    public Byte value8() {
        return getBonusFactor();
    }

    @Override
    public SkilltreeSkillsRecord value1(Byte value) {
        setId(value);
        return this;
    }

    @Override
    public SkilltreeSkillsRecord value2(String value) {
        setName(value);
        return this;
    }

    @Override
    public SkilltreeSkillsRecord value3(String value) {
        setDescription(value);
        return this;
    }

    @Override
    public SkilltreeSkillsRecord value4(Byte value) {
        setType(value);
        return this;
    }

    @Override
    public SkilltreeSkillsRecord value5(Byte value) {
        setIsAdvanced(value);
        return this;
    }

    @Override
    public SkilltreeSkillsRecord value6(String value) {
        setBonusType(value);
        return this;
    }

    @Override
    public SkilltreeSkillsRecord value7(Integer value) {
        setBonusAmount(value);
        return this;
    }

    // -------------------------------------------------------------------------
    // Constructors
    // -------------------------------------------------------------------------

    @Override
    public SkilltreeSkillsRecord value8(Byte value) {
        setBonusFactor(value);
        return this;
    }

    @Override
    public SkilltreeSkillsRecord values(
            Byte value1, String value2, String value3, Byte value4, Byte value5, String value6, Integer value7,
            Byte value8
    ) {
        value1(value1);
        value2(value2);
        value3(value3);
        value4(value4);
        value5(value5);
        value6(value6);
        value7(value7);
        value8(value8);
        return this;
    }
}