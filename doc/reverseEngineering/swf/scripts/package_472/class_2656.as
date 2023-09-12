package package_472 {

import away3d.arcane;

import flash.geom.Matrix3D;
import flash.geom.Vector3D;
import flash.utils.Dictionary;

import package_294.class_1750;
import package_294.class_2425;
import package_294.class_2427;
import package_294.class_2429;
import package_294.class_2602;

import package_295.class_1752;

import package_304.class_2114;

import package_307.class_1772;

import package_434.class_2450;
import package_434.class_2711;

import package_441.class_2430;

import package_442.class_2444;
import package_442.class_2447;

public class class_2656 {

    private static const const_1341: uint = 196605;


    public function class_2656() {
        super();
    }

    public static function method_1300(param1: class_2114): Number {
        var var_3373: Number = NaN;
        var var_3418: class_2114 = param1;
        try {
            var_3373 = Math.max((Number(var_3418.method_976) - Number(var_3418.method_2548)) * Number(class_1750(var_3418).scaleX), (Number(var_3418.method_4138) - Number(var_3418.method_5180)) * Number(class_1750(var_3418).scaleY), (Number(var_3418.method_2429) - Number(var_3418.method_329)) * Number(class_1750(var_3418).scaleZ));
        } catch (e: Error) {
            class_2711.method_5356(var_3418);
            var_3373 = Math.max((0 - 0) * Number(class_1750(var_3418).scaleX), (0 - 0) * Number(class_1750(var_3418).scaleY), (0 - 0) * Number(class_1750(var_3418).scaleZ));
        }
        return var_3373 * 0.5;
    }

    public static function method_1098(param1: class_1752): Number {
        class_2711.method_5245(param1);
        var _loc2_: Number = Math.max((0 - 0) * Number(class_1750(param1).scaleX), (0 - 0) * Number(class_1750(param1).scaleY), (0 - 0) * Number(class_1750(param1).scaleZ));
        return _loc2_ * 0.5;
    }

    public static function method_3303(param1: class_2114, param2: Boolean = true): void {
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        class_2711.method_5356(param1);
        var _loc3_: Number = NaN;
        _loc4_ = NaN;
        _loc5_ = NaN;
        method_1468(param1, -_loc3_, -_loc4_, -_loc5_);
        if (!param2) {
            param1.x -= _loc3_;
            param1.y -= _loc4_;
            param1.z -= _loc5_;
        }
    }

    public static function method_4599(param1: class_1752, param2: Boolean = true): void {
        var _loc3_: * = null;
        if (param1 is class_2114 && class_1752(param1).numChildren == 0) {
            method_3303(class_2114(param1), param2);
        }
        var _loc4_: Number = 0;
        while (_loc4_ < class_1752(param1).numChildren) {
            _loc3_ = class_1752(param1).getChildAt(_loc4_);
            method_4599(_loc3_, param2);
            _loc4_++;
        }
    }

    public static function method_5615(param1: class_2114): void {
        var _loc2_: Number = 0;
        var _loc3_: Number = 0;
        var _loc4_: * = 0;
        var _loc5_: * = 0;
        var _loc6_: * = 0;
        var _loc7_: * = 0;
        var _loc8_: * = 0;
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc14_: * = null;
        var _loc10_: Vector.<class_2425>;
        var _loc9_: class_2429;
        var _loc13_: uint = (_loc10_ = (_loc9_ = param1.geometry).subGeometries).length;
        var _loc15_: Matrix3D;
        (_loc15_ = param1.transform.clone()).appendScale(1 / Number(param1.scaleX), 1 / Number(param1.scaleY), 1 / Number(param1.scaleZ));
        var _loc16_: Vector3D = new Vector3D();
        _loc2_ = 0;
        while (_loc2_ < _loc13_) {
            _loc11_ = (_loc14_ = class_2425(_loc10_[_loc2_])).name_104;
            _loc6_ = uint(_loc14_.method_720);
            _loc5_ = uint(_loc14_.method_4110);
            _loc12_ = _loc14_.method_4313;
            _loc8_ = uint(_loc14_.method_4530);
            _loc7_ = uint(_loc14_.method_4163);
            _loc4_ = uint(_loc14_.numVertices);
            _loc3_ = 0;
            while (_loc3_ < _loc4_) {
                _loc16_.x = _loc11_[_loc6_ + _loc3_ * _loc5_ + 0];
                _loc16_.y = _loc11_[_loc6_ + _loc3_ * _loc5_ + 1];
                _loc16_.z = _loc11_[_loc6_ + _loc3_ * _loc5_ + 2];
                _loc16_ = _loc15_.deltaTransformVector(_loc16_);
                _loc11_[_loc6_ + _loc3_ * _loc5_ + 0] = _loc16_.x;
                _loc11_[_loc6_ + _loc3_ * _loc5_ + 1] = _loc16_.y;
                _loc11_[_loc6_ + _loc3_ * _loc5_ + 2] = _loc16_.z;
                _loc16_.x = _loc12_[_loc8_ + _loc3_ * _loc7_ + 0];
                _loc16_.y = _loc12_[_loc8_ + _loc3_ * _loc7_ + 1];
                _loc16_.z = _loc12_[_loc8_ + _loc3_ * _loc7_ + 2];
                (_loc16_ = _loc15_.deltaTransformVector(_loc16_)).normalize();
                _loc12_[_loc8_ + _loc3_ * _loc7_ + 0] = _loc16_.x;
                _loc12_[_loc8_ + _loc3_ * _loc7_ + 1] = _loc16_.y;
                _loc12_[_loc8_ + _loc3_ * _loc7_ + 2] = _loc16_.z;
                _loc3_++;
            }
            if (_loc14_ is class_2602) {
                class_2602(_loc14_).updateData(_loc11_);
            } else {
                class_2427(_loc14_).updateVertexData(_loc11_);
                class_2427(_loc14_).updateVertexNormalData(_loc12_);
            }
            _loc2_++;
        }
        param1.rotationX = param1.rotationY = param1.rotationZ = 0;
    }

    public static function method_6325(param1: class_1752): void {
        var _loc2_: * = null;
        if (param1 is class_2114 && class_1752(param1).numChildren == 0) {
            method_5615(class_2114(param1));
        }
        var _loc3_: Number = 0;
        while (_loc3_ < class_1752(param1).numChildren) {
            _loc2_ = class_1752(param1).getChildAt(_loc3_);
            method_6325(_loc2_);
            _loc3_++;
        }
    }

    public static function method_2084(param1: class_2114, param2: Number, param3: Number, param4: Number, param5: class_1752 = null): void {
        var _loc6_: Number = 0;
        var _loc7_: Number = 0;
        var _loc8_: * = 0;
        var _loc9_: * = 0;
        var _loc10_: * = 0;
        var _loc13_: * = null;
        var _loc15_: * = null;
        if (param2 == 1 && param3 == 1 && param4 == 1) {
            return;
        }
        if (param1.animator) {
            param1.scaleX = param2;
            param1.scaleY = param3;
            param1.scaleZ = param4;
            return;
        }
        var _loc12_: Vector.<class_2425>;
        var _loc11_: class_2429;
        var _loc14_: uint = (_loc12_ = (_loc11_ = param1.geometry).subGeometries).length;
        _loc6_ = 0;
        while (_loc6_ < _loc14_) {
            _loc10_ = uint((_loc15_ = class_2425(_loc12_[_loc6_])).method_720);
            _loc9_ = uint(_loc15_.method_4110);
            _loc13_ = _loc15_.name_104;
            _loc8_ = uint(_loc15_.numVertices);
            _loc7_ = 0;
            while (_loc7_ < _loc8_) {
                _loc13_[_loc10_ + _loc7_ * _loc9_ + 0] *= param2;
                _loc13_[_loc10_ + _loc7_ * _loc9_ + 1] *= param3;
                _loc13_[_loc10_ + _loc7_ * _loc9_ + 2] *= param4;
                _loc7_++;
            }
            if (_loc15_ is class_2602) {
                class_2602(_loc15_).updateData(_loc13_);
            } else {
                class_2427(_loc15_).updateVertexData(_loc13_);
            }
            _loc6_++;
        }
        param1.scaleX = param1.scaleY = param1.scaleZ = 1;
        if (param5) {
            param1.x *= param2;
            param1.y *= param3;
            param1.z *= param4;
        }
    }

    public static function method_44(param1: class_1752, param2: Number, param3: Number, param4: Number, param5: class_1752 = null): void {
        var _loc6_: * = null;
        param5 = param5;
        if (param1 is class_2114 && class_1752(param1).numChildren == 0) {
            method_2084(class_2114(param1), param2, param3, param4, param1);
        }
        var _loc7_: Number = 0;
        while (_loc7_ < class_1752(param1).numChildren) {
            _loc6_ = class_1752(param1).getChildAt(_loc7_);
            method_44(_loc6_, param2, param3, param4, param1);
            _loc7_++;
        }
    }

    public static function method_1468(param1: class_2114, param2: Number, param3: Number, param4: Number): void {
        var _loc5_: Number = 0;
        var _loc6_: Number = 0;
        var _loc7_: * = 0;
        var _loc8_: * = 0;
        var _loc9_: * = 0;
        var _loc12_: * = null;
        var _loc14_: * = null;
        var _loc11_: Vector.<class_2425>;
        var _loc10_: class_2429;
        var _loc13_: uint = (_loc11_ = (_loc10_ = param1.geometry).subGeometries).length;
        _loc5_ = 0;
        while (_loc5_ < _loc13_) {
            _loc9_ = uint((_loc14_ = class_2425(_loc11_[_loc5_])).method_720);
            _loc8_ = uint(_loc14_.method_4110);
            _loc12_ = _loc14_.name_104;
            _loc7_ = uint(_loc14_.numVertices);
            _loc6_ = 0;
            while (_loc6_ < _loc7_) {
                _loc12_[_loc9_ + _loc6_ * _loc8_ + 0] += param2;
                _loc12_[_loc9_ + _loc6_ * _loc8_ + 1] += param3;
                _loc12_[_loc9_ + _loc6_ * _loc8_ + 2] += param4;
                _loc6_++;
            }
            if (_loc14_ is class_2602) {
                class_2602(_loc14_).updateData(_loc12_);
            } else {
                class_2427(_loc14_).updateVertexData(_loc12_);
            }
            _loc5_++;
        }
        param1.x -= param2;
        param1.y -= param3;
        param1.z -= param4;
    }

    public static function clone(param1: class_2114, param2: String = ""): class_2114 {
        var _loc3_: class_2429 = param1.geometry.clone();
        var _loc4_: class_2114;
        (_loc4_ = new class_2114(_loc3_, param1.material)).name = param2;
        return _loc4_;
    }

    public static function method_3215(param1: class_1752): void {
        var _loc2_: * = null;
        if (param1 is class_2114 && class_1752(param1).numChildren == 0) {
            method_4395(class_2114(param1));
        }
        var _loc3_: Number = 0;
        while (_loc3_ < class_1752(param1).numChildren) {
            _loc2_ = class_1752(param1).getChildAt(_loc3_);
            method_3215(_loc2_);
            _loc3_++;
        }
    }

    public static function method_4395(param1: class_2114, param2: Boolean = false): void {
        var _loc3_: * = 0;
        var _loc4_: Number = 0;
        var _loc5_: * = 0;
        var _loc6_: * = 0;
        var _loc7_: * = 0;
        var _loc8_: * = 0;
        var _loc9_: * = 0;
        var _loc10_: * = 0;
        var _loc11_: * = 0;
        var _loc14_: * = null;
        var _loc15_: * = null;
        var _loc16_: * = null;
        var _loc17_: * = null;
        var _loc18_: * = null;
        var _loc20_: * = null;
        var _loc13_: Vector.<class_2425>;
        var _loc12_: class_2429;
        var _loc19_: uint = (_loc13_ = (_loc12_ = param1.geometry).subGeometries).length;
        _loc3_ = 0;
        while (_loc3_ < _loc19_) {
            _loc14_ = (_loc20_ = class_2425(_loc13_[_loc3_])).indexData;
            _loc15_ = _loc20_.indexData.concat();
            _loc16_ = _loc20_.method_4313;
            _loc9_ = uint(_loc20_.method_4530);
            _loc8_ = uint(_loc20_.method_4163);
            _loc18_ = _loc20_.method_868;
            _loc11_ = uint(_loc20_.method_2585);
            _loc10_ = uint(_loc20_.method_2639);
            _loc5_ = uint(_loc20_.numVertices);
            _loc17_ = _loc20_.method_303;
            _loc7_ = uint(_loc20_.method_4538);
            _loc6_ = uint(_loc20_.method_2683);
            _loc3_ = 0;
            while (_loc3_ < _loc14_.length) {
                _loc14_[_loc3_ + 0] = _loc15_[_loc3_ + 2];
                _loc14_[_loc3_ + 1] = _loc15_[_loc3_ + 1];
                _loc14_[_loc3_ + 2] = _loc15_[_loc3_ + 0];
                _loc3_ += 3;
            }
            _loc4_ = 0;
            while (_loc4_ < _loc5_) {
                _loc16_[_loc9_ + _loc4_ * _loc8_ + 0] *= -1;
                _loc16_[_loc9_ + _loc4_ * _loc8_ + 1] *= -1;
                _loc16_[_loc9_ + _loc4_ * _loc8_ + 2] *= -1;
                _loc17_[_loc7_ + _loc4_ * _loc6_ + 0] *= -1;
                _loc17_[_loc7_ + _loc4_ * _loc6_ + 1] *= -1;
                _loc17_[_loc7_ + _loc4_ * _loc6_ + 2] *= -1;
                if (param2) {
                    _loc18_[_loc11_ + _loc4_ * _loc10_ + 0] = 1 - _loc18_[_loc11_ + _loc4_ * _loc10_ + 0];
                }
                _loc4_++;
            }
            if (_loc20_ is class_2602) {
                class_2602(_loc20_).updateData(_loc20_.name_104);
            } else {
                class_2427(_loc20_).updateIndexData(_loc14_);
                class_2427(_loc20_).updateVertexNormalData(_loc16_);
                class_2427(_loc20_).updateVertexTangentData(_loc17_);
                class_2427(_loc20_).updateUVData(_loc18_);
            }
            _loc3_++;
        }
    }

    public static function build(param1: Vector.<Number>, param2: Vector.<uint>, param3: Vector.<Number> = null, param4: String = "", param5: class_1772 = null, param6: Boolean = true, param7: Boolean = true, param8: Boolean = true): class_2114 {
        var _loc9_: Number = 0;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc13_: * = null;
        var _loc14_: * = null;
        var _loc15_: * = null;
        var _loc16_: * = null;
        var _loc17_: * = null;
        var _loc18_: * = 0;
        var _loc19_: * = 0;
        var _loc20_: * = 0;
        var _loc21_: * = 0;
        var _loc22_: * = null;
        var _loc23_: * = null;
        var _loc24_: * = null;
        var _loc25_: * = null;
        if (param8) {
            _loc10_ = class_2450.method_5600(param1, param2, param3, null, null, null, null);
            _loc11_ = new class_2429();
            _loc9_ = 0;
            while (_loc9_ < _loc10_.length) {
                _loc10_[_loc9_].method_251 = true;
                _loc10_[_loc9_].method_5188 = true;
                _loc11_.method_1586(_loc10_[_loc9_]);
                _loc9_++;
            }
            param5 = !param5 ? class_2430.method_782() : param5;
            _loc12_ = new class_2114(_loc11_, param5);
            if (param4 != "") {
                _loc12_.name = param4;
            }
            return _loc12_;
        }
        (_loc13_ = new class_2427()).method_251 = true;
        _loc13_.method_5188 = true;
        (_loc11_ = new class_2429()).method_1586(_loc13_);
        param5 = !param5 && param7 ? class_2430.method_782() : param5;
        _loc12_ = new class_2114(_loc11_, param5);
        if (param4 != "") {
            _loc12_.name = param4;
        }
        _loc14_ = new Vector.<Number>();
        _loc15_ = new Vector.<Number>();
        _loc16_ = new Vector.<uint>();
        _loc17_ = Vector.<Number>([0, 1, 0.5, 0, 1, 1, 0.5, 0]);
        _loc18_ = 0;
        if (param6) {
            _loc23_ = new Dictionary();
            _loc24_ = new class_2444();
        }
        _loc22_ = new class_2447();
        _loc9_ = 0;
        for (; _loc9_ < param2.length; _loc9_++) {
            _loc21_ = param2[_loc9_] * 3;
            _loc22_.x = param1[_loc21_];
            _loc22_.y = param1[_loc21_ + 1];
            _loc22_.z = param1[_loc21_ + 2];
            if (_loc14_.length == const_1341) {
                _loc13_.updateVertexData(_loc14_);
                _loc13_.updateIndexData(_loc16_);
                _loc13_.updateUVData(_loc15_);
                if (param6) {
                    _loc23_ = null;
                    _loc23_ = new Dictionary();
                }
                (_loc13_ = new class_2427()).method_251 = true;
                _loc13_.method_5188 = true;
                _loc11_.method_1586(_loc13_);
                _loc18_ = 0;
                _loc14_ = new Vector.<Number>();
                _loc16_ = new Vector.<uint>();
                _loc15_ = new Vector.<Number>();
            }
            _loc20_ = _loc14_.length / 3;
            _loc19_ = param2[_loc9_] * 2;
            if (param6) {
                _loc24_.u = param3[_loc19_];
                _loc24_.v = param3[_loc19_ + 1];
                _loc25_ = _loc22_.toString() + _loc24_.toString();
                if (_loc23_[_loc25_]) {
                    _loc16_[_loc16_.length] = _loc23_[_loc25_];
                    continue;
                }
                _loc23_[_loc25_] = _loc20_;
            }
            _loc16_[_loc16_.length] = _loc20_;
            _loc14_.push(_loc22_.x, _loc22_.y, _loc22_.z);
            if (!param3 || _loc19_ > param3.length - 2) {
                _loc15_.push(_loc17_[_loc18_], _loc17_[_loc18_ + 1]);
                var _loc26_: *;
                _loc18_ = _loc18_ + 2 > 3 ? 0 : (_loc26_ = _loc18_ + 2, _loc18_ += 2, _loc26_);
            } else {
                _loc15_.push(param3[_loc19_], param3[_loc19_ + 1]);
            }
        }
        if (param6) {
            _loc23_ = null;
        }
        _loc13_.updateVertexData(_loc14_);
        _loc13_.updateIndexData(_loc16_);
        _loc13_.updateUVData(_loc15_);
        return _loc12_;
    }

    public static function method_3862(param1: class_2114, param2: Boolean = false): Vector.<class_2114> {
        var var_1: uint;
        var var_197: Vector.<Number> = null;
        var var_4658: Vector.<uint> = null;
        var var_1051: Vector.<Number> = null;
        var var_2038: Vector.<Number> = null;
        var var_2724: Vector.<Number> = null;
        var var_2680: class_2425 = null;
        var var_501: class_2429 = null;
        var var_4468: class_2427 = null;
        var var_3855: class_2114 = null;
        var var_2474: class_1772 = null;
        var var_2: uint = 0;
        var var_3418: class_2114 = param1;
        var var_13: Boolean = param2;
        var var_507: Vector.<class_2114> = new Vector.<class_2114>();
        var var_1295: Vector.<class_2425> = var_3418.geometry.subGeometries;
        var var_1774: uint = var_1295.length;
        if (var_1774 == 1) {
            var_507.push(var_3418);
            return var_507;
        }
        if (var_1295[0] is class_2602) {
            return method_2981(var_3418, var_13);
        }
        var_2 = 0;
        var_1 = 0;
        while (var_1 < var_1774) {
            if (var_1295[0] is class_2427) {
                var_2680 = class_2427(var_1295[var_1]);
            }
            var_197 = var_2680.name_104;
            var_4658 = var_2680.indexData;
            var_1051 = var_2680.method_868;
            try {
                var_2038 = var_2680.method_4313;
                var_2680.method_251 = false;
            } catch (e: Error) {
                var_2680.method_251 = true;
                var_2038 = new Vector.<Number>();
                var_2 = 0;
                while (var_2 < var_197.length) {
                    var _loc5_: *;
                    var_2038[_loc5_ = var_2++] = 0;
                }
            }
            try {
                var_2724 = var_2680.method_303;
                var_2680.method_5188 = false;
            } catch (e: Error) {
                var_2680.method_5188 = true;
                var_2724 = new Vector.<Number>();
                var_2 = 0;
                while (var_2 < var_197.length) {
                    var_2724[_loc5_ = var_2++] = 0;
                }
            }
            var_197.fixed = false;
            var_4658.fixed = false;
            var_1051.fixed = false;
            var_2038.fixed = false;
            var_2724.fixed = false;
            var_501 = new class_2429();
            var_3855 = new class_2114(var_501, !!var_3418.method_3381[var_1].material ? var_3418.method_3381[var_1].material : var_2474);
            var_4468 = new class_2427();
            var_4468.updateVertexData(var_197);
            var_4468.updateIndexData(var_4658);
            var_4468.updateUVData(var_1051);
            var_4468.updateVertexNormalData(var_2038);
            var_4468.updateVertexTangentData(var_2724);
            var_501.method_1586(var_4468);
            var_507.push(var_3855);
            var_1++;
        }
        if (var_13) {
            var_3418 = null;
        }
        return var_507;
    }

    private static function method_2981(param1: class_2114, param2: Boolean = false): Vector.<class_2114> {
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc3_: Vector.<class_2114> = new Vector.<class_2114>();
        var _loc5_: uint;
        var _loc4_: Vector.<class_2425>;
        if ((_loc5_ = (_loc4_ = param1.geometry.subGeometries).length) == 1) {
            _loc3_.push(param1);
            return _loc3_;
        }
        var _loc11_: Number = 0;
        while (_loc11_ < _loc5_) {
            _loc6_ = class_2602(_loc4_[_loc11_]);
            _loc7_ = new class_2429();
            _loc9_ = new class_2114(_loc7_, !!param1.method_3381[_loc11_].material ? param1.method_3381[_loc11_].material : null);
            (_loc8_ = new class_2602()).updateData(_loc6_.name_104);
            _loc8_.updateIndexData(_loc6_.indexData);
            _loc7_.method_1586(_loc8_);
            _loc3_.push(_loc9_);
            _loc11_++;
        }
        if (param2) {
            param1 = null;
        }
        return _loc3_;
    }
}
}
