package package_464 {

import package_386.class_2578;

import package_431.class_2727;

import package_437.class_2592;

import package_438.class_2421;

import package_466.class_2595;
import package_466.class_2598;

public class ParticleUVNodeSubParser extends class_2593 {


    private var var_1130: class_2421;

    private var var_1901: class_2421;

    private var var_613: String;

    private var var_1003: int;

    public function ParticleUVNodeSubParser() {
        super();
    }

    public static function get identifier(): * {
        return class_2598.ParticleUVNodeSubParser;
    }

    override protected function method_196(): Boolean {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (var_117) {
            _loc1_ = _data.cycle;
            _loc2_ = _loc1_.id;
            _loc3_ = _loc1_.data;
            if (!(_loc4_ = class_2592.method_6525(_loc2_, class_2595.const_2681))) {
                method_444("Unknown value");
            }
            this.var_1130 = new _loc4_(class_2727.const_1313);
            method_4558(this.var_1130);
            this.var_1130.method_5169(_loc3_);
            _loc1_ = _data.scale;
            if (_loc1_) {
                _loc2_ = _loc1_.id;
                _loc3_ = _loc1_.data;
                if (!(_loc4_ = class_2592.method_6525(_loc2_, class_2595.const_2681))) {
                    method_444("Unknown value");
                }
                this.var_1901 = new _loc4_(class_2727.const_1575);
                method_4558(this.var_1901);
                this.var_1901.method_5169(_loc3_);
            }
            this.var_613 = _data.axis;
            this.var_1003 = _data.formula;
        }
        if (super.method_196() == const_2361) {
            this.method_184();
            return const_2361;
        }
        return const_2971;
    }

    private function method_184(): void {
        if (this.var_1130.method_5046 == class_2421.const_376) {
            if (!this.var_1901) {
                var_4806 = new class_2727(class_2578.name_100, this.var_1130.setter.generateOneValue(), 1, this.var_613, this.var_1003);
            } else if (this.var_1901.method_5046 == class_2421.const_376) {
                var_4806 = new class_2727(class_2578.name_100, this.var_1130.setter.generateOneValue(), this.var_1901.setter.generateOneValue(), this.var_613, this.var_1003);
            } else {
                var_4806 = new class_2727(class_2578.name_24, this.var_1130.setter.generateOneValue(), 2, this.var_613, this.var_1003);
                _setters.push(this.var_1130.setter);
                _setters.push(this.var_1901.setter);
            }
        } else {
            _setters.push(this.var_1130.setter);
            if (!this.var_1901) {
                var_4806 = new class_2727(class_2578.name_24, this.var_1130.setter.generateOneValue(), 1, this.var_613, this.var_1003);
            } else if (this.var_1901.method_5046 == class_2421.const_376) {
                var_4806 = new class_2727(class_2578.name_24, this.var_1130.setter.generateOneValue(), this.var_1901.setter.generateOneValue(), this.var_613, this.var_1003);
            } else {
                var_4806 = new class_2727(class_2578.name_24, this.var_1130.setter.generateOneValue(), 2, this.var_613, this.var_1003);
                _setters.push(this.var_1901.setter);
            }
        }
    }
}
}
