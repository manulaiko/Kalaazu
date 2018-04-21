package com.manulaiko.kalaazu.persistence.database;

import com.manulaiko.kalaazu.math.Vector2;
import io.requery.Converter;

/**
 * Vector2 type.
 * =============
 *
 * Maps a MySQL geometry point to a Vector2 object.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Vector2Type implements Converter<Vector2, String> {
    @Override
    public Class<Vector2> getMappedType() {
        return Vector2.class;
    }

    @Override
    public Class<String> getPersistedType() {
        return String.class;
    }

    @Override
    public Integer getPersistedSize() {
        return null;
    }

    @Override
    public String convertToPersisted(Vector2 vector2) {
        if (vector2 == null) {
            return null;
        }

        return vector2.toString();
    }

    @Override
    public Vector2 convertToMapped(Class<? extends Vector2> aClass, String s) {
        if (s == null) {
            return null;
        }

        return new Vector2(s);
    }
}
