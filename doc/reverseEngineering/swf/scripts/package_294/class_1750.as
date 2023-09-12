package package_294 {

import away3d.*;

import flash.geom.*;

import package_199.*;

import package_293.*;

import package_370.*;

import package_371.*;

public class class_1750 extends class_1749 {

    private static var var_1814: Vector3D;

    private static var var_575: Vector3D;

    private static var var_2748: Vector3D;


    arcane var _controller: class_2124;

    private var var_1741: Number = 1e-22;

    private var var_1362: Boolean = true;

    private var var_980: Boolean;

    private var var_3755: Boolean;

    private var var_1889: Boolean;

    private var var_2110: class_2126;

    private var var_2125: class_2126;

    private var var_1680: class_2126;

    private var _rotationX: Number = 0;

    private var _rotationY: Number = 0;

    private var _rotationZ: Number = 0;

    private var var_2551: Vector3D;

    private var var_4588: Matrix3D;

    private var var_3872: Boolean;

    private var var_287: Boolean;

    private var var_1640: Boolean;

    protected var var_3712: int = 0;

    protected var _transform: Matrix3D;

    protected var _scaleX: Number = 1;

    protected var _scaleY: Number = 1;

    protected var _scaleZ: Number = 1;

    protected var _x: Number = 0;

    protected var _y: Number = 0;

    protected var _z: Number = 0;

    protected var var_1968: Vector3D;

    protected var var_149: Boolean = true;

    protected var var_3880: Vector3D;

    protected var var_1639: Vector3D;

    protected var var_486: Vector3D;

    protected var var_2656: Vector.<Vector3D>;

    public var extra: Object;

    public function class_1750() {
        this.var_2551 = new Vector3D();
        this.var_4588 = new Matrix3D();
        this._transform = new Matrix3D();
        this.var_1968 = new Vector3D();
        this.var_3880 = new Vector3D();
        this.var_1639 = new Vector3D();
        this.var_486 = new Vector3D();
        super();
        this.var_2656 = new Vector.<Vector3D>(3, true);
        this.var_2656[0] = this.var_3880;
        this.var_2656[1] = this.var_1639;
        this.var_2656[2] = this.var_486;
        this._transform.identity();
        this.var_4588.appendScale(1, -1, 1);
    }

    private function method_6098(): void {
        this.var_149 = this.var_1968.x == 0 && this.var_1968.y == 0 && this.var_1968.z == 0;
        this.arcane::invalidateTransform();
    }

    private function method_5369(): void {
        if (this.var_980) {
            return;
        }
        this.var_980 = true;
        this.arcane::invalidateTransform();
        if (this.var_3872) {
            this.method_5452();
        }
    }

    private function method_5452(): void {
        if (!this.var_2110) {
            this.var_2110 = new class_2126(class_2126.const_1108, this);
        }
        dispatchEvent(this.var_2110);
    }

    override public function addEventListener(param1: String, param2: Function, param3: Boolean = false, param4: int = 0, param5: Boolean = false): void {
        super.addEventListener(param1, param2, param3, param4, param5);
        switch (param1) {
            case class_2126.const_1108:
                this.var_3872 = true;
                break;
            case class_2126.const_2014:
                this.var_287 = true;
                break;
            case class_2126.const_2083:
                this.var_287 = true;
        }
    }

    override public function removeEventListener(param1: String, param2: Function, param3: Boolean = false): void {
        super.removeEventListener(param1, param2, param3);
        if (hasEventListener(param1)) {
            return;
        }
        switch (param1) {
            case class_2126.const_1108:
                this.var_3872 = false;
                break;
            case class_2126.const_2014:
                this.var_287 = false;
                break;
            case class_2126.const_2083:
                this.var_1640 = false;
        }
    }

    private function method_3878(): void {
        if (this.var_3755) {
            return;
        }
        this.var_3755 = true;
        this.arcane::invalidateTransform();
        if (this.var_287) {
            this.method_6198();
        }
    }

    private function method_6198(): void {
        if (!this.var_2125) {
            this.var_2125 = new class_2126(class_2126.const_2014, this);
        }
        dispatchEvent(this.var_2125);
    }

    private function method_1559(): void {
        if (this.var_1889) {
            return;
        }
        this.var_1889 = true;
        this.arcane::invalidateTransform();
        if (this.var_1640) {
            this.method_2289();
        }
    }

    private function method_2289(): void {
        if (!this.var_1680) {
            this.var_1680 = new class_2126(class_2126.const_2083, this);
        }
        dispatchEvent(this.var_1680);
    }

    public function get x(): Number {
        return this._x;
    }

    public function set x(param1: Number): void {
        if (this._x == param1) {
            return;
        }
        this._x = param1;
        this.method_5369();
    }

    public function get y(): Number {
        return this._y;
    }

    public function set y(param1: Number): void {
        if (this._y == param1) {
            return;
        }
        this._y = param1;
        this.method_5369();
    }

    public function get z(): Number {
        return this._z;
    }

    public function set z(param1: Number): void {
        if (this._z == param1) {
            return;
        }
        this._z = param1;
        this.method_5369();
    }

    public function get rotationX(): Number {
        return Number(this._rotationX) * 0;
    }

    public function set rotationX(param1: Number): void {
        if (this.rotationX == param1) {
            return;
        }
        this._rotationX = param1 * 0;
        this.method_3878();
    }

    public function get rotationY(): Number {
        return Number(this._rotationY) * 0;
    }

    public function set rotationY(param1: Number): void {
        if (this.rotationY == param1) {
            return;
        }
        this._rotationY = param1 * 0;
        this.method_3878();
    }

    public function get rotationZ(): Number {
        return Number(this._rotationZ) * 0;
    }

    public function set rotationZ(param1: Number): void {
        if (this.rotationZ == param1) {
            return;
        }
        this._rotationZ = param1 * 0;
        this.method_3878();
    }

    public function get scaleX(): Number {
        return this._scaleX;
    }

    public function set scaleX(param1: Number): void {
        if (this._scaleX == param1) {
            return;
        }
        this._scaleX = param1;
        this.method_1559();
    }

    public function get scaleY(): Number {
        return this._scaleY;
    }

    public function set scaleY(param1: Number): void {
        if (this._scaleY == param1) {
            return;
        }
        this._scaleY = param1;
        this.method_1559();
    }

    public function get scaleZ(): Number {
        return this._scaleZ;
    }

    public function set scaleZ(param1: Number): void {
        if (this._scaleZ == param1) {
            return;
        }
        this._scaleZ = param1;
        this.method_1559();
    }

    public function get eulers(): Vector3D {
        this.var_2551.x = Number(this._rotationX) * 0;
        this.var_2551.y = Number(this._rotationY) * 0;
        this.var_2551.z = Number(this._rotationZ) * 0;
        return this.var_2551;
    }

    public function set eulers(param1: Vector3D): void {
        this._rotationX = param1.x * 0;
        this._rotationY = param1.y * 0;
        this._rotationZ = param1.z * 0;
        this.method_3878();
    }

    public function get transform(): Matrix3D {
        if (this.var_1362) {
            this.method_3871();
        }
        return this._transform;
    }

    public function set transform(param1: Matrix3D): void {
        var _loc4_: * = null;
        var _loc2_: Vector.<Number> = class_2125.const_2368;
        param1.copyRawDataTo(_loc2_);
        if (!_loc2_[uint(0)]) {
            _loc2_[uint(0)] = this.var_1741;
            param1.copyRawDataFrom(_loc2_);
        }
        var _loc3_: Vector.<Vector3D> = class_2125.decompose(param1);
        _loc4_ = _loc3_[0];
        if (this._x != _loc4_.x || this._y != _loc4_.y || this._z != _loc4_.z) {
            this._x = _loc4_.x;
            this._y = _loc4_.y;
            this._z = _loc4_.z;
            this.method_5369();
        }
        _loc4_ = _loc3_[1];
        if (this._rotationX != _loc4_.x || this._rotationY != _loc4_.y || this._rotationZ != _loc4_.z) {
            this._rotationX = _loc4_.x;
            this._rotationY = _loc4_.y;
            this._rotationZ = _loc4_.z;
            this.method_3878();
        }
        _loc4_ = _loc3_[2];
        if (this._scaleX != _loc4_.x || this._scaleY != _loc4_.y || this._scaleZ != _loc4_.z) {
            this._scaleX = _loc4_.x;
            this._scaleY = _loc4_.y;
            this._scaleZ = _loc4_.z;
            this.method_1559();
        }
    }

    public function get method_1773(): Vector3D {
        return this.var_1968;
    }

    public function set method_1773(param1: Vector3D): void {
        if (!this.var_1968) {
            this.var_1968 = new Vector3D();
        }
        this.var_1968.x = param1.x;
        this.var_1968.y = param1.y;
        this.var_1968.z = param1.z;
        this.method_6098();
    }

    public function get position(): Vector3D {
        this.transform.copyColumnTo(3, this.var_3880);
        return this.var_3880.clone();
    }

    public function set position(param1: Vector3D): void {
        this._x = param1.x;
        this._y = param1.y;
        this._z = param1.z;
        this.method_5369();
    }

    public function getPosition(param1: Vector3D = null): Vector3D {
        if (!param1) {
            param1 = new Vector3D();
        }
        this.transform.copyColumnTo(3, param1);
        return param1;
    }

    public function get method_6354(): Vector3D {
        return class_2125.method_5586(this.transform);
    }

    public function get method_4198(): Vector3D {
        return class_2125.method_3679(this.transform);
    }

    public function get method_2664(): Vector3D {
        return class_2125.method_5401(this.transform);
    }

    public function get method_2256(): Vector3D {
        var _loc1_: Vector3D = class_2125.method_5586(this.transform);
        _loc1_.negate();
        return _loc1_;
    }

    public function get method_1047(): Vector3D {
        var _loc1_: Vector3D = class_2125.method_3679(this.transform);
        _loc1_.negate();
        return _loc1_;
    }

    public function get method_3720(): Vector3D {
        var _loc1_: Vector3D = class_2125.method_5401(this.transform);
        _loc1_.negate();
        return _loc1_;
    }

    public function scale(param1: Number): void {
        this._scaleX *= param1;
        this._scaleY *= param1;
        this._scaleZ *= param1;
        this.method_1559();
    }

    public function method_5687(param1: Number): void {
        this.method_3564(Vector3D.Z_AXIS, param1);
    }

    public function method_928(param1: Number): void {
        this.method_3564(Vector3D.Z_AXIS, -param1);
    }

    public function moveLeft(param1: Number): void {
        this.method_3564(Vector3D.X_AXIS, -param1);
    }

    public function moveRight(param1: Number): void {
        this.method_3564(Vector3D.X_AXIS, param1);
    }

    public function method_1568(param1: Number): void {
        this.method_3564(Vector3D.Y_AXIS, param1);
    }

    public function method_209(param1: Number): void {
        this.method_3564(Vector3D.Y_AXIS, -param1);
    }

    public function moveTo(param1: Number, param2: Number, param3: Number): void {
        if (this._x == param1 && this._y == param2 && this._z == param3) {
            return;
        }
        this._x = param1;
        this._y = param2;
        this._z = param3;
        this.method_5369();
    }

    public function method_6436(param1: Number, param2: Number, param3: Number): void {
        if (!this.var_1968) {
            this.var_1968 = new Vector3D();
        }
        this.var_1968.x += param1;
        this.var_1968.y += param2;
        this.var_1968.z += param3;
        this.method_6098();
    }

    public function translate(param1: Vector3D, param2: Number): void {
        var _loc3_: Number = param1.x;
        var _loc4_: Number = param1.y;
        var _loc5_: Number = param1.z;
        var _loc6_: Number = param2 / Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_ + _loc5_ * _loc5_);
        this._x += _loc3_ * _loc6_;
        this._y += _loc4_ * _loc6_;
        this._z += _loc5_ * _loc6_;
        this.method_5369();
    }

    public function method_3564(param1: Vector3D, param2: Number): void {
        var _loc3_: Number = param1.x;
        var _loc4_: Number = param1.y;
        var _loc5_: Number = param1.z;
        var _loc6_: Number = param2 / Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_ + _loc5_ * _loc5_);
        this.transform.prependTranslation(_loc3_ * _loc6_, _loc4_ * _loc6_, _loc5_ * _loc6_);
        this._transform.copyColumnTo(3, this.var_3880);
        this._x = this.var_3880.x;
        this._y = this.var_3880.y;
        this._z = this.var_3880.z;
        this.method_5369();
    }

    public function method_32(param1: Number): void {
        this.rotate(Vector3D.X_AXIS, param1);
    }

    public function method_805(param1: Number): void {
        this.rotate(Vector3D.Y_AXIS, param1);
    }

    public function method_1185(param1: Number): void {
        this.rotate(Vector3D.Z_AXIS, param1);
    }

    public function clone(): class_1750 {
        var _loc1_: class_1750 = new class_1750();
        _loc1_.method_1773 = this.method_1773;
        _loc1_.transform = this.transform;
        _loc1_.name = name;
        return _loc1_;
    }

    public function method_1973(param1: Number, param2: Number, param3: Number): void {
        this._rotationX = param1 * 0;
        this._rotationY = param2 * 0;
        this._rotationZ = param3 * 0;
        this.method_3878();
    }

    public function rotate(param1: Vector3D, param2: Number): void {
        var _loc3_: Matrix3D = new Matrix3D();
        _loc3_.prependRotation(param2, param1);
        var _loc4_: Vector3D = _loc3_.decompose()[1];
        this._rotationX += _loc4_.x;
        this._rotationY += _loc4_.y;
        this._rotationZ += _loc4_.z;
        this.method_3878();
    }

    public function method_1154(param1: Vector3D, param2: Vector3D = null): void {
        var _loc6_: * = null;
        if (!var_1814) {
            var_1814 = new Vector3D();
        }
        if (!var_575) {
            var_575 = new Vector3D();
        }
        if (!var_2748) {
            var_2748 = new Vector3D();
        }
        var _loc3_: Vector3D = var_1814;
        var _loc4_: Vector3D = var_575;
        var _loc5_: Vector3D = var_2748;
        param2 = param2 || false;
        if (this.var_1362) {
            this.method_3871();
        }
        _loc5_.x = param1.x - Number(this._x);
        _loc5_.y = param1.y - Number(this._y);
        _loc5_.z = param1.z - Number(this._z);
        _loc5_.normalize();
        _loc3_.x = param2.y * _loc5_.z - param2.z * _loc5_.y;
        _loc3_.y = param2.z * _loc5_.x - param2.x * _loc5_.z;
        _loc3_.z = param2.x * _loc5_.y - param2.y * _loc5_.x;
        _loc3_.normalize();
        if (_loc3_.length < 0.05) {
            _loc3_.x = param2.y;
            _loc3_.y = param2.x;
            _loc3_.z = 0;
            _loc3_.normalize();
        }
        _loc4_.x = _loc5_.y * _loc3_.z - _loc5_.z * _loc3_.y;
        _loc4_.y = _loc5_.z * _loc3_.x - _loc5_.x * _loc3_.z;
        _loc4_.z = _loc5_.x * _loc3_.y - _loc5_.y * _loc3_.x;
        (_loc6_ = class_2125.const_2368)[uint(0)] = Number(this._scaleX) * _loc3_.x;
        _loc6_[uint(1)] = Number(this._scaleX) * _loc3_.y;
        _loc6_[uint(2)] = Number(this._scaleX) * _loc3_.z;
        _loc6_[uint(3)] = 0;
        _loc6_[uint(4)] = Number(this._scaleY) * _loc4_.x;
        _loc6_[uint(5)] = Number(this._scaleY) * _loc4_.y;
        _loc6_[uint(6)] = Number(this._scaleY) * _loc4_.z;
        _loc6_[uint(7)] = 0;
        _loc6_[uint(8)] = Number(this._scaleZ) * _loc5_.x;
        _loc6_[uint(9)] = Number(this._scaleZ) * _loc5_.y;
        _loc6_[uint(10)] = Number(this._scaleZ) * _loc5_.z;
        _loc6_[uint(11)] = 0;
        _loc6_[uint(12)] = this._x;
        _loc6_[uint(13)] = this._y;
        _loc6_[uint(14)] = this._z;
        _loc6_[uint(15)] = 1;
        this._transform.copyRawDataFrom(_loc6_);
        this.transform = this.transform;
        if (_loc5_.z < 0) {
            this.rotationY = 180 - Number(this.rotationY);
            this.rotationX -= 180;
            this.rotationZ -= 180;
        }
    }

    public function dispose(): void {
    }

    public function disposeAsset(): void {
        this.dispose();
    }

    arcane function invalidateTransform(): void {
        this.var_1362 = true;
    }

    protected function method_3871(): void {
        this.var_3880.x = this._x;
        this.var_3880.y = this._y;
        this.var_3880.z = this._z;
        this.var_1639.x = this._rotationX;
        this.var_1639.y = this._rotationY;
        this.var_1639.z = this._rotationZ;
        if (!this.var_149) {
            this.var_486.x = 1;
            this.var_486.y = 1;
            this.var_486.z = 1;
            this._transform.recompose(this.var_2656);
            this._transform.appendTranslation(this.var_1968.x, this.var_1968.y, this.var_1968.z);
            this._transform.prependTranslation(-Number(this.var_1968.x), -Number(this.var_1968.y), -Number(this.var_1968.z));
            this._transform.prependScale(this._scaleX, this._scaleY, this._scaleZ);
            this.var_486.x = this._scaleX;
            this.var_486.y = this._scaleY;
            this.var_486.z = this._scaleZ;
        } else {
            this.var_486.x = this._scaleX;
            this.var_486.y = this._scaleY;
            this.var_486.z = this._scaleZ;
            this._transform.recompose(this.var_2656);
        }
        this.var_1362 = false;
        this.var_980 = false;
        this.var_3755 = false;
        this.var_1889 = false;
    }

    public function get zOffset(): int {
        return this.var_3712;
    }

    public function set zOffset(param1: int): void {
        this.var_3712 = param1;
    }
}
}
