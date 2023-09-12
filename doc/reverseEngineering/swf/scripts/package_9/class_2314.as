package package_9 {

import flash.display.MovieClip;

import net.bigpoint.darkorbit.class_9;

import package_11.class_39;

import package_115.class_1063;

import package_181.class_1104;

import package_22.class_1090;
import package_22.class_198;

public class class_2314 {

    public static var var_4080: Array = [];

    public static var var_4555: Array = [];

    public static var var_2480: Array = [];

    public static var var_332: Array = [];


    public function class_2314() {
        super();
    }

    public static function precache(): void {
    }

    public static function init(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        for each(_loc1_ in class_198.var_2598) {
            method_4797(_loc1_.resKey, _loc1_.poolSize);
        }
        for each(_loc2_ in class_198.var_4122) {
            method_406(_loc2_.resKey, _loc2_.poolSize);
        }
    }

    public static function method_4797(param1: String, param2: int): void {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc3_: class_39 = class_39(ResourceManager.name_15.getFinisher(param1));
        var _loc4_: Vector.<class_1104> = new Vector.<class_1104>();
        var _loc7_: int = 0;
        while (_loc7_ < param2) {
            _loc5_ = MovieClip(_loc3_.getEmbeddedMovieClip("mc"));
            _loc6_ = new class_1104(_loc5_, param1);
            _loc4_.push(_loc6_);
            _loc7_++;
        }
        var_4080[param1] = _loc4_;
    }

    public static function method_2243(param1: String): class_1104 {
        var _loc2_: Vector.<class_1104> = var_4080[param1] as Vector.<class_1104>;
        if (_loc2_ == null) {
            return null;
        }
        return _loc2_.pop();
    }

    public static function method_4047(param1: class_1104): void {
        var _loc2_: Vector.<class_1104> = var_4080[param1.method_4949] as Vector.<class_1104>;
        _loc2_.push(param1);
    }

    public static function method_6302(param1: String, param2: int): void {
        var _loc5_: * = null;
        var _loc3_: class_39 = class_39(ResourceManager.name_15.getFinisher(param1));
        var _loc4_: Array = new Array();
        var _loc6_: int = 0;
        while (_loc6_ < param2) {
            (_loc5_ = MovieClip(_loc3_.getEmbeddedMovieClip("mc"))).gotoAndStop(1);
            _loc5_.mouseEnabled = false;
            _loc5_.mouseChildren = false;
            _loc4_.push(_loc5_);
            _loc6_++;
        }
        var_332[param1] = _loc4_;
    }

    public static function method_406(param1: String, param2: int): void {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc3_: class_39 = class_39(ResourceManager.name_15.getFinisher(param1));
        var _loc4_: Vector.<class_1104> = new Vector.<class_1104>();
        var _loc7_: int = 0;
        while (_loc7_ < param2) {
            _loc5_ = MovieClip(_loc3_.getEmbeddedMovieClip("mc"));
            _loc6_ = new class_1104(_loc5_, param1);
            _loc4_.push(_loc6_);
            _loc7_++;
        }
        var_4555[param1] = _loc4_;
    }

    public static function method_6083(param1: String): class_1104 {
        var _loc2_: Vector.<class_1104> = var_4555[param1] as Vector.<class_1104>;
        if (_loc2_ == null) {
            return null;
        }
        return _loc2_.pop();
    }

    public static function method_5206(param1: class_1104): void {
        var _loc2_: Vector.<class_1104> = var_4555[param1.method_4949] as Vector.<class_1104>;
        _loc2_.push(param1);
    }

    public static function method_4103(param1: String, param2: int): void {
        var _loc6_: * = null;
        var _loc3_: class_39 = class_39(ResourceManager.name_15.getFinisher(param1));
        var _loc4_: Array = new Array();
        var _loc5_: int = 0;
        while (_loc5_ < param2) {
            (_loc6_ = MovieClip(_loc3_.getEmbeddedMovieClip("mc"))).mouseEnabled = class_9.const_3029;
            _loc6_.mouseChildren = class_9.const_3029;
            _loc4_.push(_loc6_);
            _loc5_++;
        }
        var_2480[param1] = _loc4_;
    }
}
}
