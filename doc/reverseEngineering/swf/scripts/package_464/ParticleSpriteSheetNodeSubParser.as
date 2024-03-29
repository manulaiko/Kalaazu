package package_464 {

import flash.geom.Vector3D;

import package_386.class_2578;

import package_431.class_2719;

import package_437.class_2592;

import package_438.class_2421;

import package_466.class_2595;
import package_466.class_2598;

public class ParticleSpriteSheetNodeSubParser extends class_2593 {


    private var var_1538: class_2421;

    private var _numColumns: int;

    private var var_2462: int;

    private var var_1494: int;

    private var var_219: Boolean;

    private var var_81: Boolean;

    public function ParticleSpriteSheetNodeSubParser() {
        super();
    }

    public static function get identifier(): * {
        return class_2598.ParticleSpriteSheetNodeSubParser;
    }

    override protected function method_196(): Boolean {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (var_117) {
            this._numColumns = _data.numColumns;
            this.var_2462 = _data.numRows;
            this.var_1494 = _data.total;
            this.var_219 = _data.usesCycle;
            this.var_81 = _data.usesPhase;
            _loc1_ = _data.scale;
            _loc2_ = _loc1_.id;
            _loc3_ = _loc1_.data;
            if (!(_loc4_ = class_2592.method_6525(_loc2_, class_2595.const_3006))) {
                method_444("Unknown value");
            }
            this.var_1538 = new _loc4_(class_2719.const_2470);
            method_4558(this.var_1538);
            this.var_1538.method_5169(_loc3_);
        }
        if (super.method_196() == const_2361) {
            this.method_184();
            return const_2361;
        }
        return const_2971;
    }

    private function method_184(): void {
        var _loc1_: * = null;
        if (this.var_1494 == 0) {
            this.var_1494 = int.MAX_VALUE;
        }
        if (this.var_1538.method_5046 == class_2421.const_376) {
            _loc1_ = this.var_1538.setter.generateOneValue();
            var_4806 = new class_2719(class_2578.name_100, this.var_219, this.var_81, this._numColumns, this.var_2462, _loc1_.x, _loc1_.y, this.var_1494);
        } else {
            var_4806 = new class_2719(class_2578.name_24, this.var_219, this.var_81, this._numColumns, this.var_2462, 1, 0, this.var_1494);
            _setters.push(this.var_1538.setter);
        }
    }
}
}
