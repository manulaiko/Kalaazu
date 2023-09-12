package package_464 {

import package_437.class_2592;

import package_438.class_2421;

import package_466.class_2595;
import package_466.class_2598;

public class ParticleTimeNodeSubParser extends class_2593 {


    public var usesDuration: Boolean;

    public var usesLooping: Boolean;

    public var usesDelay: Boolean;

    private var var_14: class_2421;

    private var var_1538: class_2421;

    private var var_2107: class_2421;

    public function ParticleTimeNodeSubParser() {
        super();
    }

    public static function get identifier(): * {
        return class_2598.ParticleTimeNodeSubParser;
    }

    private function method_4974(): void {
        _setters.push(this.var_14.setter);
        if (this.usesDuration) {
            _setters.push(this.var_1538.setter);
        }
        if (this.usesDelay) {
            _setters.push(this.var_2107.setter);
        }
    }

    override protected function method_196(): Boolean {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (var_117) {
            this.usesLooping = _data.usesLooping;
            this.usesDuration = _data.usesDuration;
            this.usesDelay = _data.usesDelay;
            _loc1_ = _data.startTime;
            _loc2_ = _loc1_.id;
            _loc3_ = _loc1_.data;
            if (!(_loc4_ = class_2592.method_6525(_loc2_, class_2595.const_2681))) {
                method_444("Unknown value");
            }
            this.var_14 = new _loc4_("startTime");
            method_4558(this.var_14);
            this.var_14.method_5169(_loc3_);
            if (this.usesDuration) {
                _loc1_ = _data.duration;
                _loc2_ = _loc1_.id;
                _loc3_ = _loc1_.data;
                if (!(_loc4_ = class_2592.method_6525(_loc2_, class_2595.const_2681))) {
                    method_444("Unknown value");
                }
                this.var_1538 = new _loc4_("duration");
                method_4558(this.var_1538);
                this.var_1538.method_5169(_loc3_);
            }
            if (this.usesDelay) {
                _loc1_ = _data.delay;
                _loc2_ = _loc1_.id;
                _loc3_ = _loc1_.data;
                if (!(_loc4_ = class_2592.method_6525(_loc2_, class_2595.const_2681))) {
                    method_444("Unknown value");
                }
                this.var_2107 = new _loc4_("delay");
                method_4558(this.var_2107);
                this.var_2107.method_5169(_loc3_);
            }
        }
        if (super.method_196() == const_2361) {
            this.method_4974();
            return const_2361;
        }
        return const_2971;
    }
}
}
