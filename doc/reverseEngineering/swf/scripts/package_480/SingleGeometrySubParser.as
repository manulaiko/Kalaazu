package package_480 {

import away3d.arcane;

import package_294.class_2429;
import package_294.class_2591;

import package_437.class_2592;

import package_438.class_2421;

import package_465.class_2594;

import package_466.class_2595;
import package_466.class_2598;

import package_472.class_2721;

import package_479.class_2692;

import package_482.Matrix2DUVCompositeValueSubParser;

import package_490.class_2720;

public class SingleGeometrySubParser extends class_2693 {


    private var _shape: class_2692;

    private var var_3615: class_2421;

    private var var_4453: class_2421;

    private var var_1350: class_2591;

    public function SingleGeometrySubParser() {
        super();
    }

    public static function get identifier(): * {
        return class_2598.SingleGeometrySubParser;
    }

    override protected function method_196(): Boolean {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (var_117) {
            _loc1_ = _data.vertexTransform;
            if (_loc1_) {
                _loc2_ = _loc1_.id;
                _loc3_ = _loc1_.data;
                if (!(_loc4_ = class_2592.method_6525(_loc2_, class_2595.const_2661))) {
                    method_444("Unknown value");
                }
                this.var_3615 = new _loc4_(null);
                method_4558(this.var_3615);
                this.var_3615.method_5169(_loc3_);
            }
            _loc1_ = _data.uvTransformValue;
            if (_loc1_) {
                _loc2_ = _loc1_.id;
                _loc3_ = _loc1_.data;
                this.var_4453 = new Matrix2DUVCompositeValueSubParser(null);
                method_4558(this.var_4453);
                this.var_4453.method_5169(_loc3_);
            }
            _loc1_ = _data.shape;
            _loc2_ = _loc1_.id;
            _loc3_ = _loc1_.data;
            _loc4_ = class_2592.method_6525(_loc2_, class_2595.const_2718);
            this._shape = new _loc4_();
            method_4558(this._shape);
            this._shape.method_5169(_loc3_);
        }
        if (super.method_196() == const_2361) {
            this.method_1892();
            method_3342(this.var_1350);
            return const_2361;
        }
        return const_2971;
    }

    private function method_1892(): void {
        var _loc3_: int = 0;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc1_: class_2429 = this._shape.method_3173();
        var _loc2_: Vector.<class_2429> = new Vector.<class_2429>(var_3829, true);
        while (_loc3_ < var_3829) {
            _loc2_[_loc3_] = _loc1_;
            _loc3_++;
        }
        if (Boolean(this.var_3615) || Boolean(this.var_4453)) {
            _loc5_ = !!this.var_3615 ? this.var_3615.setter : null;
            _loc6_ = !!this.var_4453 ? this.var_4453.setter : null;
            _loc4_ = new Vector.<class_2720>(var_3829, true);
            _loc3_ = 0;
            while (_loc3_ < var_3829) {
                _loc7_ = new class_2720();
                if (_loc5_) {
                    _loc7_.vertexTransform = _loc5_.generateOneValue(_loc3_, var_3829);
                }
                if (_loc6_) {
                    _loc7_.method_2901 = _loc6_.generateOneValue(_loc3_, var_3829);
                }
                _loc4_[_loc3_] = _loc7_;
                _loc3_++;
            }
        }
        this.var_1350 = class_2721.generateGeometry(_loc2_, _loc4_);
    }

    override public function get method_3651(): class_2591 {
        return this.var_1350;
    }
}
}
