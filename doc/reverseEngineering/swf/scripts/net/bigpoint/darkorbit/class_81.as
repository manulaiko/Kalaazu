package net.bigpoint.darkorbit {

import flash.utils.Dictionary;

import package_10.class_19;
import package_10.class_20;

import package_105.class_282;

import package_22.class_283;

import package_38.class_174;

import package_69.class_180;

import package_72.class_281;

public class class_81 {

    public static var name_148: String = "";

    public static var userID: int;

    public static var var_4184: String;

    public static var factionID: int = 0;

    public static var sessionID: String;

    public static var var_121: class_282;

    public static var var_3085: class_281;

    public static var var_4677: class_19 = new class_19(false);

    public static var var_24: class_19 = new class_19(false);

    public static var var_2083: Dictionary = new Dictionary();

    public static var var_3705: Number;

    public static var var_3732: Number;

    public static var var_4516: Number;

    public static var var_5027: Number;

    public static var level: int;

    public static var var_2369: Number;

    public static var var_3630: int;

    public static var premium: class_19 = new class_19(false);

    public static var var_5032: Boolean;

    public static var var_4634: Boolean;

    public static var var_1859: uint = class_174.INACTIVE;

    public static var var_1203: class_283;

    public static var var_938: Boolean;

    public static var var_238: int;

    public static var var_3331: int;

    public static var var_2491: int;

    public static var var_4543: int;

    public static var var_683: int;

    public static var var_869: Boolean = false;

    public static var var_1019: Boolean = false;

    public static var var_918: class_281;

    public static var var_608: class_180;

    public static var name_32: int;

    public static var var_3592: uint;

    public static const const_934: class_20 = new class_20(0);

    public static const const_227: class_20 = new class_20(0);

    public static const const_1509: String = "noclan";

    public static var name_145: String = const_1509;

    public static var var_4995: String = "noclan";

    private static var var_307: String;


    public function class_81() {
        super();
    }

    public static function get method_2322(): String {
        return class_126.getInstance().method_2276[factionID].toLowerCase();
    }

    public static function method_3901(param1: uint): void {
        var_1859 = param1;
    }

    public static function get method_1561(): Boolean {
        return name_145 != var_4995 && name_145 != null && name_145 != "";
    }

    public static function toString(): String {
        var _loc1_: String = "";
        _loc1_ += " Hero.username  undefined\n";
        _loc1_ += " Hero.userID    undefined\n";
        _loc1_ += " Hero.sessionID undefined\n";
        _loc1_ += " Hero.clanTag   undefined\n";
        return _loc1_ + " Hero.factionID undefined\n";
    }

    public static function get method_1271(): String {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = 0;
        var _loc5_: * = 0;
        var _loc6_: * = null;
        var _loc1_: String = "";
        if (var_307 == null) {
            _loc2_ = (Math.random() * 100000 >> 1).toString();
            _loc3_ = new Date().valueOf().toString();
            _loc4_ = int(_loc2_);
            _loc5_ = int(_loc3_);
            _loc6_ = (_loc4_ ^ _loc5_).toString();
            var_307 = _loc2_ + _loc3_ + _loc3_ + _loc6_;
        }
        return _loc1_ + (class_81.sessionID + var_307);
    }

    public static function method_6319(): void {
        var_307 = null;
    }
}
}
