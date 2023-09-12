package package_302 {

import package_120.class_431;

import package_194.class_1198;
import package_194.class_1697;

import package_295.class_1752;

import package_304.class_2114;

import package_307.class_1772;

import package_436.PlaneGeometry;

public class class_2137 extends class_2136 {

    private static const const_674: int = 40;

    public static var test: Number = 0;


    private var var_394: class_1198;

    public function class_2137(param1: class_1697) {
        this.var_394 = param1.owner as class_1198;
        super(param1.owner as class_431);
    }

    override protected function method_224(param1: class_1772): void {
        while (this.numChildren > 0) {
            removeChildAt(0);
        }
        this.update(param1);
    }

    private function update(param1: class_1772): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc10_: * = null;
        var _loc2_: PlaneGeometry = new PlaneGeometry(1, 1);
        if (this.var_394.name_149) {
            _loc3_ = new class_2114(_loc2_, param1);
            _loc4_ = new class_2114(_loc2_, param1);
            _loc5_ = new class_2114(_loc2_, param1);
            _loc6_ = new class_2114(_loc2_, param1);
            (_loc7_ = new class_1752()).method_3447(_loc4_, _loc3_, _loc5_, _loc6_);
            _loc8_ = Number(this.var_394.method_4219.value);
            _loc9_ = Number(this.var_394.method_4219.value);
            _loc4_.scaleX = this.var_394.width;
            _loc4_.scaleZ = _loc8_;
            _loc4_.z -= Number(this.var_394.height) / 2 + _loc8_ / 2;
            _loc3_.scaleX = this.var_394.width;
            _loc3_.scaleZ = _loc8_;
            _loc3_.z += Number(this.var_394.height) / 2 + _loc8_ / 2;
            _loc5_.scaleX = _loc9_;
            _loc5_.scaleZ = this.var_394.height + _loc8_ * 2;
            _loc5_.x += Number(this.var_394.width) / 2 + _loc8_ / 2;
            _loc6_.scaleX = _loc9_;
            _loc6_.scaleZ = this.var_394.height + _loc8_ * 2;
            _loc6_.x -= Number(this.var_394.width) / 2 + _loc8_ / 2;
            x = this.var_394.method_1474 + Number(this.var_394.width) / 2;
            y = this.var_394.method_1121;
            z = Number(this.var_394.method_6123) - Number(this.var_394.height) / 2;
            this.addChild(_loc7_);
        } else {
            _loc10_ = new class_2114(_loc2_, param1);
            x = this.var_394.method_1474 + Number(this.var_394.width) / 2;
            y = this.var_394.method_1121;
            z = Number(this.var_394.method_6123) - Number(this.var_394.height) / 2;
            _loc10_.scaleX = this.var_394.width;
            _loc10_.scaleZ = this.var_394.height;
            this.addChild(_loc10_);
        }
    }
}
}
