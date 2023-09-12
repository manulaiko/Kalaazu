package package_464 {

import package_386.class_2578;

import package_431.class_2739;

import package_438.class_2421;

import package_466.class_2598;

import package_483.FourDCompositeWithThreeDValueSubParser;

public class ParticleRotationalVelocityNodeSubParser extends class_2593 {


    private var var_573: FourDCompositeWithThreeDValueSubParser;

    public function ParticleRotationalVelocityNodeSubParser() {
        super();
    }

    public static function get identifier(): * {
        return class_2598.ParticleRotationalVelocityNodeSubParser;
    }

    override protected function method_196(): Boolean {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        if (var_117) {
            _loc1_ = _data.rotation;
            _loc2_ = _loc1_.id;
            _loc3_ = _loc1_.data;
            this.var_573 = new FourDCompositeWithThreeDValueSubParser(class_2739.const_1069);
            method_4558(this.var_573);
            this.var_573.method_5169(_loc3_);
        }
        if (super.method_196() == const_2361) {
            this.method_184();
            return const_2361;
        }
        return const_2971;
    }

    private function method_184(): void {
        if (this.var_573.method_5046 == class_2421.const_376) {
            var_4806 = new class_2739(class_2578.name_100, this.var_573.setter.generateOneValue());
        } else {
            var_4806 = new class_2739(class_2578.name_24);
            _setters.push(this.var_573.setter);
        }
    }
}
}
