package net.bigpoint.darkorbit.net {

import flash.utils.Dictionary;

import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.gui.class_58;
import net.bigpoint.darkorbit.map.model.ship.class_86;

import package_134.class_385;
import package_134.class_386;

import package_35.EffectManager;

import package_67.AbilitiesModel;

public class class_112 extends class_96 {

    private static var instance: class_112;


    private var var_139: Dictionary;

    private var var_396: AbilitiesModel;

    private var guiManager: class_58;

    private var main: class_9;

    public function class_112(param1: Function) {
        super();
        if (param1 !== method_336) {
            throw new Error("SkillsAssembly is a Singleton and can only be accessed through SkillsAssembly.getInstance()");
        }
        this.main = var_574;
        this.guiManager = this.main.method_4489();
        if (this.guiManager.var_396 == null) {
            this.var_396 = new AbilitiesModel(this.main);
            this.guiManager.var_396 = this.var_396;
        } else {
            this.var_396 = this.guiManager.var_396;
        }
        this.method_709();
    }

    public static function getInstance(): class_112 {
        if (instance == null) {
            instance = new class_112(method_336);
        }
        return instance;
    }

    private static function method_336(): void {
    }

    private function method_709(): void {
        this.var_139 = new Dictionary();
        this.var_139[class_74.const_1690] = this.method_54;
        this.var_139[class_74.const_3166] = this.method_2869;
        this.var_139[class_74.const_2243] = this.method_4742;
        this.var_139[class_74.const_1170] = this.method_3541;
    }

    public function method_3891(param1: Array): void {
        var _loc2_: String = param1[3];
        if (this.var_139[_loc2_] != null) {
            this.var_139[_loc2_](param1);
        }
    }

    public function method_5080(param1: Array): void {
        var _loc2_: String = param1[2];
        if (this.var_139[_loc2_] != null) {
            this.var_139[_loc2_](param1);
        }
    }

    private function method_3541(param1: Array): void {
        var _loc2_: int = int(param1[4]);
        var _loc3_: int = int(param1[3]);
        this.main.name_47.map.effects.method_3217(_loc2_, class_386.method_1232(_loc3_));
    }

    private function method_54(param1: Array): void {
        var _loc2_: class_385 = this.var_396.var_1780[param1[3]] as class_385;
        var _loc3_: int = int(param1[3]);
        var _loc4_: int = int(param1[4]);
        var _loc5_: int = int(param1[5]);
        if (_loc2_ == null) {
            return;
        }
        _loc2_.setEquipped();
        _loc2_.status = _loc4_;
        _loc2_.var_3073 = _loc5_;
    }

    public function method_3219(param1: int, param2: int, param3: Boolean): void {
        if (param1 == class_81.userID) {
            class_385(this.var_396.var_1780[param2]).isActive = param3;
        }
    }

    private function method_2869(param1: Array): void {
        var _loc9_: * = null;
        var _loc10_: int = 0;
        var _loc2_: int = int(param1[4]);
        var _loc3_: int = int(param1[5]);
        var _loc4_: Array = param1.splice(6, param1.length);
        var _loc5_: * = param1.length > 5;
        var _loc6_: Boolean = false;
        if (_loc3_ == class_81.userID) {
            _loc6_ = true;
        }
        this.method_3219(_loc3_, _loc2_, true);
        var _loc7_: Class = class_386.method_2063(_loc2_);
        var _loc8_: class_86;
        if ((_loc8_ = this.main.name_47.map.method_1203().method_2455(_loc3_)) != null) {
            this.main.name_47.map.effects.method_5565(new _loc7_(_loc8_));
        }
        if (_loc5_) {
            _loc10_ = 0;
            while (_loc10_ < _loc4_.length) {
                if ((_loc9_ = this.main.name_47.map.method_1203().method_2455(int(_loc4_[_loc10_]))) != null) {
                    this.main.name_47.map.effects.method_5565(new _loc7_(_loc9_));
                }
                _loc10_++;
            }
        }
    }

    private function method_4742(param1: Array): void {
        var _loc10_: int = 0;
        var _loc2_: int = int(param1[4]);
        var _loc3_: int = int(param1[5]);
        var _loc4_: Array = param1.splice(6, param1.length);
        var _loc5_: * = param1.length > 5;
        var _loc6_: Boolean = false;
        if (_loc3_ == class_81.userID) {
            _loc6_ = true;
        }
        this.method_3219(_loc3_, _loc2_, false);
        var _loc7_: class_86 = this.main.name_47.map.method_1203().method_2455(_loc3_);
        var _loc8_: int = int(class_386.method_1232(_loc2_));
        var _loc9_: EffectManager = this.main.name_47.map.effects;
        if (_loc7_ != null) {
            _loc9_.method_3217(_loc3_, _loc8_);
        }
        if (_loc5_) {
            _loc10_ = 0;
            while (_loc10_ < _loc4_.length) {
                _loc9_.method_3217(_loc4_[_loc10_], _loc8_);
                _loc10_++;
            }
        }
    }

    public function method_5008(param1: String, param2: int): void {
        var _loc3_: int = int(class_386.method_4481(param1));
        if (_loc3_ > 0) {
            this.var_396.method_1530(_loc3_, param2);
        }
    }
}
}
