/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.records;


import com.kalaazu.persistence.database.tables.Quests;
import org.jooq.Field;
import org.jooq.Record1;
import org.jooq.Record5;
import org.jooq.Row5;
import org.jooq.impl.UpdatableRecordImpl;

import javax.annotation.processing.Generated;


/**
 * In game quests.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class QuestsRecord extends UpdatableRecordImpl<QuestsRecord> implements Record5<Short, Byte, Short, Byte, String> {

    private static final long serialVersionUID = 1392734901;

    /**
     * Create a detached QuestsRecord
     */
    public QuestsRecord() {
        super(Quests.QUESTS);
    }

    /**
     * Create a detached, initialised QuestsRecord
     */
    public QuestsRecord(Short id, Byte levelsId, Short questsId, Byte factionsId, String name) {
        super(Quests.QUESTS);

        set(0, id);
        set(1, levelsId);
        set(2, questsId);
        set(3, factionsId);
        set(4, name);
    }

    /**
     * Getter for <code>kalaazu.quests.id</code>. Primary Key.
     */
    public Short getId() {
        return (Short) get(0);
    }

    /**
     * Setter for <code>kalaazu.quests.id</code>. Primary Key.
     */
    public void setId(Short value) {
        set(0, value);
    }

    /**
     * Getter for <code>kalaazu.quests.levels_id</code>. Level required to unlock this quest.
     */
    public Byte getLevelsId() {
        return (Byte) get(1);
    }

    /**
     * Setter for <code>kalaazu.quests.levels_id</code>. Level required to unlock this quest.
     */
    public void setLevelsId(Byte value) {
        set(1, value);
    }

    /**
     * Getter for <code>kalaazu.quests.quests_id</code>. Quest required to complete in order to unlock this quest.
     */
    public Short getQuestsId() {
        return (Short) get(2);
    }

    /**
     * Setter for <code>kalaazu.quests.quests_id</code>. Quest required to complete in order to unlock this quest.
     */
    public void setQuestsId(Short value) {
        set(2, value);
    }

    /**
     * Getter for <code>kalaazu.quests.factions_id</code>. Faction required to unlock this quest.
     */
    public Byte getFactionsId() {
        return (Byte) get(3);
    }

    /**
     * Setter for <code>kalaazu.quests.factions_id</code>. Faction required to unlock this quest.
     */
    public void setFactionsId(Byte value) {
        set(3, value);
    }

    // -------------------------------------------------------------------------
    // Primary key information
    // -------------------------------------------------------------------------

    /**
     * Getter for <code>kalaazu.quests.name</code>.
     */
    public String getName() {
        return (String) get(4);
    }

    // -------------------------------------------------------------------------
    // Record5 type implementation
    // -------------------------------------------------------------------------

    /**
     * Setter for <code>kalaazu.quests.name</code>.
     */
    public void setName(String value) {
        set(4, value);
    }

    @Override
    public Record1<Short> key() {
        return (Record1) super.key();
    }

    @Override
    public Row5<Short, Byte, Short, Byte, String> fieldsRow() {
        return (Row5) super.fieldsRow();
    }

    @Override
    public Row5<Short, Byte, Short, Byte, String> valuesRow() {
        return (Row5) super.valuesRow();
    }

    @Override
    public Field<Short> field1() {
        return Quests.QUESTS.ID;
    }

    @Override
    public Field<Byte> field2() {
        return Quests.QUESTS.LEVELS_ID;
    }

    @Override
    public Field<Short> field3() {
        return Quests.QUESTS.QUESTS_ID;
    }

    @Override
    public Field<Byte> field4() {
        return Quests.QUESTS.FACTIONS_ID;
    }

    @Override
    public Field<String> field5() {
        return Quests.QUESTS.NAME;
    }

    @Override
    public Short component1() {
        return getId();
    }

    @Override
    public Byte component2() {
        return getLevelsId();
    }

    @Override
    public Short component3() {
        return getQuestsId();
    }

    @Override
    public Byte component4() {
        return getFactionsId();
    }

    @Override
    public String component5() {
        return getName();
    }

    @Override
    public Short value1() {
        return getId();
    }

    @Override
    public Byte value2() {
        return getLevelsId();
    }

    @Override
    public Short value3() {
        return getQuestsId();
    }

    @Override
    public Byte value4() {
        return getFactionsId();
    }

    @Override
    public String value5() {
        return getName();
    }

    @Override
    public QuestsRecord value1(Short value) {
        setId(value);
        return this;
    }

    @Override
    public QuestsRecord value2(Byte value) {
        setLevelsId(value);
        return this;
    }

    @Override
    public QuestsRecord value3(Short value) {
        setQuestsId(value);
        return this;
    }

    @Override
    public QuestsRecord value4(Byte value) {
        setFactionsId(value);
        return this;
    }

    // -------------------------------------------------------------------------
    // Constructors
    // -------------------------------------------------------------------------

    @Override
    public QuestsRecord value5(String value) {
        setName(value);
        return this;
    }

    @Override
    public QuestsRecord values(Short value1, Byte value2, Short value3, Byte value4, String value5) {
        value1(value1);
        value2(value2);
        value3(value3);
        value4(value4);
        value5(value5);
        return this;
    }
}
