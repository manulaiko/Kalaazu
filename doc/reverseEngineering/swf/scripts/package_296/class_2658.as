package package_296 {

import flash.display.*;
import flash.geom.*;
import flash.utils.*;

import package_294.*;

public class class_2658 extends class_2657 implements class_2228 {


    private var var_797: Class;

    private var var_331: Boolean;

    private var var_3353: Shader;

    private var var_2966: class_2398;

    private var var_3742: Vector.<Number>;

    public function class_2658(param1: Boolean = false) {
        this.var_797 = class_2712;
        super();
        this.var_331 = param1;
        this.var_3742 = new Vector.<Number>();
        this.var_3353 = new Shader(new this.var_797() as ByteArray);
    }

    override public function method_2991(param1: Vector3D, param2: Vector3D): void {
        super.method_2991(param1, param2);
        this.var_3353.data.rayStartPoint.value = [name_34.x, name_34.y, name_34.z];
        this.var_3353.data.rayDirection.value = [rayDirection.x, rayDirection.y, rayDirection.z];
    }

    public function method_827(param1: class_2398, param2: class_1754, param3: Number): Boolean {
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc16_: * = 0;
        var _loc17_: Number = NaN;
        var _loc20_: * = null;
        var _loc21_: * = null;
        var _loc10_: Vector.<uint> = param1.indexData;
        var _loc11_: Vector.<Number> = param1.subGeometry.method_1272;
        var _loc12_: Vector.<Number> = param1.method_868;
        var _loc13_: Vector.<Number> = Vector.<Number>(_loc10_);
        var _loc14_: Point = this.method_814(_loc13_);
        if (!this.var_2966 || this.var_2966 !== param1) {
            _loc20_ = _loc11_.concat();
            _loc21_ = this.method_814(_loc20_);
            this.var_3353.data.vertexBuffer.width = _loc21_.x;
            this.var_3353.data.vertexBuffer.height = _loc21_.y;
            this.var_3353.data.vertexBufferWidth.value = [_loc21_.x];
            this.var_3353.data.vertexBuffer.input = _loc20_;
            this.var_3353.data.bothSides.value = [Boolean(param1.material) && Boolean(param1.material.bothSides) ? 1 : 0];
            this.var_3353.data.indexBuffer.width = _loc14_.x;
            this.var_3353.data.indexBuffer.height = _loc14_.y;
            this.var_3353.data.indexBuffer.input = _loc13_;
        }
        this.var_2966 = param1;
        var _loc15_: ShaderJob;
        (_loc15_ = new ShaderJob(this.var_3353, this.var_3742, _loc14_.x, _loc14_.y)).start(true);
        var _loc18_: int = -1;
        var _loc19_: uint = uint(this.var_3742.length);
        _loc16_ = 0;
        while (_loc16_ < _loc19_) {
            if ((_loc17_ = Number(this.var_3742[_loc16_])) > 0 && _loc17_ < param3) {
                param3 = _loc17_;
                _loc18_ = _loc16_;
                if (!this.var_331) {
                    break;
                }
            }
            _loc16_ += 3;
        }
        if (_loc18_ >= 0) {
            param2.var_2865 = param3;
            if (param2.name_53 == null) {
                param2.name_53 = new Vector3D();
            }
            param2.name_53.x = name_34.x + param3 * 0;
            param2.name_53.y = name_34.y + param3 * 0;
            param2.name_53.z = name_34.z + param3 * 0;
            param2.var_2450 = method_3018(_loc10_, _loc11_, _loc18_, param2.var_2450);
            _loc8_ = Number(this.var_3742[_loc18_ + 1]);
            _loc9_ = Number(this.var_3742[_loc18_ + 2]);
            _loc7_ = 1 - _loc8_ - _loc9_;
            param2.var_247 = method_6005(_loc10_, _loc12_, _loc18_, _loc8_, _loc9_, _loc7_, 0, 2, param2.var_247);
            return true;
        }
        return false;
    }

    private function method_814(param1: Vector.<Number>): Point {
        var _loc5_: Number = 0;
        var _loc2_: uint = param1.length / 3;
        var _loc3_: uint = Math.floor(Math.sqrt(_loc2_));
        var _loc4_: uint = _loc3_;
        while (_loc3_ * _loc4_ < _loc2_) {
            _loc5_ = 0;
            while (_loc5_ < _loc3_) {
                param1.push(0, 0, 0);
                _loc5_++;
            }
            _loc4_++;
        }
        return new Point(_loc3_, _loc4_);
    }
}
}
