package com.manulaiko.kalaazu.persistence.database;

import com.manulaiko.kalaazu.math.Vector2;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.Serializable;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

/**
 * Vector2 type.
 * =============
 *
 * Maps a MySQL geometry point to a Vector2 object.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Vector2Type {
    public int[] sqlTypes() {
        return new int[]{
                Types.BINARY
        };
    }

    public Class returnedClass() {
        return Vector2.class;
    }

    public boolean equals(Object o, Object o1) {
        return o.equals(o1);
    }

    public int hashCode(Object o) {
        return o.hashCode();
    }

    public Object nullSafeGet(
            ResultSet rs, String[] names
    ) throws SQLException {
        var in = new ByteArrayInputStream(rs.getBytes(names[0]));
        if (in.available() == 25) {
            // The WKB format says it's 21 bytes,
            // however, when testing, it retrieved 25 bytes
            // so skip first 4 bytes which are 0.
            in.skip(4);
        }

        var order = ByteOrder.BIG_ENDIAN;
        if (in.read() == 1) {
            order = ByteOrder.LITTLE_ENDIAN;
        }

        var typeBytes = new byte[4];
        var xBytes    = new byte[8];
        var yBytes    = new byte[8];

        try {
            in.read(typeBytes);
            in.read(xBytes);
            in.read(yBytes);
        } catch (Exception e) {
            throw new RuntimeException("Can't parse point column!", e);
        }

        var type = ByteBuffer.wrap(typeBytes)
                             .order(order);

        if (type.getInt() != 1) {
            throw new RuntimeException("Not a point!");
        }

        var x = ByteBuffer.wrap(xBytes)
                          .order(order);
        var y = ByteBuffer.wrap(yBytes)
                          .order(order);

        return new Vector2((float) x.getDouble(), (float) y.getDouble());
    }

    public void nullSafeSet(
            PreparedStatement stmt, Object value, int index
    ) throws RuntimeException, SQLException {
        if (value == null) {
            stmt.setNull(index, Types.BINARY);
            return;
        }

        if (!(value instanceof Vector2)) {
            throw new UnsupportedOperationException("can't convert " + value.getClass());
        }

        var v = (Vector2) value;
        try {
            // Store it as 25 bytes because it's how my db server stored it.
            var out = new ByteArrayOutputStream(25);
            out.write(new byte[4]);

            // Store byte order the same as the system's
            if (ByteOrder.nativeOrder() == ByteOrder.BIG_ENDIAN) {
                out.write(0);
            } else {
                out.write(1);
            }

            out.write(
                    ByteBuffer.allocate(8)
                              .putDouble((double) v.x)
                              .array()
            );
            out.write(
                    ByteBuffer.allocate(8)
                              .putDouble((double) v.y)
                              .array()
            );

            stmt.setBytes(index, out.toByteArray());
        } catch (Exception e) {
            throw new RuntimeException("Couldn't write point!", e);
        }
    }

    public Object deepCopy(Object value) {
        if (value == null) {
            return null;
        }

        if (!(value instanceof Vector2)) {
            throw new UnsupportedOperationException("can't convert " + value.getClass());
        }
        return new Vector2((Vector2) value);
    }

    public boolean isMutable() {
        return true;
    }

    public Serializable disassemble(Object value) {
        if (!(value instanceof Vector2)) {
            throw new UnsupportedOperationException("can't convert " + value.getClass());
        }

        return new Vector2((Vector2) value);
    }

    public Object assemble(Serializable serializable, Object o) {
        return serializable;
    }

    public Object replace(Object o, Object o1, Object o2) {
        return o;
    }
}
