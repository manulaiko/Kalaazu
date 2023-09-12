package package_464 {

import flash.geom.Vector3D;

import package_386.class_2578;

import package_431.class_2741;

import package_437.class_2592;

import package_438.class_2421;

import package_466.class_2595;
import package_466.class_2598;

import package_468.ThreeDConstValueSubParser;

public class ParticleOrbitNodeSubParser extends class_2593 {


    private var var_2658: class_2421;

    private var var_219: Boolean;

    private var var_81: Boolean;

    private var var_2244: Boolean;

    private var var_3918: ThreeDConstValueSubParser;

    public function ParticleOrbitNodeSubParser() {
        super();
    }

    public static function get identifier(): * {
        return class_2598.ParticleOrbitNodeSubParser;
    }

    override protected function method_196(): Boolean {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (var_117) {
            this.var_219 = _data.usesCycle;
            this.var_81 = _data.usesPhase;
            _loc1_ = _data.orbit;
            _loc2_ = _loc1_.id;
            _loc3_ = _loc1_.data;
            if (!(_loc4_ = class_2592.method_6525(_loc2_, class_2595.const_3006))) {
                method_444("Unknown value");
            }
            this.var_2658 = new _loc4_(class_2741.const_2976);
            method_4558(this.var_2658);
            this.var_2658.method_5169(_loc3_);
            _loc1_ = _data.eulers;
            if (_loc1_) {
                this.var_2244 = true;
                _loc2_ = _loc1_.id;
                _loc3_ = _loc1_.data;
                this.var_3918 = new ThreeDConstValueSubParser(null);
                method_4558(this.var_3918);
                this.var_3918.method_5169(_loc3_);
            }
        }
        if (super.method_196() == const_2361) {
            this.method_184();
            return const_2361;
        }
        return const_2971;
    }

    private function method_184(): void {
        var _loc2_: * = null;
        var _loc1_: Vector3D = !!this.var_2244 ? this.var_3918.setter.generateOneValue() : null;
        if (this.var_2658.method_5046 == class_2421.const_376) {
            _loc2_ = this.var_2658.setter.generateOneValue();
            var_4806 = new class_2741(class_2578.name_100, this.var_2244, this.var_219, this.var_81, _loc2_.x, _loc2_.y, _loc2_.z, _loc1_);
        } else {
            var_4806 = new class_2741(class_2578.name_24, this.var_2244, this.var_219, this.var_81, 100, 1, 0, _loc1_);
            _setters.push(this.var_2658.setter);
        }
    }
}
}
