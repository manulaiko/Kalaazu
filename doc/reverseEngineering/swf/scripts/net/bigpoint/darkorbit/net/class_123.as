package net.bigpoint.darkorbit.net {

import flash.display.Bitmap;
import flash.utils.Dictionary;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.gui.class_416;
import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.map.model.ship.class_109;
import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.settings.Settings;

import package_112.class_307;
import package_112.class_420;

import package_138.class_421;

import package_22.class_198;
import package_22.class_414;

import package_27.class_82;

import package_30.class_91;

import package_35.class_338;

import package_37.ICommand;

import package_38.class_415;
import package_38.class_418;
import package_38.class_424;

import package_75.class_369;
import package_75.class_417;
import package_75.class_423;

import package_9.class_50;

public class class_123 extends class_96 {

    private static var instance: class_123;

    public static const const_19: String = "-";


    private var main: class_9;

    private var var_139: Dictionary;

    private var var_1695: class_422;

    private var var_58: class_419;

    public function class_123(param1: Function) {
        super();
        if (param1 !== method_336) {
            throw new Error("PetAssembly is a Singleton and can only be accessed through PetAssembly.getInstance()");
        }
        this.main = var_574;
        this.method_709();
    }

    public static function getInstance(): class_123 {
        if (instance == null) {
            instance = new class_123(method_336);
        }
        return instance;
    }

    private static function method_336(): void {
    }

    public function method_5080(param1: Array): void {
        var _loc2_: String = param1[2];
        if (this.var_139[_loc2_] != null) {
            this.var_139[_loc2_](param1);
        } else {
            this.name_92(class_126.const_182);
        }
    }

    public function method_3891(param1: Array): void {
        var _loc2_: String = param1[2];
        var _loc3_: String = param1[3];
        if (this.var_139[_loc2_ + const_19 + _loc3_] != null) {
            this.var_139[_loc2_ + const_19 + _loc3_](param1);
        } else {
            this.name_92(class_126.const_182);
        }
    }

    private function method_709(): void {
        this.var_139 = new Dictionary();
        this.var_139[class_74.const_219] = this.method_3066;
        this.var_139[class_74.const_1294] = this.method_4079;
        this.var_139[class_74.const_1] = this.method_6468;
        this.var_139[class_74.const_2379] = this.method_1188;
        this.var_139[class_74.const_2787] = this.method_3808;
        this.var_139[class_74.const_2097] = this.method_654;
        this.var_139[class_74.const_1258] = this.method_2473;
        this.var_139[class_74.const_265] = this.method_2560;
        this.var_139[class_74.const_3236] = this.method_4084;
        this.var_139[class_74.const_2363] = this.method_2146;
        this.var_139[class_74.const_1039] = this.method_4281;
        this.var_139[class_74.const_1683] = this.method_776;
        this.var_139[class_74.const_2905] = this.method_4370;
        this.var_139[class_74.const_3278] = this.method_5435;
        this.var_139[class_74.const_2263] = this.method_2471;
        this.var_139[class_74.const_2866] = this.method_3891;
        this.var_139[class_74.const_1715] = this.method_3891;
        this.var_139[class_74.const_3093] = this.method_3891;
        this.var_139[class_74.const_3140] = this.method_6536;
        this.var_139[class_74.const_2866 + const_19 + class_74.const_915] = this.method_2226;
        this.var_139[class_74.const_2866 + const_19 + class_74.const_1087] = this.method_4081;
        this.var_139[class_74.const_2866 + const_19 + class_74.const_1855] = this.method_1464;
        this.var_139[class_74.const_2866 + const_19 + class_74.const_686] = this.method_4960;
        this.var_139[class_74.const_2866 + const_19 + class_74.const_2933] = this.method_1247;
        this.var_139[class_74.const_3117] = this.method_231;
        this.var_139[class_74.const_1715 + const_19 + class_74.const_3167] = this.method_63;
        this.var_139[class_74.const_1715 + const_19 + class_74.const_2620] = this.method_1605;
        this.var_139[class_74.const_1715 + const_19 + class_74.SELECT] = this.method_2886;
        this.var_139[class_74.const_1715 + const_19 + class_74.const_2973] = this.method_432;
        this.var_139[class_74.const_3093 + const_19 + class_74.const_2973] = this.method_280;
        this.var_139[class_74.const_1715 + const_19 + class_74.const_1840] = this.method_5531;
        this.var_139[class_74.const_3093 + const_19 + class_74.const_1840] = this.method_4407;
    }

    public function method_2471(param1: Boolean, param2: int): void {
        this.method_4933.method_1602(param1, param2);
    }

    public function method_5286(param1: int): void {
        var _loc2_: class_415 = new class_415(param1);
        this.sendRequest(_loc2_);
    }

    public function sendRequest(param1: ICommand): void {
        this.main.method_6154().sendRequest(param1);
    }

    public function method_4962(): void {
        var _loc1_: class_420 = this.method_3112();
        if (Boolean(_loc1_) && Boolean(_loc1_.method_2856)) {
            return;
        }
        this.method_5286(class_415.const_1743);
    }

    private function method_3112(): class_420 {
        return Boolean(this.hero) && Boolean(this.hero.pet) ? class_50.getInstance().map.method_5806(this.hero.pet.id, class_420) as class_420 : null;
    }

    private function method_2193(param1: int): class_420 {
        return class_50.getInstance().map.method_5806(param1, class_420) as class_420;
    }

    public function method_2469(): void {
        var _loc1_: class_420 = this.method_3112();
        if (Boolean(_loc1_) && Boolean(_loc1_.method_2856)) {
            return;
        }
        this.method_5286(class_415.const_2099);
    }

    public function method_5691(): void {
        var _loc1_: class_420 = this.method_3112();
        if (Boolean(_loc1_) && Boolean(_loc1_.method_2856)) {
            return;
        }
        this.method_5286(class_415.const_3121);
    }

    public function method_4281(): void {
        this.method_4933.method_6367();
    }

    private function method_6536(param1: Array): void {
        this.method_4933.method_3621();
    }

    public function method_3066(param1: Boolean, param2: Boolean, param3: Boolean): void {
        class_81.var_869 = param1;
        class_81.var_1019 = !param3;
        this.method_4933.init(param2, !param3);
    }

    public function method_4084(param1: Boolean): void {
        this.method_4933.name_84(param1);
    }

    public function method_5435(): void {
        this.method_4933.method_5189();
        if (class_50.getInstance().map == null || this.hero == null || this.hero.pet == null) {
            return;
        }
        this.method_4933.method_4518();
        this.method_6480();
    }

    public function method_4370(param1: int): void {
        var _loc2_: class_90 = class_50.getInstance().map;
        if (!_loc2_) {
        }
    }

    public function method_776(param1: int, param2: Boolean): void {
        var _loc3_: * = null;
        if (class_50.getInstance().map != null) {
            _loc3_ = class_50.getInstance().map.method_1203().method_3416(param1);
            if (_loc3_ != null) {
                this.method_2193(param1).method_2856 = param2;
                _loc3_.visible = !param2;
            }
        }
    }

    public function method_2146(): void {
        this.tradeWindow.activate();
    }

    public function method_1247(param1: int, param2: int, param3: int, param4: int): void {
        var _loc5_: class_307;
        if (_loc5_ = this.hero.pet) {
            class_50.getInstance().map.effects.method_5565(new class_369(_loc5_));
            _loc5_.shipPattern = class_198.var_2667[param3];
            _loc5_.name_127 = param4;
        }
        this.main.method_4489().writeToLog(class_88.getItem("msg_pet_level_up").replace("%LEVEL%", param1));
        this.name_92(class_126.const_176);
    }

    public function method_231(param1: int, param2: Boolean): void {
        var _loc3_: class_420 = !!class_50.getInstance().map ? class_50.getInstance().map.method_5806(param1, class_420) as class_420 : null;
        if (_loc3_) {
            _loc3_.method_244 = param2;
        }
    }

    public function method_63(param1: int, param2: int): void {
        var _loc3_: class_423 = class_50.getInstance().map.effects.method_4909(class_81.userID, class_338.const_459) as class_423;
        if (_loc3_) {
            _loc3_.method_1543(param1, param2);
        }
    }

    public function method_654(): void {
        this.method_4933.method_1963();
        this.method_6480();
        this.name_92(class_126.const_2950);
        this.main.method_4489().writeToLog(class_88.getItem("msg_pet_is_dead"));
    }

    public function method_2560(): void {
        this.name_92(class_126.const_585);
        this.method_4933.method_5978(false);
    }

    public function method_2473(param1: int, param2: int, param3: int, param4: int, param5: int, param6: int, param7: int, param8: int, param9: int, param10: int, param11: int, param12: String): void {
        this.method_4933.method_1033(param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12);
    }

    public function method_3808(param1: Boolean = false): void {
        var _loc2_: class_90 = class_50.getInstance().map;
        if (!_loc2_) {
            return;
        }
        if (this.method_4933.method_1413() != null) {
            this.method_6480();
            this.method_4933.method_4850();
            if (param1) {
                this.name_92(class_126.const_756);
            }
        }
    }

    public function method_6468(param1: int, param2: int, param3: int, param4: int, param5: int, param6: int, param7: int, param8: String, param9: int, param10: int, param11: int, param12: String, param13: int, param14: int): void {
        var _loc15_: class_307 = this.method_1731(param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13, param14);
        if (class_50.getInstance().map == null) {
            return;
        }
        if (this.hero == null) {
            return;
        }
        this.hero.pet = _loc15_;
        this.method_4933.method_5095();
        this.name_92(class_126.const_1920);
        this.method_3410(_loc15_);
    }

    public function method_1188(param1: int, param2: int, param3: int, param4: int, param5: String, param6: int, param7: int, param8: int, param9: String, param10: int, param11: int, param12: int, param13: int, param14: Boolean, param15: Boolean, param16: int): void {
        var _loc17_: * = null;
        var _loc18_: * = null;
        if (class_50.getInstance().map.method_1203().method_3416(param1) == null) {
            _loc17_ = this.method_1731(param3, param4, param1, param2, param11, param12, param13, param5, param8, param6, param7, param9, param10, param16);
            (_loc18_ = this.method_2193(param1)).method_2856 = param14;
            _loc17_.visible = !param14 && !param15;
            if (!param14) {
                this.method_3410(_loc17_);
            }
        }
    }

    public function method_1605(param1: int, param2: Vector.<int>): void {
        this.method_4933.method_3161(param1, param2);
    }

    public function method_5531(param1: int): void {
        this.method_4933.method_2480(param1);
    }

    public function method_432(param1: int, param2: int, param3: int, param4: Boolean): void {
        this.method_4933.method_4042(param1, param2, param3, param4);
    }

    public function method_2886(param1: int, param2: Vector.<int>): void {
        this.method_4933.method_6164(param1, param2);
    }

    public function method_3993(param1: Boolean, param2: class_424): void {
        this.method_4933.method_253(param1, param2);
    }

    public function method_3410(param1: class_307): void {
        class_50.getInstance().map.effects.method_5565(new class_417(param1));
    }

    private function method_6480(): void {
        if (this.hero) {
            class_50.getInstance().map.effects.method_3217(this.hero.id, class_338.const_1305);
            class_50.getInstance().map.effects.method_3217(this.hero.id, class_338.const_459);
        }
    }

    public function method_1731(param1: int, param2: int, param3: int, param4: int, param5: int, param6: int, param7: int, param8: String, param9: int, param10: int, param11: int, param12: String, param13: int, param14: int): class_307 {
        var _loc15_: class_109;
        return (_loc15_ = class_50.getInstance().map.method_1203()).method_1731(param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13, param14);
    }

    public function method_4079(): void {
        this.method_4933.method_5777();
    }

    public function method_4081(param1: int, param2: int): void {
        var _loc3_: * = null;
        if (class_50.getInstance().map == null) {
            return;
        }
        if (this.hero) {
            _loc3_ = this.hero.pet;
            if (_loc3_ != null) {
                _loc3_.hp.hp.value = param1;
                _loc3_.hp.const_3026.value = param2;
                this.method_4933.method_5054(class_91.var_391, param1, param2);
                this.name_92(class_126.const_585);
            }
        }
    }

    public function method_2226(param1: int, param2: int): void {
        this.method_4933.method_5054(class_91.var_4782, param1, param2);
    }

    public function method_1464(param1: Number, param2: Number): void {
        var _loc3_: * = null;
        if (class_50.getInstance().map && class_50.getInstance().map.method_1203() && Boolean(this.hero)) {
            _loc3_ = this.hero.pet;
            if (_loc3_ != null) {
                _loc3_.hp.shield.value = param1;
                _loc3_.hp.maxShield.value = param2;
            }
            this.method_4933.method_5054(class_91.var_4109, param1, param2);
        }
    }

    public function method_4960(param1: int, param2: int): void {
        this.method_4933.method_5054(class_91.var_532, param1, param2);
    }

    public function method_4407(param1: class_418): void {
        var _loc2_: int = int(param1.var_1815);
        this.method_4933.method_1922(_loc2_);
    }

    public function method_280(param1: int, param2: Vector.<int>): void {
        var _loc4_: int = 0;
        var _loc3_: class_421 = this.method_4933.method_4998(param1);
        if (_loc3_ == null) {
            return;
        }
        switch (param1) {
            case class_414.const_326:
            case class_414.const_2580:
            case class_414.const_446:
                break;
            case class_414.const_1994:
            case class_414.const_427:
            case class_414.const_1544:
                _loc4_ = int(param2[0]);
                this.method_4990(param1, _loc4_);
        }
    }

    public function method_4990(param1: int, param2: int): void {
        var _loc3_: class_421 = this.method_4933.method_6129(param1);
        var _loc4_: class_416;
        (_loc4_ = new class_416(_loc3_, param2, _loc3_.tooltip, _loc3_.pattern.languageKey, this.method_4933.method_2508)).method_5646();
    }

    public function name_92(param1: int): void {
        if (false) {
            class_82.playSoundEffect(param1);
        }
    }

    private function method_5084(param1: int, param2: Bitmap): void {
        this.method_6480();
        if (param1 == class_338.const_459) {
            class_50.getInstance().map.effects.method_5565(new class_423(this.hero, param2));
        }
    }

    private function method_1143(): void {
        if (this.hero) {
            class_50.getInstance().map.effects.method_3217(this.hero.id, class_338.const_1305);
            class_50.getInstance().map.effects.method_3217(this.hero.id, class_338.const_459);
        }
    }

    private function get hero(): class_86 {
        return class_50.getInstance().map.hero;
    }

    private function get method_4933(): class_422 {
        if (this.var_1695 == null) {
            this.var_1695 = new class_422(this.main.method_6154(), this.main.method_4489().method_4988());
            this.var_1695.const_694.add(this.method_1143);
            this.var_1695.const_3200.add(this.method_5084);
            this.var_1695.const_873.add(this.sendRequest);
        }
        return this.var_1695;
    }

    private function get tradeWindow(): class_419 {
        if (this.var_58 == null) {
            this.var_58 = new class_419(this.main.method_6154(), this.main.method_4489().method_468(GuiConstants.TRADE_WINDOW));
        }
        return this.var_58;
    }
}
}
