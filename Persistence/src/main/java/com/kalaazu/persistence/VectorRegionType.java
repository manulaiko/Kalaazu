package com.kalaazu.persistence;

import com.kalaazu.math.VectorRegion;
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
 * Vector Region Long type.
 * ========================
 * <p>
 * Type definition to load long types as Vector2 instances.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Getter
public class VectorRegionType implements UserType<VectorRegion> {
    private final int sqlType = Types.VARCHAR;
    private final boolean mutable = false;

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
    public VectorRegion nullSafeGet(ResultSet rs, int position, SharedSessionContractImplementor session, Object owner) throws SQLException {
        var str = rs.getString(position);
        if (rs.wasNull()) {
            return null;
        }

        return new VectorRegion(str);
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
    public void nullSafeSet(PreparedStatement st, VectorRegion value, int index, SharedSessionContractImplementor session) throws SQLException {
        if (value == null) {
            st.setNull(index, Types.VARCHAR);
        } else {
            st.setString(index, value.toString());
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
    public VectorRegion deepCopy(VectorRegion value) {
        return new VectorRegion(value.getTopLeft(), value.getBottomRight());
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
    public Serializable disassemble(VectorRegion value) {
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
    public VectorRegion assemble(Serializable cached, Object owner) {
        return new VectorRegion(cached.toString());
    }

    @Override
    public Class<VectorRegion> returnedClass() {
        return VectorRegion.class;
    }

    @Override
    public boolean equals(VectorRegion x, VectorRegion y) {
        return x.equals(y);
    }

    @Override
    public int hashCode(VectorRegion x) {
        return x.hashCode();
    }
}
