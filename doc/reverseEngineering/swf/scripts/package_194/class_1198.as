package package_194 {

import com.bigpoint.utils.class_73;

import flash.geom.Rectangle;

import package_120.class_431;

public class class_1198 extends class_431 {

    private static const const_555: int = 512;


    private var _width: Number;

    private var _height: Number;

    private var var_1691: Vector.<class_73>;

    public function class_1198(param1: int, param2: String, param3: Vector.<class_73>, param4: Boolean, param5: int) {
        var _loc10_: * = null;
        this.var_1691 = param3;
        var _loc6_: Number;
        var _loc7_: Number = _loc6_ = Number(param3[0].x);
        var _loc8_: Number;
        var _loc9_: Number = _loc8_ = Number(param3[0].y);
        var _loc11_: int = 1;
        while (_loc11_ < param3.length) {
            _loc10_ = param3[_loc11_];
            _loc6_ = Math.min(_loc6_, _loc10_.x);
            _loc7_ = Math.max(_loc7_, _loc10_.x);
            _loc8_ = Math.min(_loc8_, _loc10_.y);
            _loc9_ = Math.max(_loc9_, _loc10_.y);
            _loc11_++;
        }
        this._width = Math.abs(_loc6_ - _loc7_);
        this._height = Math.abs(_loc8_ - _loc9_);
        super(param1, new class_73(_loc6_, _loc8_), param2, param4, param5, new Rectangle(_loc6_, _loc8_, this._width, this._height));
        if (param5 > 0) {
            addTrait(new class_1697());
        }
        if (param2 == class_431.const_2513 || param2 == class_431.const_941) {
            if (param4) {
                method_4219.value = const_555;
            }
            addTrait(new class_1695());
        }
        if (method_5472()) {
            addTrait(new class_1696());
        }
    }

    public function get width(): Number {
        return this._width;
    }

    public function get height(): Number {
        return this._height;
    }

    public function get points(): Vector.<class_73> {
        return this.var_1691;
    }
}
}
