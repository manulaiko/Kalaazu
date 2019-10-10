package com.kalaazu.persistence.database.converters;

import com.kalaazu.math.Vector2;
import org.jooq.Converter;

/**
 * Vector2 converter.
 * ==================
 *
 * Converts 64bit integer into Vector2.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Vector2Converter implements Converter<Long, Vector2> {
    /**
     * @inheritDoc
     */
    @Override
    public Vector2 from(Long databaseObject) {
        return new Vector2(databaseObject);
    }

    /**
     * @inheritDoc
     */
    @Override
    public Long to(Vector2 userObject) {
        return userObject.toLong();
    }

    /**
     * @inheritDoc
     */
    @Override
    public Class<Long> fromType() {
        return Long.class;
    }

    /**
     * @inheritDoc
     */
    @Override
    public Class<Vector2> toType() {
        return Vector2.class;
    }
}
