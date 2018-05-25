package com.kalaazu.persistence.database.mappers;

import com.speedment.runtime.config.Column;
import com.speedment.runtime.typemapper.TypeMapper;

import java.lang.reflect.Type;

/**
 * Type mapper.
 * ============
 *
 * Performs the mapping.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class BankLogTypeMapper implements TypeMapper<Byte, BankLogType> {
    /**
     * Returns the label for this mapper that should appear to the end user.
     *
     * @return the label
     */
    @Override
    public String getLabel() {
        return "Integer to Bank Log type";
    }

    /**
     * Returns a type describing the resulting java type when this mapper is
     * applied to a database result.
     *
     * @param column the column that is being mapped
     *
     * @return the resulting java type
     */
    @Override
    public Type getJavaType(Column column) {
        return BankLogType.class;
    }

    /**
     * Converts a value from the database domain to the java domain.
     *
     * @param column     the column that is being mapped
     * @param entityType the entity type that the mapping is for
     * @param value      the value to convert
     *
     * @return the converted value
     */
    @Override
    public BankLogType toJavaType(Column column, Class<?> entityType, Byte value) {
        if (value == null) {
            return null;
        }

        return BankLogType.values()[value];
    }

    /**
     * Converts a value from the java domain to the database domain.
     *
     * @param value the value to convert
     *
     * @return the converted value
     */
    @Override
    public Byte toDatabaseType(BankLogType value) {
        if (value == null) {
            return null;
        }

        return (byte) value.ordinal();
    }
}
