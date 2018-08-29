package com.kalaazu.persistence.database.entities.vouchers.generated;

import com.kalaazu.persistence.database.entities.Vouchers;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.ColumnIdentifier;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.field.ByteField;
import com.speedment.runtime.field.ShortField;
import com.speedment.runtime.field.StringField;
import com.speedment.runtime.typemapper.TypeMapper;

/**
 * The generated base for the {@link
 * Vouchers}-interface
 * representing entities of the {@code vouchers}-table in the database.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedVouchers {

    /**
     * This Field corresponds to the {@link Vouchers} field that can be obtained
     * using the {@link Vouchers#id()} method.
     */
    ShortField<Vouchers, Short> ID = ShortField.create(
            Identifier.ID,
            Vouchers::id,
            Vouchers::id,
            TypeMapper.primitive(),
            true
    );

    /**
     * This Field corresponds to the {@link Vouchers} field that can be obtained
     * using the {@link Vouchers#code()} method.
     */
    StringField<Vouchers, String> CODE = StringField.create(
            Identifier.CODE,
            Vouchers::code,
            Vouchers::code,
            TypeMapper.identity(),
            true
    );

    /**
     * This Field corresponds to the {@link Vouchers} field that can be obtained
     * using the {@link Vouchers#limit()} method.
     */
    ByteField<Vouchers, Byte> LIMIT = ByteField.create(
            Identifier.LIMIT,
            Vouchers::limit,
            Vouchers::limit,
            TypeMapper.primitive(),
            false
    );

    /**
     * Returns the id of this Vouchers. The id field corresponds to the database
     * column kalaazu.kalaazu.vouchers.id.
     *
     * @return the id of this Vouchers
     */
    Short id();

    /**
     * Returns the code of this Vouchers. The code field corresponds to the
     * database column kalaazu.kalaazu.vouchers.code.
     *
     * @return the code of this Vouchers
     */
    String code();

    /**
     * Returns the limit of this Vouchers. The limit field corresponds to the
     * database column kalaazu.kalaazu.vouchers.limit.
     *
     * @return the limit of this Vouchers
     */
    byte limit();

    /**
     * Sets the id of this Vouchers. The id field corresponds to the database
     * column kalaazu.kalaazu.vouchers.id.
     *
     * @param id to set of this Vouchers
     *
     * @return this Vouchers instance
     */
    Vouchers id(Short id);

    /**
     * Sets the code of this Vouchers. The code field corresponds to the
     * database column kalaazu.kalaazu.vouchers.code.
     *
     * @param code to set of this Vouchers
     *
     * @return this Vouchers instance
     */
    Vouchers code(String code);

    /**
     * Sets the limit of this Vouchers. The limit field corresponds to the
     * database column kalaazu.kalaazu.vouchers.limit.
     *
     * @param limit to set of this Vouchers
     *
     * @return this Vouchers instance
     */
    Vouchers limit(byte limit);

    enum Identifier implements ColumnIdentifier<Vouchers> {

        ID("id"),
        CODE("code"),
        LIMIT("limit");

        private final String columnName;

        private final TableIdentifier<Vouchers> tableIdentifier;

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
            return "vouchers";
        }

        @Override
        public String getColumnName() {
            return this.columnName;
        }

        @Override
        public TableIdentifier<Vouchers> asTableIdentifier() {
            return this.tableIdentifier;
        }
    }
}