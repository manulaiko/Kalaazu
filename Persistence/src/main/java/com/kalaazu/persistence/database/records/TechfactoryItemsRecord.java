/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.records;


import com.kalaazu.persistence.database.tables.TechfactoryItems;
import org.jooq.Field;
import org.jooq.Record1;
import org.jooq.Record9;
import org.jooq.Row9;
import org.jooq.impl.UpdatableRecordImpl;

import javax.annotation.processing.Generated;


/**
 * Items that can be build in the tech factory.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class TechfactoryItemsRecord extends UpdatableRecordImpl<TechfactoryItemsRecord> implements Record9<Byte, String, String, String, Short, Short, Integer, Short, Short> {

    private static final long serialVersionUID = 1948822666;

    /**
     * Create a detached TechfactoryItemsRecord
     */
    public TechfactoryItemsRecord() {
        super(TechfactoryItems.TECHFACTORY_ITEMS);
    }

    /**
     * Create a detached, initialised TechfactoryItemsRecord
     */
    public TechfactoryItemsRecord(
            Byte id, String name, String description, String effect, Short duration, Short cooldown, Integer time,
            Short freeProduction, Short instantProduction
    ) {
        super(TechfactoryItems.TECHFACTORY_ITEMS);

        set(0, id);
        set(1, name);
        set(2, description);
        set(3, effect);
        set(4, duration);
        set(5, cooldown);
        set(6, time);
        set(7, freeProduction);
        set(8, instantProduction);
    }

    /**
     * Getter for <code>kalaazu.techfactory_items.id</code>. Primary Key.
     */
    public Byte getId() {
        return (Byte) get(0);
    }

    /**
     * Setter for <code>kalaazu.techfactory_items.id</code>. Primary Key.
     */
    public void setId(Byte value) {
        set(0, value);
    }

    /**
     * Getter for <code>kalaazu.techfactory_items.name</code>. Item name.
     */
    public String getName() {
        return (String) get(1);
    }

    /**
     * Setter for <code>kalaazu.techfactory_items.name</code>. Item name.
     */
    public void setName(String value) {
        set(1, value);
    }

    /**
     * Getter for <code>kalaazu.techfactory_items.description</code>. Item description.
     */
    public String getDescription() {
        return (String) get(2);
    }

    /**
     * Setter for <code>kalaazu.techfactory_items.description</code>. Item description.
     */
    public void setDescription(String value) {
        set(2, value);
    }

    /**
     * Getter for <code>kalaazu.techfactory_items.effect</code>. Effect description.
     */
    public String getEffect() {
        return (String) get(3);
    }

    /**
     * Setter for <code>kalaazu.techfactory_items.effect</code>. Effect description.
     */
    public void setEffect(String value) {
        set(3, value);
    }

    /**
     * Getter for <code>kalaazu.techfactory_items.duration</code>. Seconds the effect is active.
     */
    public Short getDuration() {
        return (Short) get(4);
    }

    /**
     * Setter for <code>kalaazu.techfactory_items.duration</code>. Seconds the effect is active.
     */
    public void setDuration(Short value) {
        set(4, value);
    }

    /**
     * Getter for <code>kalaazu.techfactory_items.cooldown</code>. Seconds the effect takes to cooldown.
     */
    public Short getCooldown() {
        return (Short) get(5);
    }

    /**
     * Setter for <code>kalaazu.techfactory_items.cooldown</code>. Seconds the effect takes to cooldown.
     */
    public void setCooldown(Short value) {
        set(5, value);
    }

    /**
     * Getter for <code>kalaazu.techfactory_items.time</code>. Seconds it takes to produce the item.
     */
    public Integer getTime() {
        return (Integer) get(6);
    }

    /**
     * Setter for <code>kalaazu.techfactory_items.time</code>. Seconds it takes to produce the item.
     */
    public void setTime(Integer value) {
        set(6, value);
    }

    /**
     * Getter for <code>kalaazu.techfactory_items.free_production</code>. Free production costs.
     */
    public Short getFreeProduction() {
        return (Short) get(7);
    }

    /**
     * Setter for <code>kalaazu.techfactory_items.free_production</code>. Free production costs.
     */
    public void setFreeProduction(Short value) {
        set(7, value);
    }

    // -------------------------------------------------------------------------
    // Primary key information
    // -------------------------------------------------------------------------

    /**
     * Getter for <code>kalaazu.techfactory_items.instant_production</code>. Instant production costs.
     */
    public Short getInstantProduction() {
        return (Short) get(8);
    }

    // -------------------------------------------------------------------------
    // Record9 type implementation
    // -------------------------------------------------------------------------

    /**
     * Setter for <code>kalaazu.techfactory_items.instant_production</code>. Instant production costs.
     */
    public void setInstantProduction(Short value) {
        set(8, value);
    }

    @Override
    public Record1<Byte> key() {
        return (Record1) super.key();
    }

    @Override
    public Row9<Byte, String, String, String, Short, Short, Integer, Short, Short> fieldsRow() {
        return (Row9) super.fieldsRow();
    }

    @Override
    public Row9<Byte, String, String, String, Short, Short, Integer, Short, Short> valuesRow() {
        return (Row9) super.valuesRow();
    }

    @Override
    public Field<Byte> field1() {
        return TechfactoryItems.TECHFACTORY_ITEMS.ID;
    }

    @Override
    public Field<String> field2() {
        return TechfactoryItems.TECHFACTORY_ITEMS.NAME;
    }

    @Override
    public Field<String> field3() {
        return TechfactoryItems.TECHFACTORY_ITEMS.DESCRIPTION;
    }

    @Override
    public Field<String> field4() {
        return TechfactoryItems.TECHFACTORY_ITEMS.EFFECT;
    }

    @Override
    public Field<Short> field5() {
        return TechfactoryItems.TECHFACTORY_ITEMS.DURATION;
    }

    @Override
    public Field<Short> field6() {
        return TechfactoryItems.TECHFACTORY_ITEMS.COOLDOWN;
    }

    @Override
    public Field<Integer> field7() {
        return TechfactoryItems.TECHFACTORY_ITEMS.TIME;
    }

    @Override
    public Field<Short> field8() {
        return TechfactoryItems.TECHFACTORY_ITEMS.FREE_PRODUCTION;
    }

    @Override
    public Field<Short> field9() {
        return TechfactoryItems.TECHFACTORY_ITEMS.INSTANT_PRODUCTION;
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
    public String component4() {
        return getEffect();
    }

    @Override
    public Short component5() {
        return getDuration();
    }

    @Override
    public Short component6() {
        return getCooldown();
    }

    @Override
    public Integer component7() {
        return getTime();
    }

    @Override
    public Short component8() {
        return getFreeProduction();
    }

    @Override
    public Short component9() {
        return getInstantProduction();
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
    public String value4() {
        return getEffect();
    }

    @Override
    public Short value5() {
        return getDuration();
    }

    @Override
    public Short value6() {
        return getCooldown();
    }

    @Override
    public Integer value7() {
        return getTime();
    }

    @Override
    public Short value8() {
        return getFreeProduction();
    }

    @Override
    public Short value9() {
        return getInstantProduction();
    }

    @Override
    public TechfactoryItemsRecord value1(Byte value) {
        setId(value);
        return this;
    }

    @Override
    public TechfactoryItemsRecord value2(String value) {
        setName(value);
        return this;
    }

    @Override
    public TechfactoryItemsRecord value3(String value) {
        setDescription(value);
        return this;
    }

    @Override
    public TechfactoryItemsRecord value4(String value) {
        setEffect(value);
        return this;
    }

    @Override
    public TechfactoryItemsRecord value5(Short value) {
        setDuration(value);
        return this;
    }

    @Override
    public TechfactoryItemsRecord value6(Short value) {
        setCooldown(value);
        return this;
    }

    @Override
    public TechfactoryItemsRecord value7(Integer value) {
        setTime(value);
        return this;
    }

    @Override
    public TechfactoryItemsRecord value8(Short value) {
        setFreeProduction(value);
        return this;
    }

    // -------------------------------------------------------------------------
    // Constructors
    // -------------------------------------------------------------------------

    @Override
    public TechfactoryItemsRecord value9(Short value) {
        setInstantProduction(value);
        return this;
    }

    @Override
    public TechfactoryItemsRecord values(
            Byte value1, String value2, String value3, String value4, Short value5, Short value6, Integer value7,
            Short value8, Short value9
    ) {
        value1(value1);
        value2(value2);
        value3(value3);
        value4(value4);
        value5(value5);
        value6(value6);
        value7(value7);
        value8(value8);
        value9(value9);
        return this;
    }
}
