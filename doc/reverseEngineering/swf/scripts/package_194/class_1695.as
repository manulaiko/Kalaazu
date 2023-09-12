package package_194 {

import flash.geom.Point;
import flash.geom.Rectangle;

import package_120.Line;
import package_120.class_1195;
import package_120.class_1196;

import package_29.class_267;

public class class_1695 extends class_267 implements class_1196 {

    private static const const_2960: Rectangle = new Rectangle();


    private const const_464: Vector.<class_1195> = new Vector.<class_1195>();

    public function class_1695() {
        super();
    }

    public function hitTest(param1: Point, param2: Point): class_1195 {
        var _loc3_: class_1198 = owner as class_1198;
        var _loc4_: Boolean;
        if (_loc4_ = Boolean(this.contains(param1))) {
            return null;
        }
        this.const_464.length = 0;
        this.method_4871(param1, param2);
        if (_loc3_.name_149) {
            this.method_2760(param1, param2);
        }
        if (this.const_464.length) {
            this.const_464.sort(class_1195.compare);
            return this.const_464[0];
        }
        return null;
    }

    private function method_4871(param1: Point, param2: Point): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc3_: class_1198 = owner as class_1198;
        var _loc6_: int = int(_loc3_.x);
        var _loc7_: int = int(_loc3_.y);
        var _loc8_: int = int(_loc3_.width);
        var _loc9_: int = int(_loc3_.height);
        if ((_loc4_ = this.method_2075(param1.x, param1.y, param2.x, param2.y, _loc6_, _loc7_, _loc6_ + _loc8_, _loc7_)) != null) {
            (_loc5_ = class_1195.method_49(_loc4_, param1)).var_4622 = new Line(_loc6_, _loc7_, _loc6_ + _loc8_, _loc7_);
            this.const_464.push(_loc5_);
        }
        if ((_loc4_ = this.method_2075(param1.x, param1.y, param2.x, param2.y, _loc6_ + _loc8_, _loc7_, _loc6_ + _loc8_, _loc7_ + _loc9_)) != null) {
            (_loc5_ = class_1195.method_49(_loc4_, param1)).var_4622 = new Line(_loc6_ + _loc8_, _loc7_, _loc6_ + _loc8_, _loc7_ + _loc9_);
            this.const_464.push(_loc5_);
        }
        if ((_loc4_ = this.method_2075(param1.x, param1.y, param2.x, param2.y, _loc6_ + _loc8_, _loc7_ + _loc9_, _loc6_, _loc7_ + _loc9_)) != null) {
            (_loc5_ = class_1195.method_49(_loc4_, param1)).var_4622 = new Line(_loc6_ + _loc8_, _loc7_ + _loc9_, _loc6_, _loc7_ + _loc9_);
            this.const_464.push(_loc5_);
        }
        if ((_loc4_ = this.method_2075(param1.x, param1.y, param2.x, param2.y, _loc6_, _loc7_ + _loc9_, _loc6_, _loc7_)) != null) {
            (_loc5_ = class_1195.method_49(_loc4_, param1)).var_4622 = new Line(_loc6_, _loc7_ + _loc9_, _loc6_, _loc7_);
            this.const_464.push(_loc5_);
        }
    }

    private function method_2760(param1: Point, param2: Point): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc3_: class_1198 = owner as class_1198;
        var _loc6_: int = int(_loc3_.method_4219.value);
        var _loc7_: int = Number(_loc3_.x) - _loc6_;
        var _loc8_: int = Number(_loc3_.y) - _loc6_;
        var _loc9_: int = _loc3_.width + _loc6_ * 2;
        var _loc10_: int = _loc3_.height + _loc6_ * 2;
        if ((_loc4_ = this.method_2075(param1.x, param1.y, param2.x, param2.y, _loc7_, _loc8_, _loc7_ + _loc9_, _loc8_)) != null) {
            (_loc5_ = class_1195.method_49(_loc4_, param1)).var_4622 = new Line(_loc7_, _loc8_, _loc7_ + _loc9_, _loc8_);
            this.const_464.push(_loc5_);
        }
        if ((_loc4_ = this.method_2075(param1.x, param1.y, param2.x, param2.y, _loc7_ + _loc9_, _loc8_, _loc7_ + _loc9_, _loc8_ + _loc10_)) != null) {
            (_loc5_ = class_1195.method_49(_loc4_, param1)).var_4622 = new Line(_loc7_ + _loc9_, _loc8_, _loc7_ + _loc9_, _loc8_ + _loc10_);
            this.const_464.push(_loc5_);
        }
        if ((_loc4_ = this.method_2075(param1.x, param1.y, param2.x, param2.y, _loc7_ + _loc9_, _loc8_ + _loc10_, _loc7_, _loc8_ + _loc10_)) != null) {
            (_loc5_ = class_1195.method_49(_loc4_, param1)).var_4622 = new Line(_loc7_ + _loc9_, _loc8_ + _loc10_, _loc7_, _loc8_ + _loc10_);
            this.const_464.push(_loc5_);
        }
        if ((_loc4_ = this.method_2075(param1.x, param1.y, param2.x, param2.y, _loc7_, _loc8_ + _loc10_, _loc7_, _loc8_)) != null) {
            (_loc5_ = class_1195.method_49(_loc4_, param1)).var_4622 = new Line(_loc7_, _loc8_ + _loc10_, _loc7_, _loc8_);
            this.const_464.push(_loc5_);
        }
    }

    private function method_2075(param1: Number, param2: Number, param3: Number, param4: Number, param5: Number, param6: Number, param7: Number, param8: Number): Point {
        var _loc14_: Number = NaN;
        var _loc15_: Number = NaN;
        var _loc16_: Number = NaN;
        var _loc17_: Number = NaN;
        var _loc9_: Number = param3 - param1;
        var _loc10_: Number = param4 - param2;
        var _loc11_: Number = param7 - param5;
        var _loc12_: Number = param8 - param6;
        var _loc13_: Number;
        if ((_loc13_ = _loc9_ * _loc12_ - _loc10_ * _loc11_) == 0) {
            return null;
        }
        _loc14_ = param5 - param1;
        _loc15_ = param6 - param2;
        if ((_loc16_ = (_loc14_ * _loc12_ - _loc15_ * _loc11_) / _loc13_) < 0 || _loc16_ > 1) {
            return null;
        }
        if ((_loc17_ = (_loc14_ * _loc10_ - _loc15_ * _loc9_) / _loc13_) < 0 || _loc17_ > 1) {
            return null;
        }
        return new Point(param1 + _loc9_ * _loc16_, param2 + _loc10_ * _loc16_);
    }

    public function contains(param1: Point): Boolean {
        var _loc4_: int = 0;
        var _loc2_: class_1198 = owner as class_1198;
        const_2960.x = _loc2_.position.x;
        const_2960.y = _loc2_.position.y;
        const_2960.width = _loc2_.width;
        const_2960.height = _loc2_.height;
        var _loc3_: * = Boolean(const_2960.containsPoint(param1));
        if (_loc2_.name_149) {
            _loc3_ = !_loc3_;
            _loc4_ = int(_loc2_.method_4219.value);
            const_2960.x = Number(_loc2_.position.x) - _loc4_;
            const_2960.y = Number(_loc2_.position.y) - _loc4_;
            const_2960.width = _loc2_.width + _loc4_;
            const_2960.height = _loc2_.height + _loc4_;
            _loc3_ = _loc3_ && Boolean(const_2960.containsPoint(param1));
        }
        return _loc3_;
    }
}
}
