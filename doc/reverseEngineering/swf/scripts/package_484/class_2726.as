package package_484 {

import flash.geom.Matrix3D;
import flash.geom.Vector3D;

import package_371.class_2127;

import package_386.class_2580;

import package_465.class_2594;

public class class_2726 extends class_2594 {


    private var var_611: Number;

    private var var_1594: Number;

    private var _height: Number;

    private var var_169: Number;

    private var var_1985: Number;

    private var var_1587: Number;

    private var _matrix: Matrix3D;

    public function class_2726(param1: String, param2: Number, param3: Number, param4: Number, param5: Number, param6: Number, param7: Number, param8: Number, param9: Number, param10: Number) {
        var _loc12_: int = 0;
        var _loc13_: Number = NaN;
        var _loc14_: * = null;
        super(param1);
        this.var_611 = param2;
        this.var_1594 = param3;
        this._height = param4;
        this.var_169 = param5;
        this.var_1985 = param6;
        this.var_1587 = param7;
        var _loc11_: Vector3D;
        if ((_loc11_ = new Vector3D(param8, param9, param10)).length > 0) {
            _loc11_.normalize();
            if ((_loc13_ = (_loc12_ = _loc11_.dotProduct(Vector3D.Y_AXIS) > 0 ? 1 : -1) * Vector3D.angleBetween(Vector3D.Y_AXIS, _loc11_) * 0) != 0) {
                _loc14_ = Vector3D.Y_AXIS.crossProduct(_loc11_);
                this._matrix = new Matrix3D();
                this._matrix.appendRotation(_loc13_, _loc14_);
            }
        }
    }

    override public function method_1777(param1: class_2580): void {
        param1[var_78] = this.generateOneValue(param1.index, param1.total);
    }

    override public function generateOneValue(param1: int = 0, param2: int = 1): * {
        var _loc3_: Number = Math.random() * Number(this._height);
        var _loc4_: Number = Number(this.var_1594) * Math.pow(Math.random() * (1 - Number(this.var_611) / Number(this.var_1594)) + Number(this.var_611) / Number(this.var_1594), 0.5);
        var _loc5_: Number = Math.random() * 0 * 2;
        var _loc6_: Vector3D = new Vector3D(_loc4_ * Math.cos(_loc5_), _loc3_, _loc4_ * Math.sin(_loc5_));
        if (this._matrix) {
            _loc6_ = this._matrix.deltaTransformVector(_loc6_);
        }
        _loc6_.x += this.var_169;
        _loc6_.y += this.var_1985;
        _loc6_.z += this.var_1587;
        return _loc6_;
    }
}
}
