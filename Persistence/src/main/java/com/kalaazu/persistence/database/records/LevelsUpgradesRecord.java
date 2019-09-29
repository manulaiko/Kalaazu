/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.records;


import com.kalaazu.persistence.database.tables.LevelsUpgrades;
import org.jooq.Field;
import org.jooq.Record1;
import org.jooq.Record5;
import org.jooq.Row5;
import org.jooq.impl.UpdatableRecordImpl;

import javax.annotation.processing.Generated;


/**
 * Contains the upgrade costs for each level.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class LevelsUpgradesRecord extends UpdatableRecordImpl<LevelsUpgradesRecord> implements Record5<Integer, Byte, Byte, Integer, Short> {

    private static final long serialVersionUID = 51217995;

    /**
     * Create a detached LevelsUpgradesRecord
     */
    public LevelsUpgradesRecord() {
        super(LevelsUpgrades.LEVELS_UPGRADES);
    }

    /**
     * Create a detached, initialised LevelsUpgradesRecord
     */
    public LevelsUpgradesRecord(Integer id, Byte levelsId, Byte probability, Integer credits, Short uridium) {
        super(LevelsUpgrades.LEVELS_UPGRADES);

        set(0, id);
        set(1, levelsId);
        set(2, probability);
        set(3, credits);
        set(4, uridium);
    }

    /**
     * Getter for <code>kalaazu.levels_upgrades.id</code>. Primary Key.
     */
    public Integer getId() {
        return (Integer) get(0);
    }

    /**
     * Setter for <code>kalaazu.levels_upgrades.id</code>. Primary Key.
     */
    public void setId(Integer value) {
        set(0, value);
    }

    /**
     * Getter for <code>kalaazu.levels_upgrades.levels_id</code>. The upgrade level.
     */
    public Byte getLevelsId() {
        return (Byte) get(1);
    }

    /**
     * Setter for <code>kalaazu.levels_upgrades.levels_id</code>. The upgrade level.
     */
    public void setLevelsId(Byte value) {
        set(1, value);
    }

    /**
     * Getter for <code>kalaazu.levels_upgrades.probability</code>. Probability level.
     */
    public Byte getProbability() {
        return (Byte) get(2);
    }

    /**
     * Setter for <code>kalaazu.levels_upgrades.probability</code>. Probability level.
     */
    public void setProbability(Byte value) {
        set(2, value);
    }

    /**
     * Getter for <code>kalaazu.levels_upgrades.credits</code>. Credits needed to upgrade to this level with given probability.
     */
    public Integer getCredits() {
        return (Integer) get(3);
    }

    /**
     * Setter for <code>kalaazu.levels_upgrades.credits</code>. Credits needed to upgrade to this level with given probability.
     */
    public void setCredits(Integer value) {
        set(3, value);
    }

    // -------------------------------------------------------------------------
    // Primary key information
    // -------------------------------------------------------------------------

    /**
     * Getter for <code>kalaazu.levels_upgrades.uridium</code>. Uridium needed to upgrade to this level with given probability.
     */
    public Short getUridium() {
        return (Short) get(4);
    }

    // -------------------------------------------------------------------------
    // Record5 type implementation
    // -------------------------------------------------------------------------

    /**
     * Setter for <code>kalaazu.levels_upgrades.uridium</code>. Uridium needed to upgrade to this level with given probability.
     */
    public void setUridium(Short value) {
        set(4, value);
    }

    @Override
    public Record1<Integer> key() {
        return (Record1) super.key();
    }

    @Override
    public Row5<Integer, Byte, Byte, Integer, Short> fieldsRow() {
        return (Row5) super.fieldsRow();
    }

    @Override
    public Row5<Integer, Byte, Byte, Integer, Short> valuesRow() {
        return (Row5) super.valuesRow();
    }

    @Override
    public Field<Integer> field1() {
        return LevelsUpgrades.LEVELS_UPGRADES.ID;
    }

    @Override
    public Field<Byte> field2() {
        return LevelsUpgrades.LEVELS_UPGRADES.LEVELS_ID;
    }

    @Override
    public Field<Byte> field3() {
        return LevelsUpgrades.LEVELS_UPGRADES.PROBABILITY;
    }

    @Override
    public Field<Integer> field4() {
        return LevelsUpgrades.LEVELS_UPGRADES.CREDITS;
    }

    @Override
    public Field<Short> field5() {
        return LevelsUpgrades.LEVELS_UPGRADES.URIDIUM;
    }

    @Override
    public Integer component1() {
        return getId();
    }

    @Override
    public Byte component2() {
        return getLevelsId();
    }

    @Override
    public Byte component3() {
        return getProbability();
    }

    @Override
    public Integer component4() {
        return getCredits();
    }

    @Override
    public Short component5() {
        return getUridium();
    }

    @Override
    public Integer value1() {
        return getId();
    }

    @Override
    public Byte value2() {
        return getLevelsId();
    }

    @Override
    public Byte value3() {
        return getProbability();
    }

    @Override
    public Integer value4() {
        return getCredits();
    }

    @Override
    public Short value5() {
        return getUridium();
    }

    @Override
    public LevelsUpgradesRecord value1(Integer value) {
        setId(value);
        return this;
    }

    @Override
    public LevelsUpgradesRecord value2(Byte value) {
        setLevelsId(value);
        return this;
    }

    @Override
    public LevelsUpgradesRecord value3(Byte value) {
        setProbability(value);
        return this;
    }

    @Override
    public LevelsUpgradesRecord value4(Integer value) {
        setCredits(value);
        return this;
    }

    // -------------------------------------------------------------------------
    // Constructors
    // -------------------------------------------------------------------------

    @Override
    public LevelsUpgradesRecord value5(Short value) {
        setUridium(value);
        return this;
    }

    @Override
    public LevelsUpgradesRecord values(Integer value1, Byte value2, Byte value3, Integer value4, Short value5) {
        value1(value1);
        value2(value2);
        value3(value3);
        value4(value4);
        value5(value5);
        return this;
    }
}
