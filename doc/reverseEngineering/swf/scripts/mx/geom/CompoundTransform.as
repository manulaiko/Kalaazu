package mx.geom {

import flash.geom.Matrix;
import flash.geom.Matrix3D;
import flash.geom.Vector3D;

import mx.core.AdvancedLayoutFeatures;
import mx.utils.MatrixUtil;

public class CompoundTransform {

    private static const MATRIX_VALID: uint = 32;

    private static const MATRIX3D_VALID: uint = 64;

    private static const PROPERTIES_VALID: uint = 128;

    private static const IS_3D: uint = 512;

    private static const M3D_FLAGS_VALID: uint = 1024;

    public static const SOURCE_PROPERTIES: uint = 1;

    public static const SOURCE_MATRIX: uint = 2;

    public static const SOURCE_MATRIX3D: uint = 3;

    private static const INVALIDATE_FROM_NONE: uint = 0;

    private static const INVALIDATE_FROM_PROPERTY: uint = 4;

    private static const INVALIDATE_FROM_MATRIX: uint = 5;

    private static const INVALIDATE_FROM_MATRIX3D: uint = 6;

    private static var decomposition: Vector.<Number> = new Vector.<Number>();

    private static const RADIANS_PER_DEGREES: Number = 0;

    private static const EPSILON: Number = 0.001;

    {
        decomposition.push(0);
        decomposition.push(0);
        decomposition.push(0);
        decomposition.push(0);
        decomposition.push(0);
    }

    private var _rotationX: Number = 0;

    private var _rotationY: Number = 0;

    private var _rotationZ: Number = 0;

    private var _scaleX: Number = 1;

    private var _scaleY: Number = 1;

    private var _scaleZ: Number = 1;

    private var _x: Number = 0;

    private var _y: Number = 0;

    private var _z: Number = 0;

    private var _transformX: Number = 0;

    private var _transformY: Number = 0;

    private var _transformZ: Number = 0;

    private var _matrix: Matrix;

    private var _matrix3D: Matrix3D;

    public var sourceOfTruth: uint = 1;

    private var _flags: uint = 128;

    public function CompoundTransform() {
        super();
    }

    public function set x(param1: Number): void {
        if ((this._flags & PROPERTIES_VALID) == false) {
            this.validatePropertiesFromMatrix();
        }
        if (param1 == this._x) {
            return;
        }
        this.translateBy(param1 - this._x, 0, 0);
        this.invalidate(INVALIDATE_FROM_PROPERTY, false);
    }

    public function get x(): Number {
        if ((this._flags & PROPERTIES_VALID) == false) {
            this.validatePropertiesFromMatrix();
        }
        return this._x;
    }

    public function set y(param1: Number): void {
        if ((this._flags & PROPERTIES_VALID) == false) {
            this.validatePropertiesFromMatrix();
        }
        if (param1 == this._y) {
            return;
        }
        this.translateBy(0, param1 - this._y, 0);
        this.invalidate(INVALIDATE_FROM_PROPERTY, false);
    }

    public function get y(): Number {
        if ((this._flags & PROPERTIES_VALID) == false) {
            this.validatePropertiesFromMatrix();
        }
        return this._y;
    }

    public function set z(param1: Number): void {
        if ((this._flags & PROPERTIES_VALID) == false) {
            this.validatePropertiesFromMatrix();
        }
        if (param1 == this._z) {
            return;
        }
        this.translateBy(0, 0, param1 - this._z);
        this.invalidate(INVALIDATE_FROM_PROPERTY, true);
    }

    public function get z(): Number {
        if ((this._flags & PROPERTIES_VALID) == false) {
            this.validatePropertiesFromMatrix();
        }
        return this._z;
    }

    public function set rotationX(param1: Number): void {
        param1 = MatrixUtil.clampRotation(param1);
        if ((this._flags & PROPERTIES_VALID) == false) {
            this.validatePropertiesFromMatrix();
        }
        if (param1 == this._rotationX) {
            return;
        }
        this._rotationX = param1;
        this.invalidate(INVALIDATE_FROM_PROPERTY, true);
    }

    public function get rotationX(): Number {
        if ((this._flags & PROPERTIES_VALID) == false) {
            this.validatePropertiesFromMatrix();
        }
        return this._rotationX;
    }

    public function set rotationY(param1: Number): void {
        param1 = MatrixUtil.clampRotation(param1);
        if ((this._flags & PROPERTIES_VALID) == false) {
            this.validatePropertiesFromMatrix();
        }
        if (param1 == this._rotationY) {
            return;
        }
        this._rotationY = param1;
        this.invalidate(INVALIDATE_FROM_PROPERTY, true);
    }

    public function get rotationY(): Number {
        if ((this._flags & PROPERTIES_VALID) == false) {
            this.validatePropertiesFromMatrix();
        }
        return this._rotationY;
    }

    public function set rotationZ(param1: Number): void {
        param1 = MatrixUtil.clampRotation(param1);
        if ((this._flags & PROPERTIES_VALID) == false) {
            this.validatePropertiesFromMatrix();
        }
        if (param1 == this._rotationZ) {
            return;
        }
        this._rotationZ = param1;
        this.invalidate(INVALIDATE_FROM_PROPERTY, false);
    }

    public function get rotationZ(): Number {
        if ((this._flags & PROPERTIES_VALID) == false) {
            this.validatePropertiesFromMatrix();
        }
        return this._rotationZ;
    }

    public function set scaleX(param1: Number): void {
        if ((this._flags & PROPERTIES_VALID) == false) {
            this.validatePropertiesFromMatrix();
        }
        if (param1 == this._scaleX) {
            return;
        }
        this._scaleX = param1;
        this.invalidate(INVALIDATE_FROM_PROPERTY, false);
    }

    public function get scaleX(): Number {
        if ((this._flags & PROPERTIES_VALID) == false) {
            this.validatePropertiesFromMatrix();
        }
        return this._scaleX;
    }

    public function set scaleY(param1: Number): void {
        if ((this._flags & PROPERTIES_VALID) == false) {
            this.validatePropertiesFromMatrix();
        }
        if (param1 == this._scaleY) {
            return;
        }
        this._scaleY = param1;
        this.invalidate(INVALIDATE_FROM_PROPERTY, false);
    }

    public function get scaleY(): Number {
        if ((this._flags & PROPERTIES_VALID) == false) {
            this.validatePropertiesFromMatrix();
        }
        return this._scaleY;
    }

    public function set scaleZ(param1: Number): void {
        if ((this._flags & PROPERTIES_VALID) == false) {
            this.validatePropertiesFromMatrix();
        }
        if (param1 == this._scaleZ) {
            return;
        }
        this._scaleZ = param1;
        this.invalidate(INVALIDATE_FROM_PROPERTY, true);
    }

    public function get scaleZ(): Number {
        if ((this._flags & PROPERTIES_VALID) == false) {
            this.validatePropertiesFromMatrix();
        }
        return this._scaleZ;
    }

    public function get is3D(): Boolean {
        if ((this._flags & M3D_FLAGS_VALID) == 0) {
            this.update3DFlags();
        }
        return (this._flags & IS_3D) != 0;
    }

    public function set transformX(param1: Number): void {
        if ((this._flags & PROPERTIES_VALID) == false) {
            this.validatePropertiesFromMatrix();
        }
        if (param1 == this._transformX) {
            return;
        }
        this._transformX = param1;
        this.invalidate(INVALIDATE_FROM_PROPERTY, true);
    }

    public function get transformX(): Number {
        return this._transformX;
    }

    public function set transformY(param1: Number): void {
        if ((this._flags & PROPERTIES_VALID) == false) {
            this.validatePropertiesFromMatrix();
        }
        if (param1 == this._transformY) {
            return;
        }
        this._transformY = param1;
        this.invalidate(INVALIDATE_FROM_PROPERTY, true);
    }

    public function get transformY(): Number {
        return this._transformY;
    }

    public function set transformZ(param1: Number): void {
        if ((this._flags & PROPERTIES_VALID) == false) {
            this.validatePropertiesFromMatrix();
        }
        if (param1 == this._transformZ) {
            return;
        }
        this._transformZ = param1;
        this.invalidate(INVALIDATE_FROM_PROPERTY, true);
    }

    public function get transformZ(): Number {
        return this._transformZ;
    }

    private function invalidate(param1: uint, param2: Boolean): void {
        switch (param1) {
            case INVALIDATE_FROM_PROPERTY:
                this.sourceOfTruth = SOURCE_PROPERTIES;
                this._flags |= PROPERTIES_VALID;
                this._flags &= ~MATRIX_VALID;
                this._flags &= ~MATRIX3D_VALID;
                break;
            case INVALIDATE_FROM_MATRIX:
                this.sourceOfTruth = SOURCE_MATRIX;
                this._flags |= MATRIX_VALID;
                this._flags &= ~PROPERTIES_VALID;
                this._flags &= ~MATRIX3D_VALID;
                break;
            case INVALIDATE_FROM_MATRIX3D:
                this.sourceOfTruth = SOURCE_MATRIX3D;
                this._flags |= MATRIX3D_VALID;
                this._flags &= ~PROPERTIES_VALID;
                this._flags &= ~MATRIX_VALID;
        }
        if (param2) {
            this._flags &= ~M3D_FLAGS_VALID;
        }
    }

    private function update3DFlags(): void {
        var _loc1_: Boolean = false;
        var _loc2_: * = null;
        if ((this._flags & M3D_FLAGS_VALID) == 0) {
            _loc1_ = false;
            switch (this.sourceOfTruth) {
                case SOURCE_PROPERTIES:
                    _loc1_ = Math.abs(this._scaleZ - 1) > EPSILON || (Math.abs(this._rotationX) + EPSILON) % 360 > 2 * EPSILON || (Math.abs(this._rotationY) + EPSILON) % 360 > 2 * EPSILON || Math.abs(this._z) > EPSILON;
                    break;
                case SOURCE_MATRIX:
                    _loc1_ = false;
                    break;
                case SOURCE_MATRIX3D:
                    _loc2_ = this._matrix3D.rawData;
                    _loc1_ = _loc2_[2] != 0 || _loc2_[6] != 0 || _loc2_[8] != 0 || _loc2_[10] != 1 || _loc2_[14] != 0;
            }
            if (_loc1_) {
                this._flags |= IS_3D;
            } else {
                this._flags &= ~IS_3D;
            }
            this._flags |= M3D_FLAGS_VALID;
        }
    }

    public function translateBy(param1: Number, param2: Number, param3: Number = 0): void {
        var _loc4_: * = null;
        if (this._flags & MATRIX_VALID) {
            this._matrix.tx += param1;
            this._matrix.ty += param2;
        }
        if (this._flags & PROPERTIES_VALID) {
            this._x += param1;
            this._y += param2;
            this._z += param3;
        }
        if (this._flags & MATRIX3D_VALID) {
            (_loc4_ = this._matrix3D.rawData)[12] = _loc4_[12] + param1;
            _loc4_[13] += param2;
            _loc4_[14] += param3;
            this._matrix3D.rawData = _loc4_;
        }
        this.invalidate(INVALIDATE_FROM_NONE, param3 != 0);
    }

    public function get matrix(): Matrix {
        if (this._flags & MATRIX_VALID) {
            return this._matrix;
        }
        if ((this._flags & PROPERTIES_VALID) == false) {
            this.validatePropertiesFromMatrix();
        }
        var _loc1_: Matrix = this._matrix;
        if (_loc1_ == null) {
            _loc1_ = this._matrix = new Matrix();
        } else {
            _loc1_.identity();
        }
        AdvancedLayoutFeatures.build2DMatrix(_loc1_, this._transformX, this._transformY, this._scaleX, this._scaleY, this._rotationZ, this._x, this._y);
        this._flags |= MATRIX_VALID;
        return _loc1_;
    }

    public function set matrix(param1: Matrix): void {
        if (this._matrix == null) {
            this._matrix = param1.clone();
        } else {
            this._matrix.identity();
            this._matrix.concat(param1);
        }
        this.invalidate(INVALIDATE_FROM_MATRIX, true);
    }

    private function validatePropertiesFromMatrix(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        if (this.sourceOfTruth == SOURCE_MATRIX3D) {
            _loc1_ = this._matrix3D.decompose();
            this._rotationX = _loc1_[1].x / RADIANS_PER_DEGREES;
            this._rotationY = _loc1_[1].y / RADIANS_PER_DEGREES;
            this._rotationZ = _loc1_[1].z / RADIANS_PER_DEGREES;
            this._scaleX = _loc1_[2].x;
            this._scaleY = _loc1_[2].y;
            this._scaleZ = _loc1_[2].z;
            if (this._transformX != 0 || this._transformY != 0 || this._transformZ != 0) {
                _loc2_ = this._matrix3D.transformVector(new Vector3D(this._transformX, this._transformY, this._transformZ));
                this._x = _loc2_.x - this._transformX;
                this._y = _loc2_.y - this._transformY;
                this._z = _loc2_.z - this._transformZ;
            } else {
                this._x = _loc1_[0].x;
                this._y = _loc1_[0].y;
                this._z = _loc1_[0].z;
            }
        } else if (this.sourceOfTruth == SOURCE_MATRIX) {
            MatrixUtil.decomposeMatrix(decomposition, this._matrix, this._transformX, this._transformY);
            this._x = decomposition[0];
            this._y = decomposition[1];
            this._z = 0;
            this._rotationX = 0;
            this._rotationY = 0;
            this._rotationZ = decomposition[2];
            this._scaleX = decomposition[3];
            this._scaleY = decomposition[4];
            this._scaleZ = 1;
        }
        this._flags |= PROPERTIES_VALID;
    }

    public function get matrix3D(): Matrix3D {
        if (this._flags & MATRIX3D_VALID) {
            return this._matrix3D;
        }
        if ((this._flags & PROPERTIES_VALID) == false) {
            this.validatePropertiesFromMatrix();
        }
        var _loc1_: Matrix3D = this._matrix3D;
        if (_loc1_ == null) {
            _loc1_ = this._matrix3D = new Matrix3D();
        } else {
            _loc1_.identity();
        }
        AdvancedLayoutFeatures.build3DMatrix(_loc1_, this.transformX, this.transformY, this.transformZ, this._scaleX, this._scaleY, this._scaleZ, this._rotationX, this._rotationY, this._rotationZ, this._x, this._y, this._z);
        this._flags |= MATRIX3D_VALID;
        return _loc1_;
    }

    public function set matrix3D(param1: Matrix3D): void {
        if (this._matrix3D == null) {
            this._matrix3D = param1.clone();
        } else {
            this._matrix3D.identity();
            if (param1) {
                this._matrix3D.append(param1);
            }
        }
        this.invalidate(INVALIDATE_FROM_MATRIX3D, true);
    }
}
}
