package com.manulaiko.kalaazu.persistence.database.mappers;

import com.manulaiko.kalaazu.math.Vector2;
import com.speedment.runtime.config.Column;
import com.speedment.runtime.typemapper.TypeMapper;

import java.lang.reflect.Type;

/**
 * Vector2 type.
 * =============
 *
 * Maps a MySQL geometry point to a Vector2 object.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Vector2Mapper implements TypeMapper<Long, Vector2> {
    /**
     * Returns the label for this mapper that should appear to the end user.
     *
     * @return the label
     */
    @Override
    public String getLabel() {
        return "Long to Vector2";
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
        return Vector2.class;
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
    public Vector2 toJavaType(Column column, Class<?> entityType, Long value) {
        if (value == null) {
            return null;
        }

        return new Vector2(value);
    }

    /**
     * Converts a value from the java domain to the database domain.
     *
     * @param value the value to convert
     *
     * @return the converted value
     */
    @Override
    public Long toDatabaseType(Vector2 value) {
        if (value == null) {
            return null;
        }

        return value.toLong();
    }
}
