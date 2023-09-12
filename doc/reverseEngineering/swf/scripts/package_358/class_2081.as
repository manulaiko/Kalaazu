package package_358 {

import flash.display.BitmapData;
import flash.geom.Matrix;

import package_120.class_2010;
import package_120.class_431;

import package_193.class_1197;
import package_193.class_1692;

public class class_2081 extends class_2080 {


    public function class_2081(param1: class_1692) {
        super(param1.owner as class_431);
        class_1197(method_1818).radius.changed.add(redraw);
        redraw();
    }

    override protected function method_224(param1: uint, param2: BitmapData, param3: Boolean): void {
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: * = null;
        var _loc9_: * = 0;
        var _loc10_: Number = NaN;
        x = method_1818.position.x;
        y = method_1818.position.y;
        graphics.clear();
        var _loc4_: class_1197;
        var _loc5_: int = int((_loc4_ = method_1818 as class_1197).radius.value);
        if (param1 == class_2010.const_1607) {
            _loc6_ = 1;
            _loc7_ = 1;
            if (!param3) {
                _loc6_ = _loc5_ * 2 / param2.width;
                _loc7_ = _loc5_ * 2 / param2.height;
            }
            (_loc8_ = new Matrix()).scale(_loc6_, _loc7_);
            _loc8_.translate(-_loc5_, -_loc5_);
            graphics.beginBitmapFill(param2, _loc8_, param3);
        } else {
            graphics.lineStyle(class_2010.method_3772(method_1818), class_2010.method_4696(method_1818));
            _loc9_ = uint(class_2010.method_1388(method_1818));
            _loc10_ = Number(class_2010.method_5228(method_1818));
            graphics.beginFill(_loc9_, _loc10_);
        }
        if (false) {
            graphics.drawCircle(0, 0, _loc5_ + _loc4_.method_4219.value);
        }
        graphics.drawCircle(0, 0, _loc5_);
        graphics.endFill();
    }
}
}
