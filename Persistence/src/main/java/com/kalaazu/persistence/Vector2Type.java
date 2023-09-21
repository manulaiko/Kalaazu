package com.kalaazu.persistence;

import com.kalaazu.math.Vector;
import lombok.Getter;
import org.hibernate.Cache;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.usertype.UserType;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

/**
 * Vector2 Long type.
 * ==================
 * <p>
 * Type definition to load long types as Vector2 instances.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
public class Vector2Type implements UserType<Vector> {
    @Getter
    private final int sqlType = Types.BIGINT;

    /**
     * Read an instance of the Java class mapped by this custom type
     * from the given JDBC {@link ResultSet}. Implementors must handle
     * null column values.
     *
     * @param rs
     * @param position
     * @param session
     * @param owner
     */
    @Override
    public Vector nullSafeGet(ResultSet rs, int position, SharedSessionContractImplementor session, Object owner) throws SQLException {
        var l = rs.getLong(position);
        if (rs.wasNull()) {
            return null;
        }

        return new Vector(l);
    }

    /**
     * Write an instance of the Java class mapped by this custom type
     * to the given JDBC {@link PreparedStatement}. Implementors must
     * handle null values of the Java class. A multi-column type should
     * be written to parameters starting from {@code index}.
     *
     * @param st
     * @param value
     * @param index
     * @param session
     */
    @Override
    public void nullSafeSet(PreparedStatement st, Vector value, int index, SharedSessionContractImplementor session) throws SQLException {
        if (value == null) {
            st.setNull(index, Types.BIGINT);
        } else {
            st.setLong(index, value.toLong());
        }
    }

    /**
     * Return a clone of the given instance of the Java class mapped
     * by this custom type.
     * <ul>
     * <li>It's not necessary to clone immutable objects. If the Java
     *     class mapped by this custom type is an immutable class,
     *     this method may safely just return its argument.
     * <li>For mutable objects, it's necessary to deep copy persistent
     *     state, stopping at associations to other entities, and at
     *     persistent collections.
     * <li>If the argument is a reference to an entity, just return
     *     the argument.
     * <li>Finally, if the argument is null, just return null.
     * </ul>
     *
     * @param value the object to be cloned, which may be null
     * @return a clone
     */
    @Override
    public Vector deepCopy(Vector value) {
        return new Vector(value.getX(), value.getY());
    }

    /**
     * Are instances of the Java class mapped by this custom type
     * mutable or immutable?
     *
     * @return {@code true} if instances are mutable
     */
    @Override
    public boolean isMutable() {
        return true;
    }

    /**
     * Transform the given value into a destructured representation,
     * suitable for storage in the {@linkplain Cache
     * second-level cache}. This method is called only during the
     * process of writing the properties of an entity to the
     * second-level cache.
     * <p>
     * If the value is mutable then, at the very least, this method
     * should perform a deep copy. That may not be enough for some
     * types, however. For example, associations must be cached as
     * identifier values.
     * <p>
     * This is an optional operation, but, if left unimplemented,
     * this type will not be cacheable in the second-level cache.
     *
     * @param value the object to be cached
     * @return a cacheable representation of the object
     * @see Cache
     */
    @Override
    public Serializable disassemble(Vector value) {
        return value.toString();
    }

    /**
     * Reconstruct a value from its destructured representation,
     * during the process of reading the properties of an entity
     * from the {@linkplain Cache second-level cache}.
     * <p>
     * If the value is mutable then, at the very least, this method
     * should perform a deep copy. That may not be enough for some
     * types, however. For example, associations must be cached as
     * identifier values.
     * <p>
     * This is an optional operation, but, if left unimplemented,
     * this type will not be cacheable in the second-level cache.
     *
     * @param cached the object to be cached
     * @param owner  the owner of the cached object
     * @return a reconstructed object from the cacheable representation
     * @see Cache
     */
    @Override
    public Vector assemble(Serializable cached, Object owner) {
        return new Vector(cached.toString());
    }

    @Override
    public Class<Vector> returnedClass() {
        return Vector.class;
    }

    @Override
    public boolean equals(Vector x, Vector y) {
        return x.equals(y);
    }

    @Override
    public int hashCode(Vector x) {
        return x.hashCode();
    }
}
