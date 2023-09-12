package package_464 {

import flash.geom.Vector3D;

import package_431.class_2737;

import package_466.class_2598;

import package_468.ThreeDConstValueSubParser;

public class ParticleSegmentedScaleNodeSubParser extends class_2593 {


    private var var_2556: ThreeDConstValueSubParser;

    private var var_2257: ThreeDConstValueSubParser;

    private var var_1248: Array;

    public function ParticleSegmentedScaleNodeSubParser() {
        super();
    }

    public static function get identifier(): * {
        return class_2598.ParticleSegmentedScaleNodeSubParser;
    }

    override protected function method_196(): Boolean {
        var _loc1_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: int = 0;
        var _loc6_: * = null;
        if (var_117) {
            _loc1_ = _data.startScale;
            _loc3_ = _loc1_.data;
            this.var_2556 = new ThreeDConstValueSubParser(null);
            method_4558(this.var_2556);
            this.var_2556.method_5169(_loc3_);
            _loc1_ = _data.endScale;
            _loc3_ = _loc1_.data;
            this.var_2257 = new ThreeDConstValueSubParser(null);
            method_4558(this.var_2257);
            this.var_2257.method_5169(_loc3_);
            this.var_1248 = new Array();
            _loc4_ = _data.segmentPoints;
            while (_loc5_ < _loc4_.length) {
                _loc6_ = new ThreeDConstValueSubParser(null);
                method_4558(_loc6_);
                this.var_1248.push({
                    "life": _loc4_[_loc5_].life,
                    "scale": _loc6_
                });
                _loc6_.method_5169(_loc4_[_loc5_].scale.data);
                _loc5_++;
            }
            this.var_1248.sortOn("life", 0 | 0);
            _loc5_ = 0;
            while (_loc5_ < _loc4_.length - 1) {
                if (this.var_1248[_loc5_].life == this.var_1248[_loc5_ + 1].life) {
                    this.var_1248[_loc5_].life -= 0.00001 * (_loc4_.length - _loc5_);
                }
                _loc5_++;
            }
        }
        if (super.method_196() == const_2361) {
            this.method_184();
            return const_2361;
        }
        return const_2971;
    }

    private function method_184(): void {
        var _loc3_: int = 0;
        var _loc4_: * = null;
        var _loc1_: Vector.<Vector3D> = new Vector.<Vector3D>();
        var _loc2_: int = int(this.var_1248.length);
        while (_loc3_ < _loc2_) {
            (_loc4_ = this.var_1248[_loc3_].scale.setter.generateOneValue()).w = this.var_1248[_loc3_].life;
            _loc1_.push(_loc4_);
            _loc3_++;
        }
        var_4806 = new class_2737(_loc2_, this.var_2556.setter.generateOneValue(), this.var_2257.setter.generateOneValue(), _loc1_);
    }
}
}
