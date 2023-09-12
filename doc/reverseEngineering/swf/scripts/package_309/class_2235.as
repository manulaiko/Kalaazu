package package_309 {

import away3d.arcane;

import flash.display3D.Context3D;
import flash.display3D.Context3DProgramType;
import flash.display3D.Context3DTextureFormat;
import flash.geom.Matrix3D;

import package_198.class_1208;

import package_294.class_2133;

import package_305.class_1767;

import package_369.class_2116;

import package_371.class_2125;

public class class_2235 extends class_1774 {


    private var _data: Vector.<Number>;

    private var var_1893: Number = 0;

    private var var_760: class_2116;

    public function class_2235() {
        super();
        this._data = Vector.<Number>([1, 255, 65025, 16581375, 0.00392156862745098, 0.00392156862745098, 0.00392156862745098, 0, 0, 0, 0, 0]);
    }

    public function get alphaThreshold(): Number {
        return this.var_1893;
    }

    public function set alphaThreshold(param1: Number): void {
        if (param1 < 0) {
            param1 = 0;
        } else if (param1 > 1) {
            param1 = 1;
        }
        if (param1 == this.var_1893) {
            return;
        }
        if (param1 == 0 || this.var_1893 == 0) {
            arcane::method_220();
        }
        this.var_1893 = param1;
        this._data[8] = this.var_1893;
    }

    public function get alphaMask(): class_2116 {
        return this.var_760;
    }

    public function set alphaMask(param1: class_2116): void {
        this.var_760 = param1;
    }

    override arcane function getVertexCode(): String {
        var _loc1_: * = null;
        _loc1_ = "m44 vt1, vt0, vc0\t\t\nmov op, vt1\t\n";
        if (this.var_1893 > 0) {
            var_1971 = 1;
            var_1671 = 2;
            _loc1_ += "mov v0, vt1\nmov v1, va1\n";
        } else {
            var_1971 = 0;
            var_1671 = 1;
            _loc1_ += "mov v0, vt1\n";
        }
        return _loc1_;
    }

    override arcane function getFragmentCode(param1: String): String {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: Boolean = false;
        var _loc2_: String = "div ft2, v0, v0.w\t\t\nmul ft0, fc0, ft2.z\t\nfrc ft0, ft0\t\t\t\nmul ft1, ft0.yzww, fc1\t\n";
        if (this.var_1893 > 0) {
            _loc3_ = !!_repeat ? "wrap" : "clamp";
            _loc6_ = Boolean(var_2370) && Boolean(this.var_760.method_5818);
            if (_smooth) {
                _loc4_ = _loc6_ ? "linear,miplinear" : "linear";
            } else {
                _loc4_ = _loc6_ ? "nearest,mipnearest" : "nearest";
            }
            switch (this.var_760.format) {
                case Context3DTextureFormat.COMPRESSED:
                    _loc5_ = "dxt1,";
                    break;
                case "compressedAlpha":
                    _loc5_ = "dxt5,";
                    break;
                default:
                    _loc5_ = "";
            }
            _loc2_ += "tex ft3, v1, fs0 <2d," + _loc4_ + "," + _loc5_ + _loc3_ + ">\n" + "sub ft3.w, ft3.w, fc2.x\n" + "kil ft3.w\n";
        }
        return _loc2_ + "sub oc, ft0, ft1\t\t\n";
    }

    override arcane function render(param1: class_2133, param2: class_1208, param3: class_1767, param4: Matrix3D): void {
        if (this.var_1893 > 0) {
            param1.method_2801(1, param2);
        }
        var _loc5_: Context3D = param2.arcane::var_4582;
        var _loc6_: Matrix3D;
        (_loc6_ = class_2125.const_1289).copyFrom(param1.method_846(param3));
        _loc6_.append(param4);
        _loc5_.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX, 0, _loc6_, true);
        param1.method_748(0, param2);
        _loc5_.drawTriangles(param1.method_612(param2), 0, param1.name_42);
    }

    override arcane function activate(param1: class_1208, param2: class_1767): void {
        var _loc3_: Context3D = param1.arcane::var_4582;
        super.arcane::activate(param1, param2);
        if (this.var_1893 > 0) {
            _loc3_.setTextureAt(0, this.var_760.method_6425(param1));
            _loc3_.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT, 0, this._data, 3);
        } else {
            _loc3_.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT, 0, this._data, 2);
        }
    }
}
}
