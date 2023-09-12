package net.bigpoint.darkorbit.net {

import com.bigpoint.utils.class_73;
import com.greensock.TweenLite;

import flash.utils.Dictionary;

import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.mvc.common.utils.ParserUtility;

import package_17.class_62;

import package_25.class_272;

import package_35.class_338;

import package_75.class_337;

import package_9.class_50;

public class class_97 extends class_96 {

    private static var _instance: class_97;


    private var facade: class_62;

    private var var_139: Dictionary;

    private var var_3735: class_86;

    private var main: class_9;

    public function class_97(param1: Function) {
        super();
        if (param1 !== method_336) {
            throw new Error("UserInterfaceAssembly is a Singleton and can only be accessed through UserInterfaceAssembly.getInstance()");
        }
        this.main = var_574;
        this.facade = class_62.getInstance();
        this.method_709();
    }

    public static function getInstance(): class_97 {
        if (_instance == null) {
            _instance = new class_97(method_336);
        }
        return _instance;
    }

    private static function method_336(): void {
    }

    private function method_709(): void {
        this.var_139 = new Dictionary();
        this.var_139[class_74.const_3191] = this.method_4479;
        this.var_139[class_74.const_1290] = this.method_2544;
        this.var_139[class_74.WINDOW] = this.method_5898;
        this.var_139[class_74.BUTTON] = this.method_4826;
    }

    public function method_5080(param1: Array): void {
        var _loc2_: String = param1[2];
        if (this.var_139[_loc2_] != null) {
            this.var_139[_loc2_](param1);
        }
    }

    private function method_4826(param1: Array): void {
        var _loc2_: int = 0;
        var _loc5_: int = 0;
        var _loc6_: Boolean = false;
        var _loc3_: class_90 = var_574.name_47.map;
        var _loc4_: int = 0;
        switch (param1[3]) {
            case class_74.const_2033:
                _loc5_ = int(param1[4]);
                _loc6_ = Boolean(int(param1[5]));
                if (_loc3_ != null) {
                    _loc4_ = 6;
                    while (_loc4_ < param1.length) {
                        _loc2_ = int(param1[_loc4_]);
                        _loc4_++;
                    }
                    break;
                }
                break;
            case class_74.const_2045:
        }
    }

    private function method_5898(param1: Array): void {
        var _loc2_: * = null;
        var _loc5_: int = 0;
        var _loc6_: Boolean = false;
        var _loc3_: class_90 = var_574.name_47.map;
        var _loc4_: int = 0;
        switch (param1[3]) {
            case class_74.const_1007:
                _loc4_ = 4;
                while (_loc4_ < param1.length) {
                    _loc2_ = String(param1[_loc4_]);
                    var_574.method_4489().method_380(_loc2_);
                    _loc4_++;
                }
                break;
            case class_74.const_1133:
                _loc4_ = 4;
                while (_loc4_ < param1.length) {
                    _loc2_ = String(param1[_loc4_]);
                    var_574.method_4489().method_4207(param1[_loc4_]);
                    _loc4_++;
                }
                break;
            case class_74.const_486:
                _loc4_ = 4;
                while (_loc4_ < param1.length) {
                    _loc2_ = String(param1[_loc4_]);
                    var_574.method_4489().method_2004(_loc2_);
                    _loc4_++;
                }
                break;
            case class_74.const_2480:
                _loc4_ = 4;
                while (_loc4_ < param1.length) {
                    _loc2_ = String(param1[_loc4_]);
                    var_574.method_4489().method_1875(_loc2_);
                    _loc4_++;
                }
                break;
            case class_74.const_486:
                _loc4_ = 4;
                while (_loc4_ < param1.length) {
                    _loc2_ = String(param1[_loc4_]);
                    var_574.method_4489().method_2004(_loc2_);
                    _loc4_++;
                }
                break;
            case class_74.const_2480:
                _loc4_ = 4;
                while (_loc4_ < param1.length) {
                    _loc2_ = String(param1[_loc4_]);
                    var_574.method_4489().method_1875(_loc2_);
                    _loc4_++;
                }
                break;
            case class_74.const_2033:
                _loc5_ = int(param1[4]);
                _loc6_ = ParserUtility.parseBooleanFromInt(param1[5]);
                if (_loc3_ != null) {
                    _loc4_ = 6;
                    while (_loc4_ < param1.length) {
                        _loc2_ = String(param1[_loc4_]);
                        _loc4_++;
                    }
                    break;
                }
        }
    }

    private function method_2544(param1: Array): void {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        switch (param1[3]) {
            case class_74.const_2408:
                _loc2_ = int(param1[4]);
                _loc3_ = int(param1[5]);
                map.effects.method_584(new class_337(map.hero.position, new class_73(_loc2_, _loc3_)));
                break;
            case class_74.const_1448:
                map.effects.method_3217(map.hero.id, class_338.const_606);
        }
    }

    private function method_4479(param1: Array): void {
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        var _loc7_: * = null;
        var _loc2_: class_90 = var_574.name_47.map;
        if (_loc2_ == null) {
            return;
        }
        switch (param1[3]) {
            case class_74.NOISE:
                class_50.getInstance().minimap.method_598(int(param1[4]));
                break;
            case class_74.const_75:
                _loc4_ = int(param1[5]);
                _loc5_ = int(param1[6]);
                _loc6_ = int(param1[7]);
                _loc7_ = "";
                if (param1.length > 8) {
                    if ((_loc7_ = param1[8]) != "_red") {
                        _loc7_ = "";
                    }
                }
                class_50.getInstance().minimap.method_1759(new class_272(param1[4], _loc4_, _loc5_, _loc6_, _loc7_));
                break;
            case class_74.const_803:
                class_50.getInstance().minimap.method_845(param1[4]);
        }
    }

    public function method_3554(param1: int, param2: int, param3: Number): void {
        var _loc4_: class_90;
        if ((_loc4_ = var_574.name_47.map) != null) {
            var_574.name_47.method_1772.method_5917();
            class_50.var_1535 = class_50.var_894;
            TweenLite.to(class_50.camera, param3, {
                "x": param1,
                "y": param2,
                "onComplete": this.method_992
            });
        }
    }

    public function method_5282(): void {
        var _loc2_: * = null;
        if (true || true) {
            return;
        }
        var _loc1_: class_90 = var_574.name_47.map;
        if (_loc1_ != null) {
            class_50.var_1535 = class_50.var_1705;
            _loc2_ = _loc1_.hero;
            TweenLite.to(class_50.camera, 3, {
                "x": _loc2_.x,
                "y": _loc2_.y,
                "onComplete": this.method_5677
            });
            var_574.name_47.method_3528.method_70(1, 0);
        }
    }

    public function method_4730(param1: int, param2: Number, param3: Number): void {
        var _loc4_: class_90;
        if ((_loc4_ = var_574.name_47.map) != null) {
            if (true || true) {
                if (this.var_3735 != null && this.var_3735.id == param1) {
                    var_574.name_47.method_3528.method_70(param2, param3);
                    return;
                }
            }
            var_574.name_47.method_1772.method_5917();
            var_574.name_47.method_3528.method_70(param2, param3);
            class_50.var_1535 = class_50.var_2322;
            this.var_3735 = _loc4_.method_1203().method_2455(param1);
            TweenLite.to(class_50.camera, param3, {
                "dynamicProps": {
                    "x": this.method_5625,
                    "y": this.method_2891
                },
                "onComplete": this.method_4122,
                "onCompleteParams": [this.var_3735]
            });
        }
    }

    private function method_4122(param1: class_86): void {
        class_50.var_3902 = param1.id;
        class_50.var_1535 = class_50.var_3802;
    }

    private function method_992(): void {
        class_50.var_3902 = -1;
        class_50.var_1535 = class_50.var_2894;
    }

    private function method_5677(): void {
        var_574.name_47.method_1772.method_94();
        class_50.var_3902 = -1;
        this.var_3735 = null;
        class_50.var_1535 = class_50.var_4664;
    }

    private function method_5625(): Number {
        return this.var_3735.x;
    }

    private function method_2891(): Number {
        return this.var_3735.y;
    }
}
}
