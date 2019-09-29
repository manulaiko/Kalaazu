/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.tables;


import com.kalaazu.persistence.database.Indexes;
import com.kalaazu.persistence.database.Kalaazu;
import com.kalaazu.persistence.database.Keys;
import com.kalaazu.persistence.database.records.TechfactoryDronesRecord;
import org.jooq.*;
import org.jooq.impl.DSL;
import org.jooq.impl.TableImpl;

import javax.annotation.processing.Generated;
import java.util.Arrays;
import java.util.List;


/**
 * Drones that can be build in the tech factory.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class TechfactoryDrones extends TableImpl<TechfactoryDronesRecord> {

    /**
     * The reference instance of <code>kalaazu.techfactory_drones</code>
     */
    public static final TechfactoryDrones TECHFACTORY_DRONES = new TechfactoryDrones();
    private static final long serialVersionUID = -1839221373;
    /**
     * The column <code>kalaazu.techfactory_drones.id</code>. Primary Key.
     */
    public final TableField<TechfactoryDronesRecord, Byte> ID = createField(
            DSL.name("id"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false).identity(true),
            this,
            "Primary Key."
    );
    /**
     * The column <code>kalaazu.techfactory_drones.name</code>. Drone name.
     */
    public final TableField<TechfactoryDronesRecord, String> NAME = createField(
            DSL.name("name"),
            org.jooq.impl.SQLDataType.VARCHAR(255)
                                     .nullable(false),
            this,
            "Drone name."
    );
    /**
     * The column <code>kalaazu.techfactory_drones.description</code>. Drone description.
     */
    public final TableField<TechfactoryDronesRecord, String> DESCRIPTION = createField(
            DSL.name("description"),
            org.jooq.impl.SQLDataType.CLOB.nullable(false),
            this,
            "Drone description."
    );
    /**
     * The column <code>kalaazu.techfactory_drones.time</code>. Seconds it takes to produce the drone.
     */
    public final TableField<TechfactoryDronesRecord, Byte> TIME = createField(
            DSL.name("time"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "0",
                                                     org.jooq.impl.SQLDataType.TINYINT
                                             )),
            this,
            "Seconds it takes to produce the drone."
    );
    /**
     * The column <code>kalaazu.techfactory_drones.parts</code>. Necessary parts to build the drone.
     */
    public final TableField<TechfactoryDronesRecord, Byte> PARTS = createField(
            DSL.name("parts"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "45",
                                                     org.jooq.impl.SQLDataType.TINYINT
                                             )),
            this,
            "Necessary parts to build the drone."
    );
    /**
     * The column <code>kalaazu.techfactory_drones.price</code>. Price for producing the drone.
     */
    public final TableField<TechfactoryDronesRecord, Integer> PRICE = createField(
            DSL.name("price"),
            org.jooq.impl.SQLDataType.INTEGER.nullable(false),
            this,
            "Price for producing the drone."
    );
    /**
     * The column <code>kalaazu.techfactory_drones.factor</code>. Factor the price reduces with each new part.
     */
    public final TableField<TechfactoryDronesRecord, Byte> FACTOR = createField(
            DSL.name("factor"),
            org.jooq.impl.SQLDataType.TINYINT.nullable(false)
                                             .defaultValue(org.jooq.impl.DSL.field(
                                                     "5",
                                                     org.jooq.impl.SQLDataType.TINYINT
                                             )),
            this,
            "Factor the price reduces with each new part."
    );

    /**
     * Create a <code>kalaazu.techfactory_drones</code> table reference
     */
    public TechfactoryDrones() {
        this(DSL.name("techfactory_drones"), null);
    }

    /**
     * Create an aliased <code>kalaazu.techfactory_drones</code> table reference
     */
    public TechfactoryDrones(String alias) {
        this(DSL.name(alias), TECHFACTORY_DRONES);
    }

    /**
     * Create an aliased <code>kalaazu.techfactory_drones</code> table reference
     */
    public TechfactoryDrones(Name alias) {
        this(alias, TECHFACTORY_DRONES);
    }

    private TechfactoryDrones(Name alias, Table<TechfactoryDronesRecord> aliased) {
        this(alias, aliased, null);
    }

    private TechfactoryDrones(Name alias, Table<TechfactoryDronesRecord> aliased, Field<?>[] parameters) {
        super(alias, null, aliased, parameters, DSL.comment("Drones that can be build in the tech factory."));
    }

    public <O extends Record> TechfactoryDrones(Table<O> child, ForeignKey<O, TechfactoryDronesRecord> key) {
        super(child, key, TECHFACTORY_DRONES);
    }

    /**
     * The class holding records for this type
     */
    @Override
    public Class<TechfactoryDronesRecord> getRecordType() {
        return TechfactoryDronesRecord.class;
    }

    @Override
    public Schema getSchema() {
        return Kalaazu.KALAAZU;
    }

    @Override
    public List<Index> getIndexes() {
        return Arrays.<Index>asList(
                Indexes.TECHFACTORY_DRONES_PRIMARY,
                Indexes.TECHFACTORY_DRONES_TECHFACTORY_DRONES_NAME_IDX
        );
    }

    @Override
    public Identity<TechfactoryDronesRecord, Byte> getIdentity() {
        return Keys.IDENTITY_TECHFACTORY_DRONES;
    }

    @Override
    public UniqueKey<TechfactoryDronesRecord> getPrimaryKey() {
        return Keys.KEY_TECHFACTORY_DRONES_PRIMARY;
    }

    @Override
    public List<UniqueKey<TechfactoryDronesRecord>> getKeys() {
        return Arrays.<UniqueKey<TechfactoryDronesRecord>>asList(Keys.KEY_TECHFACTORY_DRONES_PRIMARY);
    }

    @Override
    public TechfactoryDrones as(String alias) {
        return new TechfactoryDrones(DSL.name(alias), this);
    }

    @Override
    public TechfactoryDrones as(Name alias) {
        return new TechfactoryDrones(alias, this);
    }

    /**
     * Rename this table
     */
    @Override
    public TechfactoryDrones rename(String name) {
        return new TechfactoryDrones(DSL.name(name), null);
    }

    /**
     * Rename this table
     */
    @Override
    public TechfactoryDrones rename(Name name) {
        return new TechfactoryDrones(name, null);
    }

    // -------------------------------------------------------------------------
    // Row7 type methods
    // -------------------------------------------------------------------------

    @Override
    public Row7<Byte, String, String, Byte, Byte, Integer, Byte> fieldsRow() {
        return (Row7) super.fieldsRow();
    }
}
