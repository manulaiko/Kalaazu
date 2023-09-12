package package_304 {

import away3d.animators.class_2132;
import away3d.animators.class_2403;

import flash.geom.Vector3D;

import mx.utils.ObjectUtil;

import package_294.class_1750;

import package_295.class_1752;

import package_383.class_2396;

import package_386.class_2404;
import package_386.class_2408;

import package_431.class_2407;

public class class_2104 extends class_1752 {


    protected var _animator: class_2132;

    protected var var_3566: Vector.<class_2114>;

    protected var var_1412: Vector.<class_2408>;

    protected var var_885: FollowParticleContainer;

    protected var var_1580: Boolean;

    protected var var_2941: Object;

    protected var var_4838: Vector.<class_2404>;

    public function class_2104(param1: Vector.<class_2114>, param2: Vector.<class_2408>, param3: Object = null, param4: Vector.<class_2404> = null) {
        var _loc5_: int = 0;
        var _loc6_: * = null;
        var _loc7_: * = null;
        super();
        this.var_885 = new FollowParticleContainer();
        addChild(this.var_885);
        if (param3) {
            this.var_2941 = ObjectUtil.clone(param3);
        } else {
            this.var_2941 = {};
        }
        this.var_3566 = param1;
        this.var_1412 = param2;
        this.var_4838 = param4;
        this._animator = new class_2132(param1, param2, this.var_4838);
        while (_loc5_ < param1.length) {
            _loc6_ = param1[_loc5_];
            if (_loc7_ = param2[_loc5_]) {
                _loc7_.apply(_loc6_);
            }
            if (this.method_3967(_loc6_)) {
                this.var_885.method_102(_loc6_);
            } else {
                addChild(_loc6_);
            }
            _loc5_++;
        }
    }

    override public function get zOffset(): int {
        return super.zOffset;
    }

    override public function set zOffset(param1: int): void {
        super.zOffset = param1;
        var _loc2_: int = 0;
        while (_loc2_ < this.method_3953.length) {
            this.method_3953[_loc2_].zOffset = param1;
            _loc2_++;
        }
    }

    public function get method_5430(): Object {
        return this.var_2941;
    }

    public function get method_3953(): Vector.<class_2114> {
        return this.var_3566;
    }

    public function get method_669(): Boolean {
        return this.var_1580;
    }

    public function set method_669(param1: Boolean): void {
        var _loc2_: * = null;
        this.var_1580 = param1;
        for each(_loc2_ in this.var_3566) {
            _loc2_.method_669 = this.var_1580;
        }
    }

    public function get animator(): class_2132 {
        return this._animator;
    }

    private function method_3967(param1: class_2114): Boolean {
        var _loc3_: * = null;
        var _loc2_: class_2403 = param1.animator as class_2403;
        if (_loc2_) {
            _loc3_ = _loc2_.animationSet.method_1957("ParticleFollowLocalDynamic") as class_2407;
            if (_loc3_) {
                return true;
            }
        }
        return false;
    }

    override public function clone(): class_1750 {
        var _loc3_: int = 0;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc1_: uint = uint(this.var_3566.length);
        var _loc2_: Vector.<class_2114> = new Vector.<class_2114>(_loc1_, true);
        _loc3_ = 0;
        while (_loc3_ < _loc1_) {
            _loc2_[_loc3_] = this.var_3566[_loc3_].clone() as class_2114;
            _loc5_ = this.var_3566[_loc3_].bounds as class_2396;
            _loc2_[_loc3_].bounds = new class_2396();
            _loc2_[_loc3_].bounds.method_5432(new Vector3D(), _loc5_.radius);
            _loc3_++;
        }
        var _loc4_: class_2104;
        (_loc4_ = new class_2104(_loc2_, this.var_1412, this.method_5430, this.var_4838)).method_1773 = method_1773;
        _loc4_.transform = transform;
        _loc4_.method_4119 = method_4119;
        _loc4_.name = name;
        _loc4_.method_669 = this.method_669;
        _loc1_ = uint(numChildren);
        _loc3_ = 0;
        while (_loc3_ < _loc1_) {
            _loc6_ = getChildAt(_loc3_);
            if (this.var_885 != _loc6_ && this.var_3566.indexOf(_loc6_ as class_2114) == -1) {
                _loc4_.addChild(class_1752(_loc6_.clone()));
            }
            _loc3_++;
        }
        return _loc4_;
    }

    override public function dispose(): void {
        var _loc1_: * = null;
        super.dispose();
        this._animator.stop();
        for each(_loc1_ in this.var_3566) {
            _loc1_.dispose();
        }
    }
}
}
