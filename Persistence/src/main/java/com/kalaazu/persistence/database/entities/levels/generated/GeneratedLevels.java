package com.kalaazu.persistence.database.entities.levels.generated;

import com.kalaazu.persistence.database.entities.Levels;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.ColumnIdentifier;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.field.*;
import com.speedment.runtime.typemapper.TypeMapper;

/**
 * The generated base for the {@link
 * Levels}-interface
 * representing entities of the {@code levels}-table in the database.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedLevels {

    /**
     * This Field corresponds to the {@link Levels} field that can be obtained
     * using the {@link Levels#getId()} method.
     */
    ByteField<Levels, Byte> ID = ByteField.create(
            Identifier.ID,
            Levels::getId,
            Levels::setId,
            TypeMapper.primitive(),
            true
    );

    /**
     * This Field corresponds to the {@link Levels} field that can be obtained
     * using the {@link Levels#getAccount()} method.
     */
    LongField<Levels, Long> ACCOUNT = LongField.create(
            Identifier.ACCOUNT,
            Levels::getAccount,
            Levels::setAccount,
            TypeMapper.primitive(),
            true
    );

    /**
     * This Field corresponds to the {@link Levels} field that can be obtained
     * using the {@link Levels#getDrone()} method.
     */
    ShortField<Levels, Short> DRONE = ShortField.create(
            Identifier.DRONE,
            Levels::getDrone,
            Levels::setDrone,
            TypeMapper.primitive(),
            false
    );

    /**
     * This Field corresponds to the {@link Levels} field that can be obtained
     * using the {@link Levels#getPet()} method.
     */
    IntField<Levels, Integer> PET = IntField.create(
            Identifier.PET,
            Levels::getPet,
            Levels::setPet,
            TypeMapper.primitive(),
            false
    );

    /**
     * This Field corresponds to the {@link Levels} field that can be obtained
     * using the {@link Levels#getDamage()} method.
     */
    DoubleField<Levels, Double> DAMAGE = DoubleField.create(
            Identifier.DAMAGE,
            Levels::getDamage,
            Levels::setDamage,
            TypeMapper.primitive(),
            false
    );

    /**
     * This Field corresponds to the {@link Levels} field that can be obtained
     * using the {@link Levels#getShield()} method.
     */
    DoubleField<Levels, Double> SHIELD = DoubleField.create(
            Identifier.SHIELD,
            Levels::getShield,
            Levels::setShield,
            TypeMapper.primitive(),
            false
    );

    /**
     * Returns the id of this Levels. The id field corresponds to the database
     * column kalaazu.kalaazu.levels.id.
     *
     * @return the id of this Levels
     */
    Byte getId();

    /**
     * Returns the account of this Levels. The account field corresponds to the
     * database column kalaazu.kalaazu.levels.account.
     *
     * @return the account of this Levels
     */
    long getAccount();

    /**
     * Returns the drone of this Levels. The drone field corresponds to the
     * database column kalaazu.kalaazu.levels.drone.
     *
     * @return the drone of this Levels
     */
    short getDrone();

    /**
     * Returns the pet of this Levels. The pet field corresponds to the database
     * column kalaazu.kalaazu.levels.pet.
     *
     * @return the pet of this Levels
     */
    int getPet();

    /**
     * Returns the damage of this Levels. The damage field corresponds to the
     * database column kalaazu.kalaazu.levels.damage.
     *
     * @return the damage of this Levels
     */
    double getDamage();

    /**
     * Returns the shield of this Levels. The shield field corresponds to the
     * database column kalaazu.kalaazu.levels.shield.
     *
     * @return the shield of this Levels
     */
    double getShield();

    /**
     * Sets the id of this Levels. The id field corresponds to the database
     * column kalaazu.kalaazu.levels.id.
     *
     * @param id to set of this Levels
     *
     * @return this Levels instance
     */
    Levels setId(byte id);

    /**
     * Sets the account of this Levels. The account field corresponds to the
     * database column kalaazu.kalaazu.levels.account.
     *
     * @param account to set of this Levels
     *
     * @return this Levels instance
     */
    Levels setAccount(long account);

    /**
     * Sets the drone of this Levels. The drone field corresponds to the
     * database column kalaazu.kalaazu.levels.drone.
     *
     * @param drone to set of this Levels
     *
     * @return this Levels instance
     */
    Levels setDrone(short drone);

    /**
     * Sets the pet of this Levels. The pet field corresponds to the database
     * column kalaazu.kalaazu.levels.pet.
     *
     * @param pet to set of this Levels
     *
     * @return this Levels instance
     */
    Levels setPet(int pet);

    /**
     * Sets the damage of this Levels. The damage field corresponds to the
     * database column kalaazu.kalaazu.levels.damage.
     *
     * @param damage to set of this Levels
     *
     * @return this Levels instance
     */
    Levels setDamage(double damage);

    /**
     * Sets the shield of this Levels. The shield field corresponds to the
     * database column kalaazu.kalaazu.levels.shield.
     *
     * @param shield to set of this Levels
     *
     * @return this Levels instance
     */
    Levels setShield(double shield);

    enum Identifier implements ColumnIdentifier<Levels> {

        ID("id"),
        ACCOUNT("account"),
        DRONE("drone"),
        PET("pet"),
        DAMAGE("damage"),
        SHIELD("shield");

        private final String columnName;

        private final TableIdentifier<Levels> tableIdentifier;

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
            return "levels";
        }

        @Override
        public String getColumnName() {
            return this.columnName;
        }

        @Override
        public TableIdentifier<Levels> asTableIdentifier() {
            return this.tableIdentifier;
        }
    }
}