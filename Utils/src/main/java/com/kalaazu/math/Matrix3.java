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

import java.io.Serializable;

/**
 * A 3x3 <a href="http://en.wikipedia.org/wiki/Row-major_order#Column-major_order">column major</a> matrix;
 * useful for 2D transforms.
 *
 * @author mzechner
 */
public class Matrix3 implements Serializable {
    public static final int M00 = 0;
    public static final int M01 = 3;
    public static final int M02 = 6;
    public static final int M10 = 1;
    public static final int M11 = 4;
    public static final int M12 = 7;
    public static final int M20 = 2;
    public static final int M21 = 5;
    public static final int M22 = 8;
    private static final long serialVersionUID = 7907569533774959788L;
    public float[] val = new float[9];

    private float[] tmp = new float[9];

    public Matrix3() {
        idt();
    }

    public Matrix3(Matrix3 matrix) {
        set(matrix);
    }

    /**
     * Constructs a matrix from the given float array. The array must have at least 9 elements; the first 9 will be copied.
     *
     * @param values The float array to copy. Remember that this matrix is in <a
     *               href="http://en.wikipedia.org/wiki/Row-major_order#Column-major_order">column major</a> order. (The float array is
     *               not modified.)
     */
    public Matrix3(float[] values) {
        this.set(values);
    }

    /**
     * Multiplies matrix a with matrix b in the following manner:
     *
     * <pre>
     * mul(A, B) => A := AB
     * </pre>
     *
     * @param mata The float array representing the first matrix. Must have at least 9 elements.
     * @param matb The float array representing the second matrix. Must have at least 9 elements.
     */
    private static void mul(float[] mata, float[] matb) {
        float v00 = mata[M00] * matb[M00] + mata[M01] * matb[M10] + mata[M02] * matb[M20];
        float v01 = mata[M00] * matb[M01] + mata[M01] * matb[M11] + mata[M02] * matb[M21];
        float v02 = mata[M00] * matb[M02] + mata[M01] * matb[M12] + mata[M02] * matb[M22];

        float v10 = mata[M10] * matb[M00] + mata[M11] * matb[M10] + mata[M12] * matb[M20];
        float v11 = mata[M10] * matb[M01] + mata[M11] * matb[M11] + mata[M12] * matb[M21];
        float v12 = mata[M10] * matb[M02] + mata[M11] * matb[M12] + mata[M12] * matb[M22];

        float v20 = mata[M20] * matb[M00] + mata[M21] * matb[M10] + mata[M22] * matb[M20];
        float v21 = mata[M20] * matb[M01] + mata[M21] * matb[M11] + mata[M22] * matb[M21];
        float v22 = mata[M20] * matb[M02] + mata[M21] * matb[M12] + mata[M22] * matb[M22];

        mata[M00] = v00;
        mata[M10] = v10;
        mata[M20] = v20;
        mata[M01] = v01;
        mata[M11] = v11;
        mata[M21] = v21;
        mata[M02] = v02;
        mata[M12] = v12;
        mata[M22] = v22;
    }

    /**
     * Sets this matrix to the identity matrix
     *
     * @return This matrix for the purpose of chaining operations.
     */
    public Matrix3 idt() {
        float[] val = this.val;
        val[M00] = 1;
        val[M10] = 0;
        val[M20] = 0;
        val[M01] = 0;
        val[M11] = 1;
        val[M21] = 0;
        val[M02] = 0;
        val[M12] = 0;
        val[M22] = 1;

        return this;
    }

    /**
     * Post-multiplies this matrix with the provided matrix and stores the result in this matrix. For example:
     *
     * <pre>
     * A.mul(B) results in A := AB
     * </pre>
     *
     * @param m Matrix to multiply by.
     * @return This matrix for the purpose of chaining operations together.
     */
    public Matrix3 mul(Matrix3 m) {
        float[] val = this.val;

        float v00 = val[M00] * m.val[M00] + val[M01] * m.val[M10] + val[M02] * m.val[M20];
        float v01 = val[M00] * m.val[M01] + val[M01] * m.val[M11] + val[M02] * m.val[M21];
        float v02 = val[M00] * m.val[M02] + val[M01] * m.val[M12] + val[M02] * m.val[M22];

        float v10 = val[M10] * m.val[M00] + val[M11] * m.val[M10] + val[M12] * m.val[M20];
        float v11 = val[M10] * m.val[M01] + val[M11] * m.val[M11] + val[M12] * m.val[M21];
        float v12 = val[M10] * m.val[M02] + val[M11] * m.val[M12] + val[M12] * m.val[M22];

        float v20 = val[M20] * m.val[M00] + val[M21] * m.val[M10] + val[M22] * m.val[M20];
        float v21 = val[M20] * m.val[M01] + val[M21] * m.val[M11] + val[M22] * m.val[M21];
        float v22 = val[M20] * m.val[M02] + val[M21] * m.val[M12] + val[M22] * m.val[M22];

        val[M00] = v00;
        val[M10] = v10;
        val[M20] = v20;
        val[M01] = v01;
        val[M11] = v11;
        val[M21] = v21;
        val[M02] = v02;
        val[M12] = v12;
        val[M22] = v22;

        return this;
    }

    /**
     * Pre-multiplies this matrix with the provided matrix and stores the result in this matrix. For example:
     *
     * <pre>
     * A.mulLeft(B) results in A := BA
     * </pre>
     *
     * @param m The other Matrix to multiply by
     * @return This matrix for the purpose of chaining operations.
     */
    public Matrix3 mulLeft(Matrix3 m) {
        float[] val = this.val;

        float v00 = m.val[M00] * val[M00] + m.val[M01] * val[M10] + m.val[M02] * val[M20];
        float v01 = m.val[M00] * val[M01] + m.val[M01] * val[M11] + m.val[M02] * val[M21];
        float v02 = m.val[M00] * val[M02] + m.val[M01] * val[M12] + m.val[M02] * val[M22];

        float v10 = m.val[M10] * val[M00] + m.val[M11] * val[M10] + m.val[M12] * val[M20];
        float v11 = m.val[M10] * val[M01] + m.val[M11] * val[M11] + m.val[M12] * val[M21];
        float v12 = m.val[M10] * val[M02] + m.val[M11] * val[M12] + m.val[M12] * val[M22];

        float v20 = m.val[M20] * val[M00] + m.val[M21] * val[M10] + m.val[M22] * val[M20];
        float v21 = m.val[M20] * val[M01] + m.val[M21] * val[M11] + m.val[M22] * val[M21];
        float v22 = m.val[M20] * val[M02] + m.val[M21] * val[M12] + m.val[M22] * val[M22];

        val[M00] = v00;
        val[M10] = v10;
        val[M20] = v20;
        val[M01] = v01;
        val[M11] = v11;
        val[M21] = v21;
        val[M02] = v02;
        val[M12] = v12;
        val[M22] = v22;

        return this;
    }

    /**
     * Sets this matrix to a rotation matrix that will rotate any vector in counter-clockwise direction around the z-axis.
     *
     * @param degrees the angle in degrees.
     * @return This matrix for the purpose of chaining operations.
     */
    public Matrix3 setToRotation(float degrees) {
        return setToRotationRad(MathUtils.degreesToRadians * degrees);
    }

    /**
     * Sets this matrix to a rotation matrix that will rotate any vector in counter-clockwise direction around the z-axis.
     *
     * @param radians the angle in radians.
     * @return This matrix for the purpose of chaining operations.
     */
    public Matrix3 setToRotationRad(float radians) {
        float cos = (float) Math.cos(radians);
        float sin = (float) Math.sin(radians);
        float[] val = this.val;

        val[M00] = cos;
        val[M10] = sin;
        val[M20] = 0;

        val[M01] = -sin;
        val[M11] = cos;
        val[M21] = 0;

        val[M02] = 0;
        val[M12] = 0;
        val[M22] = 1;

        return this;
    }

    /**
     * Sets this matrix to a translation matrix.
     *
     * @param x the translation in x
     * @param y the translation in y
     * @return This matrix for the purpose of chaining operations.
     */
    public Matrix3 setToTranslation(float x, float y) {
        float[] val = this.val;

        val[M00] = 1;
        val[M10] = 0;
        val[M20] = 0;

        val[M01] = 0;
        val[M11] = 1;
        val[M21] = 0;

        val[M02] = x;
        val[M12] = y;
        val[M22] = 1;

        return this;
    }

    /**
     * Sets this matrix to a translation matrix.
     *
     * @param translation The translation vector.
     * @return This matrix for the purpose of chaining operations.
     */
    public Matrix3 setToTranslation(Vector translation) {
        float[] val = this.val;

        val[M00] = 1;
        val[M10] = 0;
        val[M20] = 0;

        val[M01] = 0;
        val[M11] = 1;
        val[M21] = 0;

        val[M02] = translation.getX();
        val[M12] = translation.getY();
        val[M22] = 1;

        return this;
    }

    /**
     * Sets this matrix to a scaling matrix.
     *
     * @param scaleX the scale in x
     * @param scaleY the scale in y
     * @return This matrix for the purpose of chaining operations.
     */
    public Matrix3 setToScaling(float scaleX, float scaleY) {
        float[] val = this.val;
        val[M00] = scaleX;
        val[M10] = 0;
        val[M20] = 0;
        val[M01] = 0;
        val[M11] = scaleY;
        val[M21] = 0;
        val[M02] = 0;
        val[M12] = 0;
        val[M22] = 1;
        return this;
    }

    /**
     * Sets this matrix to a scaling matrix.
     *
     * @param scale The scale vector.
     * @return This matrix for the purpose of chaining operations.
     */
    public Matrix3 setToScaling(Vector scale) {
        float[] val = this.val;
        val[M00] = scale.getX();
        val[M10] = 0;
        val[M20] = 0;
        val[M01] = 0;
        val[M11] = scale.getY();
        val[M21] = 0;
        val[M02] = 0;
        val[M12] = 0;
        val[M22] = 1;

        return this;
    }

    public String toString() {
        float[] val = this.val;
        return "[" + val[M00] + "|" + val[M01] + "|" + val[M02] + "]\n" //
                + "[" + val[M10] + "|" + val[M11] + "|" + val[M12] + "]\n" //
                + "[" + val[M20] + "|" + val[M21] + "|" + val[M22] + "]";
    }

    /**
     * @return The determinant of this matrix
     */
    public float det() {
        float[] val = this.val;
        return val[M00] * val[M11] * val[M22] + val[M01] * val[M12] * val[M20] + val[M02] * val[M10] * val[M21] - val[M00] * val[M12] * val[M21] - val[M01] * val[M10] * val[M22] - val[M02] * val[M11] * val[M20];
    }

    /**
     * Inverts this matrix given that the determinant is != 0.
     *
     * @return This matrix for the purpose of chaining operations.
     * @throws RuntimeException if the matrix is singular (not invertible)
     */
    public Matrix3 inv() {
        float det = det();
        if (det == 0) {
            throw new RuntimeException("Can't invert a singular matrix");
        }

        float inv_det = 1.0f / det;
        float[] tmp = this.tmp, val = this.val;

        tmp[M00] = val[M11] * val[M22] - val[M21] * val[M12];
        tmp[M10] = val[M20] * val[M12] - val[M10] * val[M22];
        tmp[M20] = val[M10] * val[M21] - val[M20] * val[M11];
        tmp[M01] = val[M21] * val[M02] - val[M01] * val[M22];
        tmp[M11] = val[M00] * val[M22] - val[M20] * val[M02];
        tmp[M21] = val[M20] * val[M01] - val[M00] * val[M21];
        tmp[M02] = val[M01] * val[M12] - val[M11] * val[M02];
        tmp[M12] = val[M10] * val[M02] - val[M00] * val[M12];
        tmp[M22] = val[M00] * val[M11] - val[M10] * val[M01];

        val[M00] = inv_det * tmp[M00];
        val[M10] = inv_det * tmp[M10];
        val[M20] = inv_det * tmp[M20];
        val[M01] = inv_det * tmp[M01];
        val[M11] = inv_det * tmp[M11];
        val[M21] = inv_det * tmp[M21];
        val[M02] = inv_det * tmp[M02];
        val[M12] = inv_det * tmp[M12];
        val[M22] = inv_det * tmp[M22];

        return this;
    }

    /**
     * Copies the values from the provided matrix to this matrix.
     *
     * @param mat The matrix to copy.
     * @return This matrix for the purposes of chaining.
     */
    public Matrix3 set(Matrix3 mat) {
        System.arraycopy(mat.val, 0, val, 0, val.length);
        return this;
    }

    /**
     * Copies the values from the provided affine matrix to this matrix. The last row is set to (0, 0, 1).
     *
     * @param affine The affine matrix to copy.
     * @return This matrix for the purposes of chaining.
     */
    public Matrix3 set(Affine2 affine) {
        float[] val = this.val;

        val[M00] = affine.m00;
        val[M10] = affine.m10;
        val[M20] = 0;
        val[M01] = affine.m01;
        val[M11] = affine.m11;
        val[M21] = 0;
        val[M02] = affine.m02;
        val[M12] = affine.m12;
        val[M22] = 1;

        return this;
    }

    /**
     * Sets the matrix to the given matrix as a float array. The float array must have at least 9 elements; the first 9 will be
     * copied.
     *
     * @param values The matrix, in float form, that is to be copied. Remember that this matrix is in <a
     *               href="http://en.wikipedia.org/wiki/Row-major_order#Column-major_order">column major</a> order.
     * @return This matrix for the purpose of chaining methods together.
     */
    public Matrix3 set(float[] values) {
        System.arraycopy(values, 0, val, 0, val.length);
        return this;
    }

    /**
     * Adds a translational component to the matrix in the 3rd column. The other columns are untouched.
     *
     * @param vector The translation vector.
     * @return This matrix for the purpose of chaining.
     */
    public Matrix3 trn(Vector vector) {
        val[M02] += vector.getX();
        val[M12] += vector.getY();
        return this;
    }

    /**
     * Adds a translational component to the matrix in the 3rd column. The other columns are untouched.
     *
     * @param x The x-component of the translation vector.
     * @param y The y-component of the translation vector.
     * @return This matrix for the purpose of chaining.
     */
    public Matrix3 trn(float x, float y) {
        val[M02] += x;
        val[M12] += y;
        return this;
    }

    /**
     * Post-multiplies this matrix by a translation matrix. Post-multiplication is also used by OpenGL ES' 1.x
     * glTranslate/glRotate/glScale.
     *
     * @param x The x-component of the translation vector.
     * @param y The y-component of the translation vector.
     * @return This matrix for the purpose of chaining.
     */
    public Matrix3 translate(float x, float y) {
        float[] val = this.val;
        tmp[M00] = 1;
        tmp[M10] = 0;
        tmp[M20] = 0;

        tmp[M01] = 0;
        tmp[M11] = 1;
        tmp[M21] = 0;

        tmp[M02] = x;
        tmp[M12] = y;
        tmp[M22] = 1;
        mul(val, tmp);
        return this;
    }

    /**
     * Post-multiplies this matrix by a translation matrix. Post-multiplication is also used by OpenGL ES' 1.x
     * glTranslate/glRotate/glScale.
     *
     * @param translation The translation vector.
     * @return This matrix for the purpose of chaining.
     */
    public Matrix3 translate(Vector translation) {
        float[] val = this.val;
        tmp[M00] = 1;
        tmp[M10] = 0;
        tmp[M20] = 0;

        tmp[M01] = 0;
        tmp[M11] = 1;
        tmp[M21] = 0;

        tmp[M02] = translation.getX();
        tmp[M12] = translation.getY();
        tmp[M22] = 1;
        mul(val, tmp);
        return this;
    }

    /**
     * Post-multiplies this matrix with a (counter-clockwise) rotation matrix. Post-multiplication is also used by OpenGL ES' 1.x
     * glTranslate/glRotate/glScale.
     *
     * @param degrees The angle in degrees
     * @return This matrix for the purpose of chaining.
     */
    public Matrix3 rotate(float degrees) {
        return rotateRad(MathUtils.degreesToRadians * degrees);
    }

    /**
     * Post-multiplies this matrix with a (counter-clockwise) rotation matrix. Post-multiplication is also used by OpenGL ES' 1.x
     * glTranslate/glRotate/glScale.
     *
     * @param radians The angle in radians
     * @return This matrix for the purpose of chaining.
     */
    public Matrix3 rotateRad(float radians) {
        if (radians == 0) {
            return this;
        }
        float cos = (float) Math.cos(radians);
        float sin = (float) Math.sin(radians);
        float[] tmp = this.tmp;

        tmp[M00] = cos;
        tmp[M10] = sin;
        tmp[M20] = 0;

        tmp[M01] = -sin;
        tmp[M11] = cos;
        tmp[M21] = 0;

        tmp[M02] = 0;
        tmp[M12] = 0;
        tmp[M22] = 1;
        mul(val, tmp);
        return this;
    }

    /**
     * Post-multiplies this matrix with a scale matrix. Post-multiplication is also used by OpenGL ES' 1.x
     * glTranslate/glRotate/glScale.
     *
     * @param scaleX The scale in the x-axis.
     * @param scaleY The scale in the y-axis.
     * @return This matrix for the purpose of chaining.
     */
    public Matrix3 scale(float scaleX, float scaleY) {
        float[] tmp = this.tmp;
        tmp[M00] = scaleX;
        tmp[M10] = 0;
        tmp[M20] = 0;
        tmp[M01] = 0;
        tmp[M11] = scaleY;
        tmp[M21] = 0;
        tmp[M02] = 0;
        tmp[M12] = 0;
        tmp[M22] = 1;
        mul(val, tmp);
        return this;
    }

    /**
     * Post-multiplies this matrix with a scale matrix. Post-multiplication is also used by OpenGL ES' 1.x
     * glTranslate/glRotate/glScale.
     *
     * @param scale The vector to scale the matrix by.
     * @return This matrix for the purpose of chaining.
     */
    public Matrix3 scale(Vector scale) {
        float[] tmp = this.tmp;
        tmp[M00] = scale.getX();
        tmp[M10] = 0;
        tmp[M20] = 0;
        tmp[M01] = 0;
        tmp[M11] = scale.getY();
        tmp[M21] = 0;
        tmp[M02] = 0;
        tmp[M12] = 0;
        tmp[M22] = 1;
        mul(val, tmp);
        return this;
    }

    /**
     * Get the values in this matrix.
     *
     * @return The float values that make up this matrix in column-major order.
     */
    public float[] getValues() {
        return val;
    }

    public Vector getTranslation(Vector position) {
        position.setX((int) val[M02]);
        position.setY((int) val[M12]);
        return position;
    }

    public Vector getScale(Vector scale) {
        float[] val = this.val;
        scale.setX((int) Math.sqrt(val[M00] * val[M00] + val[M01] * val[M01]));
        scale.setY((int) Math.sqrt(val[M10] * val[M10] + val[M11] * val[M11]));
        return scale;
    }

    public float getRotation() {
        return MathUtils.radiansToDegrees * (float) Math.atan2(val[M10], val[M00]);
    }

    public float getRotationRad() {
        return (float) Math.atan2(val[M10], val[M00]);
    }

    /**
     * Scale the matrix in the both the x and y components by the scalar value.
     *
     * @param scale The single value that will be used to scale both the x and y components.
     * @return This matrix for the purpose of chaining methods together.
     */
    public Matrix3 scl(float scale) {
        val[M00] *= scale;
        val[M11] *= scale;
        return this;
    }

    /**
     * Scale this matrix using the x and y components of the vector but leave the rest of the matrix alone.
     *
     * @param scale The {@link Vector} to use to scale this matrix.
     * @return This matrix for the purpose of chaining methods together.
     */
    public Matrix3 scl(Vector scale) {
        val[M00] *= scale.getX();
        val[M11] *= scale.getY();

        return this;
    }

    /**
     * Transposes the current matrix.
     *
     * @return This matrix for the purpose of chaining methods together.
     */
    public Matrix3 transpose() {
        // Where MXY you do not have to change MXX
        float[] val = this.val;
        float v01 = val[M10];
        float v02 = val[M20];
        float v10 = val[M01];
        float v12 = val[M21];
        float v20 = val[M02];
        float v21 = val[M12];
        val[M01] = v01;
        val[M02] = v02;
        val[M10] = v10;
        val[M12] = v12;
        val[M20] = v20;
        val[M21] = v21;
        return this;
    }
}
