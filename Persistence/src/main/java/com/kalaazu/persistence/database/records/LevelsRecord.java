/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.records;


import com.kalaazu.persistence.database.tables.Levels;
import org.jooq.Field;
import org.jooq.Record1;
import org.jooq.Record6;
import org.jooq.Row6;
import org.jooq.impl.UpdatableRecordImpl;

import javax.annotation.processing.Generated;


/**
 * Contains server's levels.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class LevelsRecord extends UpdatableRecordImpl<LevelsRecord> implements Record6<Byte, Long, Short, Integer, Double, Double> {

    private static final long serialVersionUID = 1143432663;

    /**
     * Create a detached LevelsRecord
     */
    public LevelsRecord() {
        super(Levels.LEVELS);
    }

    /**
     * Create a detached, initialised LevelsRecord
     */
    public LevelsRecord(Byte id, Long account, Short drone, Integer pet, Double damage, Double shield) {
        super(Levels.LEVELS);

        set(0, id);
        set(1, account);
        set(2, drone);
        set(3, pet);
        set(4, damage);
        set(5, shield);
    }

    /**
     * Getter for <code>kalaazu.levels.id</code>. Primary Key.
     */
    public Byte getId() {
        return (Byte) get(0);
    }

    /**
     * Setter for <code>kalaazu.levels.id</code>. Primary Key.
     */
    public void setId(Byte value) {
        set(0, value);
    }

    /**
     * Getter for <code>kalaazu.levels.account</code>. Experience needed for an account to reach this level.
     */
    public Long getAccount() {
        return (Long) get(1);
    }

    /**
     * Setter for <code>kalaazu.levels.account</code>. Experience needed for an account to reach this level.
     */
    public void setAccount(Long value) {
        set(1, value);
    }

    /**
     * Getter for <code>kalaazu.levels.drone</code>. Experience needed for a drone to reach this level
     */
    public Short getDrone() {
        return (Short) get(2);
    }

    /**
     * Setter for <code>kalaazu.levels.drone</code>. Experience needed for a drone to reach this level
     */
    public void setDrone(Short value) {
        set(2, value);
    }

    /**
     * Getter for <code>kalaazu.levels.pet</code>. Experience needed for a PET to reach this level.
     */
    public Integer getPet() {
        return (Integer) get(3);
    }

    /**
     * Setter for <code>kalaazu.levels.pet</code>. Experience needed for a PET to reach this level.
     */
    public void setPet(Integer value) {
        set(3, value);
    }

    /**
     * Getter for <code>kalaazu.levels.damage</code>. Damage bonus applied for an item at this level.
     */
    public Double getDamage() {
        return (Double) get(4);
    }

    /**
     * Setter for <code>kalaazu.levels.damage</code>. Damage bonus applied for an item at this level.
     */
    public void setDamage(Double value) {
        set(4, value);
    }

    // -------------------------------------------------------------------------
    // Primary key information
    // -------------------------------------------------------------------------

    /**
     * Getter for <code>kalaazu.levels.shield</code>. Shield bonus applied to an item at this level.
     */
    public Double getShield() {
        return (Double) get(5);
    }

    // -------------------------------------------------------------------------
    // Record6 type implementation
    // -------------------------------------------------------------------------

    /**
     * Setter for <code>kalaazu.levels.shield</code>. Shield bonus applied to an item at this level.
     */
    public void setShield(Double value) {
        set(5, value);
    }

    @Override
    public Record1<Byte> key() {
        return (Record1) super.key();
    }

    @Override
    public Row6<Byte, Long, Short, Integer, Double, Double> fieldsRow() {
        return (Row6) super.fieldsRow();
    }

    @Override
    public Row6<Byte, Long, Short, Integer, Double, Double> valuesRow() {
        return (Row6) super.valuesRow();
    }

    @Override
    public Field<Byte> field1() {
        return Levels.LEVELS.ID;
    }

    @Override
    public Field<Long> field2() {
        return Levels.LEVELS.ACCOUNT;
    }

    @Override
    public Field<Short> field3() {
        return Levels.LEVELS.DRONE;
    }

    @Override
    public Field<Integer> field4() {
        return Levels.LEVELS.PET;
    }

    @Override
    public Field<Double> field5() {
        return Levels.LEVELS.DAMAGE;
    }

    @Override
    public Field<Double> field6() {
        return Levels.LEVELS.SHIELD;
    }

    @Override
    public Byte component1() {
        return getId();
    }

    @Override
    public Long component2() {
        return getAccount();
    }

    @Override
    public Short component3() {
        return getDrone();
    }

    @Override
    public Integer component4() {
        return getPet();
    }

    @Override
    public Double component5() {
        return getDamage();
    }

    @Override
    public Double component6() {
        return getShield();
    }

    @Override
    public Byte value1() {
        return getId();
    }

    @Override
    public Long value2() {
        return getAccount();
    }

    @Override
    public Short value3() {
        return getDrone();
    }

    @Override
    public Integer value4() {
        return getPet();
    }

    @Override
    public Double value5() {
        return getDamage();
    }

    @Override
    public Double value6() {
        return getShield();
    }

    @Override
    public LevelsRecord value1(Byte value) {
        setId(value);
        return this;
    }

    @Override
    public LevelsRecord value2(Long value) {
        setAccount(value);
        return this;
    }

    @Override
    public LevelsRecord value3(Short value) {
        setDrone(value);
        return this;
    }

    @Override
    public LevelsRecord value4(Integer value) {
        setPet(value);
        return this;
    }

    @Override
    public LevelsRecord value5(Double value) {
        setDamage(value);
        return this;
    }

    // -------------------------------------------------------------------------
    // Constructors
    // -------------------------------------------------------------------------

    @Override
    public LevelsRecord value6(Double value) {
        setShield(value);
        return this;
    }

    @Override
    public LevelsRecord values(Byte value1, Long value2, Short value3, Integer value4, Double value5, Double value6) {
        value1(value1);
        value2(value2);
        value3(value3);
        value4(value4);
        value5(value5);
        value6(value6);
        return this;
    }
}
