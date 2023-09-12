package package_430 {

import away3d.animators.SkeletonAnimator;
import away3d.animators.class_2120;

import flash.geom.Vector3D;

import package_386.class_2614;
import package_386.class_2627;
import package_386.class_2636;

import package_431.class_2639;

public class class_2703 extends class_2440 implements class_2701 {


    private var var_3751: Vector3D;

    private var var_147: Vector.<class_2636>;

    private var var_3932: class_2639;

    private var var_4285: class_2636;

    private var var_2754: Boolean = true;

    private var var_3702: class_2636;

    private var var_1800: class_2636;

    public function class_2703(param1: class_2120, param2: class_2639) {
        this.var_3751 = new Vector3D();
        this.var_4285 = new class_2636();
        super(param1, param2);
        this.var_3932 = param2;
        this.var_147 = this.var_3932.frames;
    }

    public function get method_3766(): class_2636 {
        if (var_3035) {
            this.method_1483();
        }
        return this.var_3702;
    }

    public function get method_2898(): class_2636 {
        if (var_3035) {
            this.method_1483();
        }
        return this.var_1800;
    }

    public function method_2432(param1: class_2614): class_2636 {
        if (this.var_2754) {
            this.method_4721(param1);
        }
        return this.var_4285;
    }

    override public function set time(param1: int): void {
        this.var_2754 = true;
        super.time = param1;
    }

    override protected function method_1483(): void {
        super.method_1483();
        this.var_3702 = this.var_147[var_1857];
        if (Boolean(this.var_3932.method_3310) && var_1424 >= this.var_3932.lastFrame) {
            this.var_1800 = this.var_147[0];
            SkeletonAnimator(_animator).dispatchCycleEvent();
        } else {
            this.var_1800 = this.var_147[var_1424];
        }
    }

    private function method_4721(param1: class_2614): void {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc10_: * = null;
        var _loc11_: * = null;
        this.var_2754 = false;
        if (!this.var_3932.totalDuration) {
            return;
        }
        if (var_3035) {
            this.method_1483();
        }
        var _loc2_: Vector.<class_2627> = this.var_3702.var_3009;
        var _loc3_: Vector.<class_2627> = this.var_1800.var_3009;
        var _loc4_: uint = uint(param1.method_2611);
        var _loc9_: Vector.<class_2627>;
        if ((_loc9_ = this.var_4285.var_3009).length != _loc4_) {
            _loc9_.length = _loc4_;
        }
        if (_loc4_ != _loc2_.length || _loc4_ != _loc3_.length) {
            throw new Error("joint counts don\'t match!");
        }
        var _loc12_: Number = 0;
        while (_loc12_ < _loc4_) {
            var _loc13_: * = _loc9_[_loc12_] || new class_2627();
            _loc9_[_loc12_] = _loc9_[_loc12_] || new class_2627();
            _loc10_ = _loc13_;
            _loc7_ = _loc2_[_loc12_];
            _loc8_ = _loc3_[_loc12_];
            _loc5_ = _loc7_.var_2277;
            _loc6_ = _loc8_.var_2277;
            if (this.var_3932.var_3555) {
                _loc10_.orientation.method_4408(_loc7_.orientation, _loc8_.orientation, var_2940);
            } else {
                _loc10_.orientation.method_1659(_loc7_.orientation, _loc8_.orientation, var_2940);
            }
            if (_loc12_ > 0) {
                (_loc11_ = _loc10_.var_2277).x = _loc5_.x + Number(var_2940) * (_loc6_.x - _loc5_.x);
                _loc11_.y = _loc5_.y + Number(var_2940) * (_loc6_.y - _loc5_.y);
                _loc11_.z = _loc5_.z + Number(var_2940) * (_loc6_.z - _loc5_.z);
            }
            _loc12_++;
        }
    }

    override protected function method_1087(): void {
        var_4672 = false;
    }
}
}
