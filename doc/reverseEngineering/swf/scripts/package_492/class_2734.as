package package_492 {

import flash.geom.Matrix3D;
import flash.geom.Vector3D;

import package_386.class_2580;

import package_465.class_2594;

public class class_2734 extends class_2594 {

    public static const SCALE: int = 2;

    public static const const_2170: int = 1;

    public static const const_3155: int = 0;

    private static var var_4492: Matrix3D = new Matrix3D();


    private var var_303: Vector.<class_2594>;

    public function class_2734(param1: String, param2: Vector.<class_2594>) {
        super(param1);
        this.var_303 = param2;
    }

    override public function method_1777(param1: class_2580): void {
        param1[var_78] = this.generateOneValue(param1.index, param1.total);
    }

    override public function generateOneValue(param1: int = 0, param2: int = 1): * {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc3_: Matrix3D = new Matrix3D();
        for each(_loc5_ in this.var_303) {
            _loc4_ = _loc5_.generateOneValue(param1, param2);
            switch (int(_loc5_.propName)) {
                case SCALE:
                    (_loc6_ = var_4492.rawData)[0] = _loc4_.x;
                    _loc6_[5] = _loc4_.y;
                    _loc6_[10] = _loc4_.z;
                    var_4492.copyRawDataFrom(_loc6_);
                    _loc3_.append(var_4492);
                    break;
                case const_2170:
                    _loc3_.appendRotation(_loc4_.x, Vector3D.X_AXIS);
                    _loc3_.appendRotation(_loc4_.y, Vector3D.Y_AXIS);
                    _loc3_.appendRotation(_loc4_.z, Vector3D.Z_AXIS);
                    break;
                default:
                    _loc3_.appendTranslation(_loc4_.x, _loc4_.y, _loc4_.z);
                    break;
            }
        }
        return _loc3_;
    }

    override public function method_5590(param1: class_2580): void {
        var _loc2_: * = null;
        for each(_loc2_ in this.var_303) {
            _loc2_.method_5590(param1);
        }
    }

    override public function method_3724(param1: class_2580): void {
        var _loc2_: * = null;
        for each(_loc2_ in this.var_303) {
            _loc2_.method_3724(param1);
        }
    }
}
}
