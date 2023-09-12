package package_366 {

import away3d.animators.class_2403;
import away3d.animators.class_2579;
import away3d.arcane;

import flash.geom.Vector3D;
import flash.net.URLRequest;

import package_294.class_2591;

import package_304.class_2114;

import package_368.class_2416;

import package_383.class_2396;

import package_437.class_2592;

import package_438.class_2421;

import package_464.ParticleTimeNodeSubParser;
import package_464.class_2593;

import package_465.class_2594;

import package_466.class_2595;

import package_467.class_2596;

public class ParticleAnimationParser extends class_2108 {


    private var var_2758: class_2114;

    private var var_4833: class_2403;

    private var var_1222: class_2579;

    private var var_1350: class_2591;

    private var _bounds: Number;

    private var var_4307: Vector.<class_2593>;

    private var var_4943: class_2596;

    private var var_3618: class_2597;

    private var var_3199: Vector.<class_2421>;

    public function ParticleAnimationParser() {
        super();
    }

    public static function supportsType(param1: String): Boolean {
        param1 = param1.toLowerCase();
        return param1 == "pam";
    }

    public static function supportsData(param1: *): Boolean {
        return false;
    }

    override protected function method_196(): Boolean {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc11_: * = null;
        if (var_117) {
            this._bounds = _data.bounds;
            _loc1_ = _data.material;
            _loc2_ = _loc1_.id;
            _loc3_ = _loc1_.data;
            if (!(_loc4_ = class_2592.method_6525(_loc2_, class_2595.const_679))) {
                method_444("Unknown matierla parser");
            }
            this.var_4943 = new _loc4_();
            method_4558(this.var_4943);
            this.var_4943.method_5169(_loc3_);
            this.var_4307 = new Vector.<class_2593>();
            _loc5_ = _data.nodes;
            for each(_loc6_ in _loc5_) {
                _loc3_ = _loc6_.data;
                _loc2_ = _loc6_.id;
                if (!(_loc4_ = class_2592.method_6525(_loc2_, class_2595.const_3135))) {
                    method_444("Unknown node parser");
                }
                _loc9_ = new _loc4_();
                method_4558(_loc9_);
                _loc9_.method_5169(_loc3_);
                this.var_4307.push(_loc9_);
            }
            if (_loc7_ = _data.globalValues) {
                this.var_3199 = new Vector.<class_2421>();
                for each(_loc10_ in _loc7_) {
                    _loc3_ = _loc10_.data;
                    _loc2_ = _loc10_.id;
                    if (!(_loc4_ = class_2592.method_6525(_loc2_, class_2595.const_2925))) {
                        method_444("Unknown node parser");
                    }
                    _loc11_ = new _loc4_(null);
                    method_4558(_loc11_);
                    _loc11_.method_5169(_loc3_);
                    this.var_3199.push(_loc11_);
                }
            }
            if ((_loc8_ = _data.geometry).embed) {
                this.var_3618 = new class_2597();
                method_4558(this.var_3618);
                this.var_3618.method_5169(_loc8_.data);
            } else {
                method_597("geometry", new URLRequest(_loc8_.url), true);
            }
        }
        if (super.method_196() == const_2361) {
            this.method_1984();
            return const_2361;
        }
        return const_2971;
    }

    override arcane function method_3765(param1: class_2416): void {
        if (param1.id == "geometry") {
            this.var_3618 = new class_2597();
            method_4558(this.var_3618);
            this.var_3618.method_5169(param1.data);
        }
    }

    override arcane function resolveDependencyFailure(param1: class_2416): void {
        method_444("resolveDependencyFailure");
    }

    private function method_1984(): void {
        var _loc4_: int = 0;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc1_: ParticleTimeNodeSubParser = this.var_4307[0] as ParticleTimeNodeSubParser;
        this.var_1222 = new class_2579(_loc1_.usesDuration, _loc1_.usesLooping, _loc1_.usesDelay);
        var _loc2_: int = int(this.var_4307.length);
        var _loc3_: Vector.<class_2594> = new Vector.<class_2594>();
        if (this.var_3199) {
            for each(_loc6_ in this.var_3199) {
                _loc3_.push(_loc6_.setter);
            }
        }
        while (_loc4_ < this.var_4307.length) {
            if (_loc4_ != 0) {
                this.var_1222.addAnimation(this.var_4307[_loc4_].method_6376);
            }
            _loc7_ = this.var_4307[_loc4_].method_1693;
            for each(_loc8_ in _loc7_) {
                _loc3_.push(_loc8_);
            }
            _loc4_++;
        }
        var _loc5_: ParticleInitializer = new ParticleInitializer(_loc3_);
        this.var_1222.var_2254 = _loc5_.initHandler;
        method_3342(this.var_1222);
        this.var_4833 = new class_2403(this.var_1222);
        this.var_2758 = new class_2114(this.var_3618.method_3651, this.var_4943.material);
        this.var_2758.bounds = new class_2396();
        this.var_2758.bounds.method_5432(new Vector3D(), this._bounds);
        if (_data.hasOwnProperty("shareAnimationGeometry")) {
            this.var_2758.shareAnimationGeometry = _data.shareAnimationGeometry;
        }
        if (_data.hasOwnProperty("name")) {
            this.var_2758.name = _data.name;
        }
        this.var_2758.animator = this.var_4833;
        method_3342(this.var_2758);
    }

    public function get method_3631(): class_2114 {
        return this.var_2758;
    }
}
}

import package_386.class_2580;

import package_465.class_2594;

class ParticleInitializer {


    private var _setters: Vector.<class_2594>;

    function ParticleInitializer(param1: Vector.<class_2594>) {
        super();
        this._setters = param1;
    }

    public function initHandler(param1: class_2580): void {
        var _loc2_: * = null;
        if (param1.index == 0) {
            for each(_loc2_ in this._setters) {
                _loc2_.method_5590(param1);
            }
        }
        for each(_loc2_ in this._setters) {
            _loc2_.method_1777(param1);
        }
        if (param1.index == param1.total - 1) {
            for each(_loc2_ in this._setters) {
                _loc2_.method_3724(param1);
            }
        }
    }
}
