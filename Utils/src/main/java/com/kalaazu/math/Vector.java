/*******************************************************************************
 * Copyright 2011 See AUTHORS file.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/

package com.kalaazu.math;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.io.Serializable;
import java.util.random.RandomGenerator;

/**
 * Encapsulates a 2D vector. Allows chaining methods by returning a reference to itself
 *
 * @author badlogicgames@gmail.com
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Vector implements Serializable {
    public static final Vector ZERO = new Vector(0, 0);
    public static final Vector MARGIN = new Vector(1000, 1000);

    @Serial
    private static final long serialVersionUID = 913902788239530931L;

    /**
     * the x-component of this vector
     */
    private int x;
    /**
     * the y-component of this vector
     */
    private int y;

    /**
     * Constructs a vector from its string representation.
     *
     * @param s String representation.
     */
    public Vector(String s) {
        String[] coordinates = s.split(",");

        this.x = Integer.parseInt(coordinates[0]);
        this.y = Integer.parseInt(coordinates[1]);
    }

    /**
     * Constructs a vector from a packed long.
     *
     * @param l Packed long.
     */
    public Vector(Long l) {
        this.x = (int) (l >> 32);
        this.y = l.intValue();
    }

    /**
     * Generates a random vector.
     *
     * @param limit Generated vector won't be outside this limit.
     * @return Random vector between (0,0) and limit.
     */
    public static Vector random(Vector limit) {
        return random(ZERO, limit);
    }

    /**
     * Generates a random vector.
     *
     * @param limit Generated vector won't be outside this limit.
     * @return Random vector between (0,0) and limit.
     */
    public static Vector random(Vector from, Vector limit) {
        var r = RandomGenerator.getDefault();

        var x = r.nextInt(from.getX(), limit.getX());
        var y = r.nextInt(from.getY(), limit.getY());

        return new Vector(x, y);
    }

    public static Vector sub(Vector from, Vector to) {
        return from.sub(to);
    }

    public static float len(float x, float y) {
        return (float) Math.sqrt(x * x + y * y);
    }

    public static float len2(float x, float y) {
        return x * x + y * y;
    }

    public static float dot(float x1, float y1, float x2, float y2) {
        return x1 * x2 + y1 * y2;
    }

    public static float dst(float x1, float y1, float x2, float y2) {
        final float x_d = x2 - x1;
        final float y_d = y2 - y1;

        return (float) Math.sqrt(x_d * x_d + y_d * y_d);
    }

    public static float dst2(float x1, float y1, float x2, float y2) {
        final float x_d = x2 - x1;
        final float y_d = y2 - y1;

        return x_d * x_d + y_d * y_d;
    }

    public static Vector randomRadius(Vector center, int radius, Vector limit) {
        var dest = Vector.random(limit);
        var t = dest.angle();

        var x = radius * Math.cos(t) + center.getX();
        var y = radius * Math.sin(t) + center.getY();

        if (x > limit.getX()) {
            x = center.getX() - x * 2;
        }
        if (y > limit.getY()) {
            y = center.getY() - y * 2;
        }

        return new Vector((int) x, (int) y);
    }

    /**
     * Packs the vector in a long.
     *
     * @return Vector as long.
     */
    public long toLong() {
        return ((long) this.x << 32) | ((int) this.y & 0xffffffffL);
    }

    public Vector cpy() {
        return new Vector(this.x, this.y);
    }

    public int len() {
        return (int) Math.sqrt(x * x + y * y);
    }

    public float len2() {
        return x * x + y * y;
    }

    public Vector set(Vector v) {
        x = v.x;
        y = v.y;

        return this;
    }

    public Vector sub(Vector v) {
        return new Vector(this.x - v.x, this.y - v.y);
    }

    /**
     * Substracts the other vector from this vector.
     *
     * @param x The x-component of the other vector
     * @param y The y-component of the other vector
     * @return This vector for chaining
     */
    public Vector sub(int x, int y) {
        return new Vector(this.x - x, this.y - y);
    }

    public Vector nor() {
        var len = len();
        var x = this.x;
        var y = this.y;

        if (len != 0) {
            x /= len;
            y /= len;
        }

        return new Vector(x, y);
    }

    public Vector add(Vector v) {
        return new Vector(this.x + v.x, this.y + v.y);
    }

    /**
     * Adds the given components to this vector
     *
     * @param x The x-component
     * @param y The y-component
     * @return This vector for chaining
     */
    public Vector add(int x, int y) {
        return new Vector(this.x + x, this.y + y);
    }

    public float dot(Vector v) {
        return x * v.x + y * v.y;
    }

    public float dot(float ox, float oy) {
        return x * ox + y * oy;
    }

    public Vector scl(int scalar) {
        return new Vector(this.x * scalar, this.y * scalar);
    }

    /**
     * Multiplies this vector by a scalar
     *
     * @return This vector for chaining
     */
    public Vector scl(float x, float y) {
        return new Vector((int) (this.x * x), (int) (this.y * y));
    }

    public Vector scl(Vector v) {
        return new Vector(this.x * v.x, this.y * v.y);
    }

    public Vector mulAdd(Vector vec, float scalar) {
        return this.add(vec.scl((int) scalar));
    }

    public Vector mulAdd(Vector vec, Vector mulVec) {
        var x = vec.x * mulVec.x;
        var y = vec.y * mulVec.y;

        return this.add(x, y);
    }

    public float dst(Vector v) {
        final float x_d = v.x - x;
        final float y_d = v.y - y;

        return (float) Math.sqrt(x_d * x_d + y_d * y_d);
    }

    /**
     * @param x The x-component of the other vector
     * @param y The y-component of the other vector
     * @return the distance between this and the other vector
     */
    public float dst(float x, float y) {
        final float x_d = x - this.x;
        final float y_d = y - this.y;

        return (float) Math.sqrt(x_d * x_d + y_d * y_d);
    }

    public float dst2(Vector v) {
        final float x_d = v.x - x;
        final float y_d = v.y - y;

        return x_d * x_d + y_d * y_d;
    }

    /**
     * @param x The x-component of the other vector
     * @param y The y-component of the other vector
     * @return the squared distance between this and the other vector
     */
    public float dst2(float x, float y) {
        final float x_d = x - this.x;
        final float y_d = y - this.y;

        return x_d * x_d + y_d * y_d;
    }

    public Vector limit(float limit) {
        return limit2(limit * limit);
    }

    public Vector limit2(float limit2) {
        var len2 = len2();
        if (len2 > limit2) {
            return scl((int) Math.sqrt(limit2 / len2));
        }

        return this;
    }

    public Vector clamp(float min, float max) {
        final float len2 = len2();
        if (len2 == 0f) {
            return this;
        }

        float max2 = max * max;
        if (len2 > max2) {
            return scl((int) Math.sqrt(max2 / len2));
        }

        float min2 = min * min;
        if (len2 < min2) {
            return scl((int) Math.sqrt(min2 / len2));
        }

        return this;
    }

    public Vector setLength(float len) {
        return setLength2(len * len);
    }

    public Vector setLength2(float len2) {
        float oldLen2 = len2();
        if (oldLen2 == 0 || oldLen2 == len2) {
            return this;
        }

        return scl((int) Math.sqrt(len2 / oldLen2));
    }

    /**
     * Converts this {@code Vector2} to a string in the format {@code (x,y)}.
     *
     * @return a string representation of this object.
     */
    public String toString() {
        return x + "," + y;
    }

    /**
     * Sets this {@code Vector2} to the value represented by the specified string according to the format of {@link #toString()}.
     *
     * @param v the string.
     * @return this vector for chaining
     */
    public Vector fromString(String v) {
        int s = v.indexOf(',', 1);
        if (s != -1 && v.charAt(0) == '(' && v.charAt(v.length() - 1) == ')') {
            try {
                var x = Integer.parseInt(v.substring(1, s));
                var y = Integer.parseInt(v.substring(s + 1, v.length() - 1));

                return new Vector(x, y);
            } catch (NumberFormatException ex) {
                // Throw a GdxRuntimeException
            }
        }

        throw new RuntimeException("Malformed Vector2: " + v);
    }

    /**
     * Left-multiplies this vector by the given matrix
     *
     * @param mat the matrix
     * @return this vector
     */
    public Vector mul(Matrix3 mat) {
        var x = (int) (this.x * mat.val[0] + this.y * mat.val[3] + mat.val[6]);
        var y = (int) (this.x * mat.val[1] + this.y * mat.val[4] + mat.val[7]);

        return new Vector(x, y);
    }

    /**
     * Calculates the 2D cross product between this and the given vector.
     *
     * @param v the other vector
     * @return the cross product
     */
    public float crs(Vector v) {
        return this.x * v.y - this.y * v.x;
    }

    /**
     * Calculates the 2D cross product between this and the given vector.
     *
     * @param x the x-coordinate of the other vector
     * @param y the y-coordinate of the other vector
     * @return the cross product
     */
    public float crs(float x, float y) {
        return this.x * y - this.y * x;
    }

    /**
     * @return the angle in degrees of this vector (point) relative to the x-axis. Angles are towards the positive y-axis
     * (typically counter-clockwise) and between 0 and 360.
     */
    public float angle() {
        float angle = (float) Math.atan2(y, x) * MathUtils.radiansToDegrees;
        if (angle < 0) {
            angle += 360;
        }

        return angle;
    }

    /**
     * @return the angle in degrees of this vector (point) relative to the given vector. Angles are towards the positive y-axis
     * (typically counter-clockwise.) between -180 and +180
     */
    public float angle(Vector reference) {
        return (float) Math.atan2(crs(reference), dot(reference)) * MathUtils.radiansToDegrees;
    }

    /**
     * @return the angle in radians of this vector (point) relative to the x-axis. Angles are towards the positive y-axis.
     * (typically counter-clockwise)
     */
    public float angleRad() {
        return (float) Math.atan2(y, x);
    }

    /**
     * @return the angle in radians of this vector (point) relative to the given vector. Angles are towards the positive y-axis.
     * (typically counter-clockwise.)
     */
    public float angleRad(Vector reference) {
        return (float) Math.atan2(crs(reference), dot(reference));
    }

    /**
     * Sets the angle of the vector in degrees relative to the x-axis, towards the positive y-axis (typically counter-clockwise).
     *
     * @param degrees The angle in degrees to set.
     */
    public Vector setAngle(float degrees) {
        return setAngleRad(degrees * MathUtils.degreesToRadians);
    }

    /**
     * Sets the angle of the vector in radians relative to the x-axis, towards the positive y-axis (typically counter-clockwise).
     *
     * @param radians The angle in radians to set.
     */
    public Vector setAngleRad(float radians) {
        return new Vector(len(), 0).rotateRad(radians);
    }

    /**
     * Rotates the Vector2 by the given angle, counter-clockwise assuming the y-axis points up.
     *
     * @param degrees the angle in degrees
     */
    public Vector rotate(float degrees) {
        return rotateRad(degrees * MathUtils.degreesToRadians);
    }

    /**
     * Rotates the Vector2 by the given angle around reference vector, counter-clockwise assuming the y-axis points up.
     *
     * @param degrees   the angle in degrees
     * @param reference center Vector2
     */
    public Vector rotateAround(Vector reference, float degrees) {
        return this.sub(reference)
                .rotate(degrees)
                .add(reference);
    }

    /**
     * Rotates the Vector2 by the given angle, counter-clockwise assuming the y-axis points up.
     *
     * @param radians the angle in radians
     */
    public Vector rotateRad(float radians) {
        var cos = (int) Math.cos(radians);
        var sin = (int) Math.sin(radians);

        var x = this.x * cos - this.y * sin;
        var y = this.x * sin + this.y * cos;

        return new Vector(x, y);
    }

    /**
     * Rotates the Vector2 by the given angle around reference vector, counter-clockwise assuming the y-axis points up.
     *
     * @param radians   the angle in radians
     * @param reference center Vector2
     */
    public Vector rotateAroundRad(Vector reference, float radians) {
        return this.sub(reference)
                .rotateRad(radians)
                .add(reference);
    }

    /**
     * Rotates the Vector2 by 90 degrees in the specified direction, where >= 0 is counter-clockwise and < 0 is clockwise.
     */
    @SuppressWarnings("SuspiciousNameCombination")
    public Vector rotate90(int dir) {
        var x = this.x;
        var y = this.y;

        if (dir >= 0) {
            x = -y;
            y = this.x;
        } else {
            x = y;
            y = -this.x;
        }

        return new Vector(x, y);
    }

    public Vector lerp(Vector target, float alpha) {
        var invAlpha = 1.0 - alpha;

        var x = (int) ((this.x * invAlpha) + (target.x * alpha));
        var y = (int) ((this.y * invAlpha) + (target.y * alpha));

        return new Vector(x, y);
    }

    public Vector interpolate(Vector target, float alpha, Interpolation interpolation) {
        return lerp(target, interpolation.apply(alpha));
    }

    public Vector setToRandomDirection() {
        float theta = MathUtils.random(0f, MathUtils.PI2);

        return new Vector((int) MathUtils.cos(theta), (int) MathUtils.sin(theta));
    }

    public boolean epsilonEquals(Vector other, float epsilon) {
        if (other == null) {
            return false;
        }
        if (Math.abs(other.x - x) > epsilon) {
            return false;
        }
        return !(Math.abs(other.y - y) > epsilon);
    }

    /**
     * Compares this vector with the other vector, using the supplied epsilon for fuzzy equality testing.
     *
     * @return whether the vectors are the same.
     */
    public boolean epsilonEquals(float x, float y, float epsilon) {
        if (Math.abs(x - this.x) > epsilon) {
            return false;
        }
        return !(Math.abs(y - this.y) > epsilon);
    }

    /**
     * Compares this vector with the other vector using MathUtils.FLOAT_ROUNDING_ERROR for fuzzy equality testing
     *
     * @param other other vector to compare
     * @return true if vector are equal, otherwise false
     */
    public boolean epsilonEquals(final Vector other) {
        return epsilonEquals(other, MathUtils.FLOAT_ROUNDING_ERROR);
    }

    /**
     * Compares this vector with the other vector using MathUtils.FLOAT_ROUNDING_ERROR for fuzzy equality testing
     *
     * @param x x component of the other vector to compare
     * @param y y component of the other vector to compare
     * @return true if vector are equal, otherwise false
     */
    public boolean epsilonEquals(float x, float y) {
        return epsilonEquals(x, y, MathUtils.FLOAT_ROUNDING_ERROR);
    }

    public boolean isUnit() {
        return isUnit(0.000000001f);
    }

    public boolean isUnit(final float margin) {
        return Math.abs(len2() - 1f) < margin;
    }

    public boolean isZero() {
        return x == 0 && y == 0;
    }

    public boolean isZero(final float margin) {
        return len2() < margin;
    }

    public boolean isOnLine(Vector other) {
        return MathUtils.isZero(x * other.y - y * other.x);
    }

    public boolean isOnLine(Vector other, float epsilon) {
        return MathUtils.isZero(x * other.y - y * other.x, epsilon);
    }

    public boolean isCollinear(Vector other, float epsilon) {
        return isOnLine(other, epsilon) && dot(other) > 0f;
    }

    public boolean isCollinear(Vector other) {
        return isOnLine(other) && dot(other) > 0f;
    }

    public boolean isCollinearOpposite(Vector other, float epsilon) {
        return isOnLine(other, epsilon) && dot(other) < 0f;
    }

    public boolean isCollinearOpposite(Vector other) {
        return isOnLine(other) && dot(other) < 0f;
    }

    public boolean isPerpendicular(Vector vector) {
        return MathUtils.isZero(dot(vector));
    }

    public boolean isPerpendicular(Vector vector, float epsilon) {
        return MathUtils.isZero(dot(vector), epsilon);
    }

    public boolean hasSameDirection(Vector vector) {
        return dot(vector) > 0;
    }

    public boolean hasOppositeDirection(Vector vector) {
        return dot(vector) < 0;
    }

    public Vector div(int v) {
        if (v == 0) {
            return this;
        }

        var x = this.x / v;
        var y = this.y / v;

        return new Vector(x, y);
    }

    public Vector margin() {
        return this.sub(MARGIN);
    }
}
