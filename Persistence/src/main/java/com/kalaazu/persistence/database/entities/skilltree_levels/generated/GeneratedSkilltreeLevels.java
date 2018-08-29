package com.kalaazu.persistence.database.entities.skilltree_levels.generated;

import com.kalaazu.persistence.database.entities.Levels;
import com.kalaazu.persistence.database.entities.Manager;
import com.kalaazu.persistence.database.entities.SkilltreeLevels;
import com.kalaazu.persistence.database.entities.SkilltreeSkills;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.ColumnIdentifier;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.field.ByteField;
import com.speedment.runtime.field.ByteForeignKeyField;
import com.speedment.runtime.field.IntField;
import com.speedment.runtime.field.ShortField;
import com.speedment.runtime.typemapper.TypeMapper;

/**
 * The generated base for the {@link
 * SkilltreeLevels}-interface
 * representing entities of the {@code skilltree_levels}-table in the database.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedSkilltreeLevels {

    /**
     * This Field corresponds to the {@link SkilltreeLevels} field that can be
     * obtained using the {@link SkilltreeLevels#id()} method.
     */
    ShortField<SkilltreeLevels, Short> ID = ShortField.create(
            Identifier.ID,
            SkilltreeLevels::id,
            SkilltreeLevels::id,
            TypeMapper.primitive(),
            true
    );

    /**
     * This Field corresponds to the {@link SkilltreeLevels} field that can be
     * obtained using the {@link SkilltreeLevels#skilltreeSkillsId()} method.
     */
    ByteForeignKeyField<SkilltreeLevels, Byte, SkilltreeSkills> SKILLTREE_SKILLS_ID = ByteForeignKeyField.create(
            Identifier.SKILLTREE_SKILLS_ID,
            SkilltreeLevels::skilltreeSkillsId,
            SkilltreeLevels::skilltreeSkillsId,
            SkilltreeSkills.ID,
            TypeMapper.primitive(),
            false
    );

    /**
     * This Field corresponds to the {@link SkilltreeLevels} field that can be
     * obtained using the {@link SkilltreeLevels#levelsId()} method.
     */
    ByteForeignKeyField<SkilltreeLevels, Byte, Levels> LEVELS_ID = ByteForeignKeyField.create(
            Identifier.LEVELS_ID,
            SkilltreeLevels::levelsId,
            SkilltreeLevels::levelsId,
            Levels.ID,
            TypeMapper.primitive(),
            false
    );

    /**
     * This Field corresponds to the {@link SkilltreeLevels} field that can be
     * obtained using the {@link SkilltreeLevels#credits()} method.
     */
    IntField<SkilltreeLevels, Integer> CREDITS = IntField.create(
            Identifier.CREDITS,
            SkilltreeLevels::credits,
            SkilltreeLevels::credits,
            TypeMapper.primitive(),
            false
    );

    /**
     * This Field corresponds to the {@link SkilltreeLevels} field that can be
     * obtained using the {@link SkilltreeLevels#seprom()} method.
     */
    ShortField<SkilltreeLevels, Short> SEPROM = ShortField.create(
            Identifier.SEPROM,
            SkilltreeLevels::seprom,
            SkilltreeLevels::seprom,
            TypeMapper.primitive(),
            false
    );

    /**
     * This Field corresponds to the {@link SkilltreeLevels} field that can be
     * obtained using the {@link SkilltreeLevels#points()} method.
     */
    ByteField<SkilltreeLevels, Byte> POINTS = ByteField.create(
            Identifier.POINTS,
            SkilltreeLevels::points,
            SkilltreeLevels::points,
            TypeMapper.primitive(),
            false
    );

    /**
     * Returns the id of this SkilltreeLevels. The id field corresponds to the
     * database column kalaazu.kalaazu.skilltree_levels.id.
     *
     * @return the id of this SkilltreeLevels
     */
    Short id();

    /**
     * Returns the skilltreeSkillsId of this SkilltreeLevels. The
     * skilltreeSkillsId field corresponds to the database column
     * kalaazu.kalaazu.skilltree_levels.skilltree_skills_id.
     *
     * @return the skilltreeSkillsId of this SkilltreeLevels
     */
    byte skilltreeSkillsId();

    /**
     * Returns the levelsId of this SkilltreeLevels. The levelsId field
     * corresponds to the database column
     * kalaazu.kalaazu.skilltree_levels.levels_id.
     *
     * @return the levelsId of this SkilltreeLevels
     */
    byte levelsId();

    /**
     * Returns the credits of this SkilltreeLevels. The credits field
     * corresponds to the database column
     * kalaazu.kalaazu.skilltree_levels.credits.
     *
     * @return the credits of this SkilltreeLevels
     */
    int credits();

    /**
     * Returns the seprom of this SkilltreeLevels. The seprom field corresponds
     * to the database column kalaazu.kalaazu.skilltree_levels.seprom.
     *
     * @return the seprom of this SkilltreeLevels
     */
    short seprom();

    /**
     * Returns the points of this SkilltreeLevels. The points field corresponds
     * to the database column kalaazu.kalaazu.skilltree_levels.points.
     *
     * @return the points of this SkilltreeLevels
     */
    byte points();

    /**
     * Sets the id of this SkilltreeLevels. The id field corresponds to the
     * database column kalaazu.kalaazu.skilltree_levels.id.
     *
     * @param id to set of this SkilltreeLevels
     *
     * @return this SkilltreeLevels instance
     */
    SkilltreeLevels id(Short id);

    /**
     * Sets the skilltreeSkillsId of this SkilltreeLevels. The skilltreeSkillsId
     * field corresponds to the database column
     * kalaazu.kalaazu.skilltree_levels.skilltree_skills_id.
     *
     * @param skilltreeSkillsId to set of this SkilltreeLevels
     *
     * @return this SkilltreeLevels instance
     */
    SkilltreeLevels skilltreeSkillsId(byte skilltreeSkillsId);

    /**
     * Sets the levelsId of this SkilltreeLevels. The levelsId field corresponds
     * to the database column kalaazu.kalaazu.skilltree_levels.levels_id.
     *
     * @param levelsId to set of this SkilltreeLevels
     *
     * @return this SkilltreeLevels instance
     */
    SkilltreeLevels levelsId(byte levelsId);

    /**
     * Sets the credits of this SkilltreeLevels. The credits field corresponds
     * to the database column kalaazu.kalaazu.skilltree_levels.credits.
     *
     * @param credits to set of this SkilltreeLevels
     *
     * @return this SkilltreeLevels instance
     */
    SkilltreeLevels credits(int credits);

    /**
     * Sets the seprom of this SkilltreeLevels. The seprom field corresponds to
     * the database column kalaazu.kalaazu.skilltree_levels.seprom.
     *
     * @param seprom to set of this SkilltreeLevels
     *
     * @return this SkilltreeLevels instance
     */
    SkilltreeLevels seprom(short seprom);

    /**
     * Sets the points of this SkilltreeLevels. The points field corresponds to
     * the database column kalaazu.kalaazu.skilltree_levels.points.
     *
     * @param points to set of this SkilltreeLevels
     *
     * @return this SkilltreeLevels instance
     */
    SkilltreeLevels points(byte points);

    /**
     * Queries the specified manager for the referenced SkilltreeSkills. If no
     * such SkilltreeSkills exists, an {@code NullPointerException} will be
     * thrown.
     *
     * @param foreignManager the manager to query for the entity
     *
     * @return the foreign entity referenced
     */
    SkilltreeSkills findSkilltreeSkillsId(Manager<SkilltreeSkills> foreignManager);

    /**
     * Queries the specified manager for the referenced Levels. If no such
     * Levels exists, an {@code NullPointerException} will be thrown.
     *
     * @param foreignManager the manager to query for the entity
     *
     * @return the foreign entity referenced
     */
    Levels findLevelsId(Manager<Levels> foreignManager);

    enum Identifier implements ColumnIdentifier<SkilltreeLevels> {

        ID("id"),
        SKILLTREE_SKILLS_ID("skilltree_skills_id"),
        LEVELS_ID("levels_id"),
        CREDITS("credits"),
        SEPROM("seprom"),
        POINTS("points");

        private final String columnName;

        private final TableIdentifier<SkilltreeLevels> tableIdentifier;

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
            return "skilltree_levels";
        }

        @Override
        public String getColumnName() {
            return this.columnName;
        }

        @Override
        public TableIdentifier<SkilltreeLevels> asTableIdentifier() {
            return this.tableIdentifier;
        }
    }
}