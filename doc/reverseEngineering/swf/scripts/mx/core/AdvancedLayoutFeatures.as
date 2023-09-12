package mx.core {

import flash.events.Event;
import flash.geom.Matrix;
import flash.geom.Matrix3D;
import flash.geom.Point;
import flash.geom.Vector3D;
import flash.system.Capabilities;

import mx.geom.CompoundTransform;
import mx.geom.TransformOffsets;

public class AdvancedLayoutFeatures implements IAssetLayoutFeatures {

    private static const COMPUTED_MATRIX_VALID: uint = 1;

    private static const COMPUTED_MATRIX3D_VALID: uint = 2;

    private static var reVT: Vector3D = new Vector3D(0, 0, 0);

    private static var reVR: Vector3D = new Vector3D(0, 0, 0);

    private static var reVS: Vector3D = new Vector3D(1, 1, 1);

    private static var reV: Vector.<Vector3D> = new Vector.<Vector3D>();

    private static const RADIANS_PER_DEGREES: Number = 0;

    private static const ZERO_REPLACEMENT_IN_3D: Number = 1e-14;

    private static var tempLocalPosition: Vector3D;

    private static var transformVector: Function = initTransformVectorFunction;

    private static var staticTranslation: Vector3D = new Vector3D();

    private static var staticOffsetTranslation: Vector3D = new Vector3D();

    {
        reV.push(reVT);
        reV.push(reVR);
        reV.push(reVS);
    }

    public var updatePending: Boolean = false;

    public var depth: Number = 0;

    protected var _computedMatrix: Matrix;

    protected var _computedMatrix3D: Matrix3D;

    protected var layout: CompoundTransform;

    private var _postLayoutTransformOffsets: TransformOffsets;

    private var _flags: uint = 0;

    private var _layoutWidth: Number = 0;

    private var _mirror: Boolean = false;

    private var _stretchX: Number = 1;

    private var _stretchY: Number = 1;

    public function AdvancedLayoutFeatures() {
        super();
        this.layout = new CompoundTransform();
    }

    private static function pre10_0_22_87_transformVector(param1: Matrix3D, param2: Vector3D): Vector3D {
        var _loc3_: Vector.<Number> = param1.rawData;
        return new Vector3D(_loc3_[0] * param2.x + _loc3_[4] * param2.y + _loc3_[8] * param2.z + _loc3_[12], _loc3_[1] * param2.x + _loc3_[5] * param2.y + _loc3_[9] * param2.z + _loc3_[13], _loc3_[2] * param2.x + _loc3_[6] * param2.y + _loc3_[10] * param2.z + _loc3_[14], 1);
    }

    private static function nativeTransformVector(param1: Matrix3D, param2: Vector3D): Vector3D {
        return param1.transformVector(param2);
    }

    private static function initTransformVectorFunction(param1: Matrix3D, param2: Vector3D): Vector3D {
        var _loc3_: Boolean = false;
        var _loc4_: Array = Capabilities.version.split(" ")[1].split(",");
        if (parseFloat(_loc4_[0]) > 10) {
            _loc3_ = true;
        } else if (parseFloat(_loc4_[1]) > 0) {
            _loc3_ = true;
        } else if (parseFloat(_loc4_[2]) > 22) {
            _loc3_ = true;
        } else if (parseFloat(_loc4_[3]) >= 87) {
            _loc3_ = true;
        }
        if (_loc3_) {
            transformVector = nativeTransformVector;
        } else {
            transformVector = pre10_0_22_87_transformVector;
        }
        return transformVector(param1, param2);
    }

    public static function build2DMatrix(param1: Matrix, param2: Number, param3: Number, param4: Number, param5: Number, param6: Number, param7: Number, param8: Number): void {
        param1.translate(-param2, -param3);
        param1.scale(param4, param5);
        param1.rotate(param6 * RADIANS_PER_DEGREES);
        param1.translate(param7 + param2, param8 + param3);
    }

    public static function build3DMatrix(param1: Matrix3D, param2: Number, param3: Number, param4: Number, param5: Number, param6: Number, param7: Number, param8: Number, param9: Number, param10: Number, param11: Number, param12: Number, param13: Number): void {
        reVR.x = param8 * RADIANS_PER_DEGREES;
        reVR.y = param9 * RADIANS_PER_DEGREES;
        reVR.z = param10 * RADIANS_PER_DEGREES;
        param1.recompose(reV);
        if (param5 == 0) {
            param5 = ZERO_REPLACEMENT_IN_3D;
        }
        if (param6 == 0) {
            param6 = ZERO_REPLACEMENT_IN_3D;
        }
        if (param7 == 0) {
            param7 = ZERO_REPLACEMENT_IN_3D;
        }
        param1.prependScale(param5, param6, param7);
        param1.prependTranslation(-param2, -param3, -param4);
        param1.appendTranslation(param2 + param11, param3 + param12, param4 + param13);
    }

    public function set layoutX(param1: Number): void {
        this.layout.x = param1;
        this.invalidate();
    }

    public function get layoutX(): Number {
        return this.layout.x;
    }

    public function set layoutY(param1: Number): void {
        this.layout.y = param1;
        this.invalidate();
    }

    public function get layoutY(): Number {
        return this.layout.y;
    }

    public function set layoutZ(param1: Number): void {
        this.layout.z = param1;
        this.invalidate();
    }

    public function get layoutZ(): Number {
        return this.layout.z;
    }

    public function get layoutWidth(): Number {
        return this._layoutWidth;
    }

    public function set layoutWidth(param1: Number): void {
        if (param1 == this._layoutWidth) {
            return;
        }
        this._layoutWidth = param1;
        this.invalidate();
    }

    public function set transformX(param1: Number): void {
        this.layout.transformX = param1;
        this.invalidate();
    }

    public function get transformX(): Number {
        return this.layout.transformX;
    }

    public function set transformY(param1: Number): void {
        this.layout.transformY = param1;
        this.invalidate();
    }

    public function get transformY(): Number {
        return this.layout.transformY;
    }

    public function set transformZ(param1: Number): void {
        this.layout.transformZ = param1;
        this.invalidate();
    }

    public function get transformZ(): Number {
        return this.layout.transformZ;
    }

    public function set layoutRotationX(param1: Number): void {
        this.layout.rotationX = param1;
        this.invalidate();
    }

    public function get layoutRotationX(): Number {
        return this.layout.rotationX;
    }

    public function set layoutRotationY(param1: Number): void {
        this.layout.rotationY = param1;
        this.invalidate();
    }

    public function get layoutRotationY(): Number {
        return this.layout.rotationY;
    }

    public function set layoutRotationZ(param1: Number): void {
        this.layout.rotationZ = param1;
        this.invalidate();
    }

    public function get layoutRotationZ(): Number {
        return this.layout.rotationZ;
    }

    public function set layoutScaleX(param1: Number): void {
        this.layout.scaleX = param1;
        this.invalidate();
    }

    public function get layoutScaleX(): Number {
        return this.layout.scaleX;
    }

    public function set layoutScaleY(param1: Number): void {
        this.layout.scaleY = param1;
        this.invalidate();
    }

    public function get layoutScaleY(): Number {
        return this.layout.scaleY;
    }

    public function set layoutScaleZ(param1: Number): void {
        this.layout.scaleZ = param1;
        this.invalidate();
    }

    public function get layoutScaleZ(): Number {
        return this.layout.scaleZ;
    }

    public function set layoutMatrix(param1: Matrix): void {
        this.layout.matrix = param1;
        this.invalidate();
    }

    public function get layoutMatrix(): Matrix {
        return this.layout.matrix;
    }

    public function set layoutMatrix3D(param1: Matrix3D): void {
        this.layout.matrix3D = param1;
        this.invalidate();
    }

    public function get layoutMatrix3D(): Matrix3D {
        return this.layout.matrix3D;
    }

    public function get is3D(): Boolean {
        return this.layout.is3D || this.postLayoutTransformOffsets != null && this.postLayoutTransformOffsets.mx_internal::is3D;
    }

    public function get layoutIs3D(): Boolean {
        return this.layout.is3D;
    }

    public function set postLayoutTransformOffsets(param1: TransformOffsets): void {
        if (this._postLayoutTransformOffsets != null) {
            this._postLayoutTransformOffsets.removeEventListener(Event.CHANGE, this.postLayoutTransformOffsetsChangedHandler);
            this._postLayoutTransformOffsets.mx_internal::owner = null;
        }
        this._postLayoutTransformOffsets = param1;
        if (this._postLayoutTransformOffsets != null) {
            this._postLayoutTransformOffsets.addEventListener(Event.CHANGE, this.postLayoutTransformOffsetsChangedHandler);
            this._postLayoutTransformOffsets.mx_internal::owner = this;
        }
        this.invalidate();
    }

    public function get postLayoutTransformOffsets(): TransformOffsets {
        return this._postLayoutTransformOffsets;
    }

    private function postLayoutTransformOffsetsChangedHandler(param1: Event): void {
        this.invalidate();
    }

    public function get mirror(): Boolean {
        return this._mirror;
    }

    public function set mirror(param1: Boolean): void {
        this._mirror = param1;
        this.invalidate();
    }

    public function get stretchX(): Number {
        return this._stretchX;
    }

    public function set stretchX(param1: Number): void {
        if (param1 == this._stretchX) {
            return;
        }
        this._stretchX = param1;
        this.invalidate();
    }

    public function get stretchY(): Number {
        return this._stretchY;
    }

    public function set stretchY(param1: Number): void {
        if (param1 == this._stretchY) {
            return;
        }
        this._stretchY = param1;
        this.invalidate();
    }

    private function invalidate(): void {
        this._flags &= ~COMPUTED_MATRIX_VALID;
        this._flags &= ~COMPUTED_MATRIX3D_VALID;
    }

    public function get computedMatrix(): Matrix {
        if (this._flags & COMPUTED_MATRIX_VALID) {
            return this._computedMatrix;
        }
        if (!this.postLayoutTransformOffsets && !this.mirror && this.stretchX == 1 && this.stretchY == 1) {
            return this.layout.matrix;
        }
        var _loc1_: Matrix = this._computedMatrix;
        if (_loc1_ == null) {
            _loc1_ = this._computedMatrix = new Matrix();
        } else {
            _loc1_.identity();
        }
        var _loc2_: Number = this.layout.transformX;
        var _loc3_: Number = this.layout.transformY;
        var _loc4_: Number = this.layout.scaleX;
        var _loc5_: Number = this.layout.scaleY;
        var _loc6_: Number = this.layout.rotationZ;
        var _loc7_: Number = this.layout.x;
        var _loc8_: Number = this.layout.y;
        if (this.mirror) {
            _loc4_ *= -1;
            _loc7_ += this.layoutWidth;
        }
        if (this.postLayoutTransformOffsets) {
            _loc4_ *= this.postLayoutTransformOffsets.scaleX;
            _loc5_ *= this.postLayoutTransformOffsets.scaleY;
            _loc6_ += this.postLayoutTransformOffsets.rotationZ;
            _loc7_ += this.postLayoutTransformOffsets.x;
            _loc8_ += this.postLayoutTransformOffsets.y;
        }
        if (this.stretchX != 1 || this.stretchY != 1) {
            _loc1_.scale(this.stretchX, this.stretchY);
        }
        build2DMatrix(_loc1_, _loc2_, _loc3_, _loc4_, _loc5_, _loc6_, _loc7_, _loc8_);
        this._flags |= COMPUTED_MATRIX_VALID;
        return _loc1_;
    }

    public function get computedMatrix3D(): Matrix3D {
        if (this._flags & COMPUTED_MATRIX3D_VALID) {
            return this._computedMatrix3D;
        }
        if (!this.postLayoutTransformOffsets && !this.mirror && this.stretchX == 1 && this.stretchY == 1) {
            return this.layout.matrix3D;
        }
        var _loc1_: Matrix3D = this._computedMatrix3D;
        if (_loc1_ == null) {
            _loc1_ = this._computedMatrix3D = new Matrix3D();
        } else {
            _loc1_.identity();
        }
        var _loc2_: Number = this.layout.transformX;
        var _loc3_: Number = this.layout.transformY;
        var _loc4_: Number = this.layout.transformZ;
        var _loc5_: Number = this.layout.scaleX;
        var _loc6_: Number = this.layout.scaleY;
        var _loc7_: Number = this.layout.scaleZ;
        var _loc8_: Number = this.layout.rotationX;
        var _loc9_: Number = this.layout.rotationY;
        var _loc10_: Number = this.layout.rotationZ;
        var _loc11_: Number = this.layout.x;
        var _loc12_: Number = this.layout.y;
        var _loc13_: Number = this.layout.z;
        if (this.mirror) {
            _loc5_ *= -1;
            _loc11_ += this.layoutWidth;
        }
        if (this.postLayoutTransformOffsets) {
            _loc5_ *= this.postLayoutTransformOffsets.scaleX;
            _loc6_ *= this.postLayoutTransformOffsets.scaleY;
            _loc7_ *= this.postLayoutTransformOffsets.scaleZ;
            _loc8_ += this.postLayoutTransformOffsets.rotationX;
            _loc9_ += this.postLayoutTransformOffsets.rotationY;
            _loc10_ += this.postLayoutTransformOffsets.rotationZ;
            _loc11_ += this.postLayoutTransformOffsets.x;
            _loc12_ += this.postLayoutTransformOffsets.y;
            _loc13_ += this.postLayoutTransformOffsets.z;
        }
        build3DMatrix(_loc1_, _loc2_, _loc3_, _loc4_, _loc5_, _loc6_, _loc7_, _loc8_, _loc9_, _loc10_, _loc11_, _loc12_, _loc13_);
        if (this.stretchX != 1 || this.stretchY != 1) {
            _loc1_.prependScale(this.stretchX, this.stretchY, 1);
        }
        this._flags |= COMPUTED_MATRIX3D_VALID;
        return _loc1_;
    }

    public function transformPointToParent(param1: Boolean, param2: Vector3D, param3: Vector3D, param4: Vector3D): void {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        tempLocalPosition = !!param2 ? param2.clone() : new Vector3D();
        if (this.is3D || param1) {
            if (param3 != null) {
                _loc5_ = transformVector(this.layoutMatrix3D, tempLocalPosition);
                param3.x = _loc5_.x;
                param3.y = _loc5_.y;
                param3.z = _loc5_.z;
            }
            if (param4 != null) {
                tempLocalPosition.x = 0 / this.stretchX;
                tempLocalPosition.y = 0 / this.stretchY;
                _loc5_ = transformVector(this.computedMatrix3D, tempLocalPosition);
                param4.x = _loc5_.x;
                param4.y = _loc5_.y;
                param4.z = _loc5_.z;
            }
        } else {
            _loc7_ = new Point(tempLocalPosition.x, tempLocalPosition.y);
            if (param3 != null) {
                _loc6_ = this.layoutMatrix.transformPoint(_loc7_);
                param3.x = _loc6_.x;
                param3.y = _loc6_.y;
                param3.z = 0;
            }
            if (param4 != null) {
                _loc7_.x /= this.stretchX;
                _loc7_.y /= this.stretchY;
                _loc6_ = this.computedMatrix.transformPoint(_loc7_);
                param4.x = _loc6_.x;
                param4.y = _loc6_.y;
                param4.z = 0;
            }
        }
    }

    private function completeTransformCenterAdjustment(param1: Boolean, param2: Vector3D, param3: Vector3D, param4: Vector3D): void {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        if (this.is3D || param1) {
            if (param3 != null) {
                if ((_loc5_ = transformVector(this.layoutMatrix3D, param2)).equals(param3) == false) {
                    this.layout.translateBy(param3.x - _loc5_.x, param3.y - _loc5_.y, param3.z - _loc5_.z);
                    this.invalidate();
                }
            }
            if (param4 != null && this._postLayoutTransformOffsets != null) {
                _loc6_ = new Vector3D(param2.x, param2.y, param2.z);
                _loc6_.x /= this.stretchX;
                _loc6_.y /= this.stretchY;
                if ((_loc7_ = transformVector(this.computedMatrix3D, _loc6_)).equals(param4) == false) {
                    this.postLayoutTransformOffsets.x += param4.x - _loc7_.x;
                    this.postLayoutTransformOffsets.y += param4.y - _loc7_.y;
                    this.postLayoutTransformOffsets.z += param4.z - _loc7_.z;
                    this.invalidate();
                }
            }
        } else {
            _loc8_ = new Point(param2.x, param2.y);
            if (param3 != null) {
                if ((_loc9_ = this.layoutMatrix.transformPoint(_loc8_)).x != param3.x || _loc9_.y != param3.y) {
                    this.layout.translateBy(param3.x - _loc9_.x, param3.y - _loc9_.y, 0);
                    this.invalidate();
                }
            }
            if (param4 != null && this._postLayoutTransformOffsets != null) {
                _loc8_.x /= this.stretchX;
                _loc8_.y /= this.stretchY;
                if ((_loc10_ = this.computedMatrix.transformPoint(_loc8_)).x != param4.x || _loc10_.y != param4.y) {
                    this._postLayoutTransformOffsets.x += param4.x - _loc10_.x;
                    this._postLayoutTransformOffsets.y += param4.y - _loc10_.y;
                    this.invalidate();
                }
            }
        }
    }

    public function transformAround(param1: Vector3D, param2: Vector3D, param3: Vector3D, param4: Vector3D, param5: Vector3D = null, param6: Vector3D = null, param7: Vector3D = null): void {
        var _loc8_: Boolean = param2 != null && param2.z != 1 || param3 != null && (param3.x != 0 || param3.y != 0) || param4 != null && param4.z != 0 || param5 != null && param5.z != 1 || param6 != null && (param6.x != 0 || param6.y != 0) || param7 != null && param7.z != 0;
        var _loc9_: Boolean;
        if (_loc9_ = this._postLayoutTransformOffsets == null && (param5 != null || param6 != null || param7 != null)) {
            this._postLayoutTransformOffsets = new TransformOffsets();
        }
        if (param1 != null && (param4 == null || param7 == null)) {
            this.transformPointToParent(_loc8_, param1, staticTranslation, staticOffsetTranslation);
            if (param7 == null && param4 != null) {
                staticOffsetTranslation.x = param4.x + staticOffsetTranslation.x - 0;
                staticOffsetTranslation.y = param4.y + staticOffsetTranslation.y - 0;
                staticOffsetTranslation.z = param4.z + staticOffsetTranslation.z - 0;
            }
        }
        var _loc10_: Vector3D = param4 == null ? staticTranslation : param4;
        var _loc11_: Vector3D = param7 == null ? staticOffsetTranslation : param7;
        if (param3 != null) {
            if (!isNaN(param3.x)) {
                this.layout.rotationX = param3.x;
            }
            if (!isNaN(param3.y)) {
                this.layout.rotationY = param3.y;
            }
            if (!isNaN(param3.z)) {
                this.layout.rotationZ = param3.z;
            }
        }
        if (param2 != null) {
            if (!isNaN(param2.x)) {
                this.layout.scaleX = param2.x;
            }
            if (!isNaN(param2.y)) {
                this.layout.scaleY = param2.y;
            }
            if (!isNaN(param2.z)) {
                this.layout.scaleZ = param2.z;
            }
        }
        if (param6 != null) {
            this._postLayoutTransformOffsets.rotationX = param6.x;
            this._postLayoutTransformOffsets.rotationY = param6.y;
            this._postLayoutTransformOffsets.rotationZ = param6.z;
        }
        if (param5 != null) {
            this._postLayoutTransformOffsets.scaleX = param5.x;
            this._postLayoutTransformOffsets.scaleY = param5.y;
            this._postLayoutTransformOffsets.scaleZ = param5.z;
        }
        if (param1 == null) {
            if (param4 != null) {
                this.layout.x = param4.x;
                this.layout.y = param4.y;
                this.layout.z = param4.z;
            }
            if (param7 != null) {
                this._postLayoutTransformOffsets.x = param7.x - this.layout.x;
                this._postLayoutTransformOffsets.y = param7.y - this.layout.y;
                this._postLayoutTransformOffsets.z = param7.z - this.layout.z;
            }
        }
        this.invalidate();
        if (param1 != null) {
            this.completeTransformCenterAdjustment(_loc8_, param1, _loc10_, _loc11_);
        }
    }
}
}
