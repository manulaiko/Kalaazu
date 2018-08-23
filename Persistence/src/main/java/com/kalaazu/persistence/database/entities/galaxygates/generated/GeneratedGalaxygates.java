package com.kalaazu.persistence.database.entities.galaxygates.generated;

import com.kalaazu.persistence.database.entities.Galaxygates;
import com.kalaazu.persistence.database.entities.GalaxygatesWaves;
import com.kalaazu.persistence.database.entities.Manager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.ColumnIdentifier;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.util.OptionalUtil;
import com.speedment.runtime.field.ByteField;
import com.speedment.runtime.field.ComparableForeignKeyField;
import com.speedment.runtime.field.StringField;
import com.speedment.runtime.typemapper.TypeMapper;

import java.util.Optional;

/**
 * The generated base for the {@link
 * Galaxygates}-interface
 * representing entities of the {@code galaxygates}-table in the database.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedGalaxygates {

    /**
     * This Field corresponds to the {@link Galaxygates} field that can be
     * obtained using the {@link Galaxygates#id()} method.
     */
    ByteField<Galaxygates, Byte> ID = ByteField.create(
            Identifier.ID,
            Galaxygates::id,
            Galaxygates::id,
            TypeMapper.primitive(),
            true
    );

    /**
     * This Field corresponds to the {@link Galaxygates} field that can be
     * obtained using the {@link Galaxygates#name()} method.
     */
    StringField<Galaxygates, String> NAME = StringField.create(
            Identifier.NAME,
            Galaxygates::name,
            Galaxygates::name,
            TypeMapper.identity(),
            false
    );

    /**
     * This Field corresponds to the {@link Galaxygates} field that can be
     * obtained using the {@link Galaxygates#galaxygatesWavesId()} method.
     */
    ComparableForeignKeyField<Galaxygates, Byte, Byte, GalaxygatesWaves> GALAXYGATES_WAVES_ID = ComparableForeignKeyField.create(
            Identifier.GALAXYGATES_WAVES_ID,
            o -> OptionalUtil.unwrap(o.galaxygatesWavesId()),
            Galaxygates::galaxygatesWavesId,
            GalaxygatesWaves.ID,
            TypeMapper.identity(),
            false
    );

    /**
     * This Field corresponds to the {@link Galaxygates} field that can be
     * obtained using the {@link Galaxygates#parts()} method.
     */
    ByteField<Galaxygates, Byte> PARTS = ByteField.create(
            Identifier.PARTS,
            Galaxygates::parts,
            Galaxygates::parts,
            TypeMapper.primitive(),
            false
    );

    /**
     * Returns the id of this Galaxygates. The id field corresponds to the
     * database column kalaazu.kalaazu.galaxygates.id.
     *
     * @return the id of this Galaxygates
     */
    Byte id();

    /**
     * Returns the name of this Galaxygates. The name field corresponds to the
     * database column kalaazu.kalaazu.galaxygates.name.
     *
     * @return the name of this Galaxygates
     */
    String name();

    /**
     * Returns the galaxygatesWavesId of this Galaxygates. The
     * galaxygatesWavesId field corresponds to the database column
     * kalaazu.kalaazu.galaxygates.galaxygates_waves_id.
     *
     * @return the galaxygatesWavesId of this Galaxygates
     */
    Optional<Byte> galaxygatesWavesId();

    /**
     * Returns the parts of this Galaxygates. The parts field corresponds to the
     * database column kalaazu.kalaazu.galaxygates.parts.
     *
     * @return the parts of this Galaxygates
     */
    byte parts();

    /**
     * Sets the id of this Galaxygates. The id field corresponds to the database
     * column kalaazu.kalaazu.galaxygates.id.
     *
     * @param id to set of this Galaxygates
     *
     * @return this Galaxygates instance
     */
    Galaxygates id(Byte id);

    /**
     * Sets the name of this Galaxygates. The name field corresponds to the
     * database column kalaazu.kalaazu.galaxygates.name.
     *
     * @param name to set of this Galaxygates
     *
     * @return this Galaxygates instance
     */
    Galaxygates name(String name);

    /**
     * Sets the galaxygatesWavesId of this Galaxygates. The galaxygatesWavesId
     * field corresponds to the database column
     * kalaazu.kalaazu.galaxygates.galaxygates_waves_id.
     *
     * @param galaxygatesWavesId to set of this Galaxygates
     *
     * @return this Galaxygates instance
     */
    Galaxygates galaxygatesWavesId(Byte galaxygatesWavesId);

    /**
     * Sets the parts of this Galaxygates. The parts field corresponds to the
     * database column kalaazu.kalaazu.galaxygates.parts.
     *
     * @param parts to set of this Galaxygates
     *
     * @return this Galaxygates instance
     */
    Galaxygates parts(byte parts);

    /**
     * Queries the specified manager for the referenced GalaxygatesWaves. If no
     * such GalaxygatesWaves exists, an {@code NullPointerException} will be
     * thrown.
     *
     * @param foreignManager the manager to query for the entity
     *
     * @return the foreign entity referenced
     */
    Optional<GalaxygatesWaves> findGalaxygatesWavesId(Manager<GalaxygatesWaves> foreignManager);

    enum Identifier implements ColumnIdentifier<Galaxygates> {

        ID("id"),
        NAME("name"),
        GALAXYGATES_WAVES_ID("galaxygates_waves_id"),
        PARTS("parts");

        private final String columnName;

        private final TableIdentifier<Galaxygates> tableIdentifier;

        Identifier(String columnName) {
            this.columnName = columnName;
            this.tableIdentifier = TableIdentifier.of(
                    getDbmsName(),
                    getSchemaName(),
                    getTableName()
            );
        }

        @Override
        public String getDbmsName() {
            return "kalaazu";
        }

        @Override
        public String getSchemaName() {
            return "kalaazu";
        }

        @Override
        public String getTableName() {
            return "galaxygates";
        }

        @Override
        public String getColumnName() {
            return this.columnName;
        }

        @Override
        public TableIdentifier<Galaxygates> asTableIdentifier() {
            return this.tableIdentifier;
        }
    }
}