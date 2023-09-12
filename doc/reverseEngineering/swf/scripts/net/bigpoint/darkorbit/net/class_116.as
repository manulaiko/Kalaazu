package net.bigpoint.darkorbit.net {

import com.bigpoint.utils.class_401;

import flash.utils.Dictionary;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.gui.class_187;
import net.bigpoint.darkorbit.map.model.ship.class_109;
import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.map.model.traits.class_287;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.settings.Settings;

import package_113.class_310;
import package_113.class_405;

import package_116.class_397;

import package_126.class_354;

import package_136.class_394;

import package_22.class_198;
import package_22.class_222;
import package_22.class_339;

import package_27.class_402;
import package_27.class_82;

import package_29.class_85;

import package_33.class_93;

import package_35.Effect;
import package_35.EffectManager;
import package_35.class_338;
import package_35.class_348;

import package_36.class_184;
import package_36.class_399;
import package_36.class_406;

import package_45.class_366;

import package_69.class_407;

import package_72.class_190;

import package_75.class_367;
import package_75.class_395;
import package_75.class_396;
import package_75.class_398;
import package_75.class_400;
import package_75.class_403;
import package_75.class_408;

import package_9.class_50;

public class class_116 extends class_96 {

    private static var instance: class_116;


    private var main: class_9;

    private var var_139: Dictionary;

    public function class_116(param1: Function) {
        super();
        if (param1 !== method_336) {
            throw new Error("MapEventsAssembly is a Singleton and can only be accessed through MapEventsAssembly.getInstance()");
        }
        this.main = var_574;
        this.method_709();
    }

    public static function getInstance(): class_116 {
        if (instance == null) {
            instance = new class_116(method_336);
        }
        return instance;
    }

    private static function method_336(): void {
    }

    private function method_709(): void {
        this.var_139 = new Dictionary();
        this.var_139[class_74.const_13] = this.method_4596;
        this.var_139[class_74.const_1718] = this.method_3509;
        this.var_139[class_74.const_154] = this.method_341;
        this.var_139[class_74.const_282] = this.method_5746;
        this.var_139[class_74.const_113] = this.method_2444;
        this.var_139[class_74.const_2197] = this.method_5712;
        this.var_139[class_74.const_3120] = this.method_3241;
        this.var_139[class_74.const_1577] = this.method_3274;
        this.var_139[class_74.const_3218] = this.method_6222;
        this.var_139[class_74.const_1985] = this.method_4405;
        this.var_139[class_74.const_554] = this.method_2453;
        this.var_139[class_74.const_2711] = this.method_4917;
        this.var_139[class_74.const_944] = this.method_4968;
        this.var_139[class_74.const_898] = this.method_1657;
        this.var_139[class_74.const_723] = this.method_5482;
        this.var_139[class_74.EMP] = this.method_1240;
        this.var_139[class_74.const_369] = this.method_6259;
        this.var_139[class_74.const_3302] = this.method_5177;
        this.var_139[class_74.const_930] = this.method_856;
        this.var_139[class_74.const_491] = this.method_346;
        this.var_139[class_74.const_2806] = this.method_4597;
        this.var_139[class_74.const_1049] = this.method_5212;
        this.var_139[class_74.const_2312] = this.method_2581;
        this.var_139[class_74.const_1928] = this.method_2574;
        this.var_139[class_74.const_2972] = this.method_4025;
        this.var_139[class_74.const_1378] = this.method_372;
        this.var_139[class_74.const_1866] = this.method_516;
        this.var_139[class_74.const_938] = this.method_3421;
        this.var_139[class_74.const_3307] = this.method_291;
        this.var_139[class_74.const_2133] = this.method_124;
        this.var_139[class_74.const_2865] = this.method_5834;
        this.var_139[class_74.const_2994] = this.method_1732;
        this.var_139[class_74.SAB_SHOT] = this.method_3448;
        this.var_139[class_74.const_2332] = this.method_5592;
        this.var_139[class_74.const_1270] = this.method_5592;
        this.var_139[class_74.HEAL_RAY] = this.method_2730;
        this.var_139[class_74.const_1572] = this.method_5263;
        this.var_139[class_74.const_2069] = this.method_4468;
        this.var_139[class_74.const_3205] = this.method_1855;
        this.var_139[class_74.const_2523] = this.method_4807;
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

    private function method_4468(param1: Array): void {
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc2_: int = int(param1[3]);
        var _loc3_: int = int(param1[4]);
        var _loc4_: int = int(param1[5]);
        var _loc5_: Number = Number(param1[6]);
        var _loc6_: Number = Number(param1[7]);
        if (map != null) {
            if ((_loc7_ = map.method_1203().method_2455(_loc2_)) != null) {
                if (!(_loc8_ = _loc7_.method_1954(class_405) as class_405)) {
                    _loc7_.addTrait(_loc8_ = new class_405());
                }
                _loc8_.const_1132.value = _loc3_;
                _loc8_.const_3151.value = _loc4_;
                _loc8_.name_91.value = _loc5_;
                _loc8_.name_50.value = _loc6_;
            }
        }
    }

    private function method_1855(param1: Array): void {
        var _loc3_: * = null;
        var _loc2_: int = int(param1[3]);
        if (map != null) {
            _loc3_ = map.method_1203().method_2455(_loc2_);
            if (_loc3_ != null) {
                _loc3_.method_2049(class_405);
            }
        }
    }

    private function method_1732(param1: Array): void {
        var _loc3_: * = null;
        var _loc2_: int = int(param1[3]);
        if (map != null) {
            _loc3_ = map.method_1203().method_2455(_loc2_);
            if (_loc3_ != null) {
                class_287(_loc3_.method_1954(class_287)).explosionTypeID = 6;
                class_82.playSoundEffect(class_126.const_3316, false, false, _loc3_.x, _loc3_.y, true);
            }
        }
    }

    private function method_3448(param1: Array): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc2_: int = int(param1[3]);
        var _loc3_: int = int(param1[4]);
        if (map != null) {
            _loc4_ = map.method_1203().method_2455(_loc2_);
            _loc5_ = map.method_1203().method_2455(_loc3_);
            map.effects.method_269(new class_406(_loc4_, _loc5_, "sab_shot"));
        }
    }

    private function method_5592(param1: Array): void {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        var _loc5_: * = null;
        if (param1.length == 4) {
            _loc4_ = int(param1[3]);
            if ((_loc5_ = this.main.name_47.map.method_1203().method_2455(_loc4_)) == null) {
                return;
            }
            _loc2_ = int(_loc5_.x);
            _loc3_ = int(_loc5_.y);
        } else {
            if (param1.length != 5) {
                return;
            }
            _loc2_ = int(param1[3]);
            _loc3_ = int(param1[4]);
        }
        map.effects.method_269(new class_367(_loc2_, _loc3_));
        class_82.playSoundEffect(class_126.const_592, false, false, _loc2_, _loc3_, true);
    }

    private function method_2730(param1: Array): void {
        var _loc2_: int = int(param1[3]);
        var _loc3_: int = int(param1[4]);
        if (map != null) {
            map.effects.method_5084(new class_394(2000, map.method_1203().method_2455(_loc2_), map.method_1203().method_2455(_loc3_)));
        }
    }

    private function method_5263(param1: Array): void {
        if (class_50.getInstance().map == null) {
            return;
        }
        var _loc2_: class_109 = class_50.getInstance().map.method_1203();
        var _loc3_: int = int(param1[5]);
        var _loc4_: String = param1[3];
        var _loc5_: String = param1[4];
        var _loc6_: class_86;
        if ((_loc6_ = _loc2_.method_2455(_loc3_)) == null) {
            return;
        }
        var _loc7_: EffectManager = class_50.getInstance().map.effects;
        if (_loc4_ == class_74.const_2267) {
            if (_loc5_ == class_74.const_318) {
                _loc7_.method_5565(new class_396(_loc6_));
            } else if (_loc5_ == class_74.const_3163) {
                _loc7_.method_5565(new class_408(_loc6_));
            } else if (_loc5_ == class_74.const_478) {
                _loc7_.method_5565(new class_403(_loc6_));
            } else if (_loc5_ == class_74.SPEED_BUFF) {
                _loc7_.method_5565(new class_348(class_338.const_1034, _loc6_, Effect.const_2311, new class_339(class_338.const_1034, "speed-buff-effect")));
            } else if (_loc5_ == class_74.const_202) {
                _loc7_.method_5565(new class_348(class_338.SKULL, _loc6_, Effect.const_2311, new class_339(class_338.SKULL, "skull")));
            } else if (_loc5_ == class_74.const_1953 || _loc5_ == class_74.RESPAWN_PROTECTION) {
                _loc7_.method_5565(new class_400(_loc6_));
            } else if (_loc5_ == class_74.const_858) {
                class_82.playSoundEffect(class_126.const_3316, false, false, _loc6_.x, _loc6_.y, true);
            }
        } else if (_loc4_ == class_74.const_2834) {
            if (_loc5_ == class_74.const_318) {
                _loc7_.method_3217(_loc3_, class_338.RAGE);
            } else if (_loc5_ == class_74.const_3163) {
                _loc7_.method_3217(_loc3_, class_338.const_658);
            } else if (_loc5_ == class_74.const_478) {
                _loc7_.method_3217(_loc3_, class_338.const_2409);
            } else if (_loc5_ == class_74.SPEED_BUFF) {
                _loc7_.method_3217(_loc3_, class_338.const_1034);
            } else if (_loc5_ == class_74.const_202) {
                _loc7_.method_3217(_loc3_, class_338.SKULL);
            } else if (_loc5_ == class_74.const_1953 || _loc5_ == class_74.RESPAWN_PROTECTION) {
                _loc7_.method_3217(_loc3_, class_338.INVINCIBILITY);
            }
        }
    }

    private function method_4596(param1: Array): void {
        var _loc2_: Boolean = Boolean(int(param1[4]));
        var _loc3_: int = int(param1[3]);
        if (map == null) {
            return;
        }
        var _loc4_: class_86;
        if ((_loc4_ = map.method_1203().method_2455(_loc3_)) != null) {
            if (_loc2_) {
                this.main.method_4489().writeToLog(class_88.getItem("msg_recovery_of_ceasefire_user").replace(/%nick%/, _loc4_.info.name_148.value));
            } else {
                this.main.method_4489().writeToLog(class_88.getItem("msg_loss_of_ceasefire_user").replace(/%nick%/, _loc4_.info.name_148.value));
            }
        }
    }

    private function method_3509(param1: Array): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc2_: int = int(param1[3]);
        var _loc3_: int = int(param1[4]);
        _loc4_ = class_88.getItem(param1[5]);
        if (param1[6] != undefined) {
            _loc4_ = (_loc5_ = class_401.method_26(param1[6])).replace(_loc4_);
        }
        if (_loc3_ == 1) {
            switch (_loc2_) {
                case 2:
                    this.main.method_4489().writeToLog(_loc4_, class_187.const_413);
                    break;
                case 4:
                    this.main.method_4489().writeToLog(_loc4_, class_187.const_413);
                    this.main.method_4489().method_4761(_loc4_);
                    break;
                default:
                    this.main.method_4489().method_4761(_loc4_);
            }
        } else {
            switch (_loc2_) {
                case 2:
                    this.main.method_4489().writeToLog(_loc4_, class_187.const_413);
                    break;
                case 3:
                    this.main.method_4489().method_6055(_loc4_);
                    break;
                default:
                    this.main.method_4489().writeToLog(_loc4_);
            }
        }
    }

    private function method_4807(param1: Array): void {
        var _loc2_: String = class_88.getItem(param1[3]);
        this.main.method_4489().method_4761(_loc2_);
        var _loc3_: int = int(class_402.map[param1[3]]);
        class_82.playSoundEffect(_loc3_);
    }

    private function method_341(param1: Array): void {
        var _loc4_: * = null;
        var _loc2_: int = int(param1[3]);
        var _loc3_: int = int(param1[4]);
        if (_loc3_ != class_81.userID) {
            if (map != null) {
                if ((_loc4_ = map.method_1203().method_2455(_loc2_)) != null && !_loc4_.name_166.value) {
                    (_loc4_.method_1954(class_287) as class_287).lockType.value = class_287.const_914;
                }
            }
        }
    }

    private function method_5746(param1: Array): void {
        var _loc3_: * = null;
        var _loc2_: int = int(param1[3]);
        if (map != null) {
            _loc3_ = map.method_1203().method_2455(_loc2_);
            if (_loc3_ != null) {
                (_loc3_.method_1954(class_287) as class_287).lockType.value = class_287.const_1101;
            }
        }
    }

    private function method_2444(param1: Array): void {
        var _loc4_: * = null;
        var _loc2_: int = int(param1[3]);
        var _loc3_: Boolean = Boolean(int(param1[4]));
        if (map != null) {
            if ((_loc4_ = map.method_1203().method_2455(_loc2_)) != null) {
                _loc4_.cloaked.value = _loc3_;
            }
        }
    }

    private function method_5712(param1: Array): void {
        var _loc5_: int = 0;
        var _loc6_: * = null;
        var _loc7_: int = 0;
        var _loc8_: * = null;
        if (map == null) {
            return;
        }
        var _loc2_: int = int(param1[3]);
        var _loc3_: class_86 = map.method_1203().method_2455(_loc2_);
        if (_loc3_ == null) {
            return;
        }
        var _loc4_: * = [];
        if ((param1.length - 4) % 3 == 0) {
            _loc5_ = 4;
            while (_loc5_ < param1.length) {
                _loc6_ = [param1[_loc5_], param1[_loc5_ + 1], param1[_loc5_ + 2]];
                _loc4_.push(_loc6_);
                _loc5_ += 3;
            }
        } else {
            if (class_397.var_63[int(param1[4])] != null) {
                _loc3_.drones.const_1693.value = int(param1[4]);
            }
            _loc7_ = 5;
            while (_loc7_ < param1.length) {
                _loc8_ = [param1[_loc7_], param1[_loc7_ + 1], param1[_loc7_ + 2]];
                _loc4_.push(_loc8_);
                _loc7_ += 3;
            }
        }
        _loc3_.drones.method_6489(_loc4_);
    }

    private function method_3241(param1: Array): void {
        var _loc2_: int = int(param1[3]);
        var _loc3_: Array = String(param1[4]).split("/");
        var _loc4_: int = int(_loc3_[0]);
        var _loc5_: int = int(_loc3_[1]);
        var _loc6_: int = int(_loc3_[2]);
    }

    private function method_3274(param1: Array): void {
        this.main.name_47.minimap.method_598(int(param1[3]));
    }

    private function method_6222(param1: Array): void {
        var _loc2_: int = int(param1[3]);
        Settings.enemyCount.value = _loc2_;
    }

    private function method_4405(param1: Array): void {
        var _loc3_: int = 0;
        var _loc2_: class_109 = map.method_1203();
        if (param1[3] != "start" && param1[3] != "end") {
            _loc3_ = 3;
        } else {
            _loc3_ = 4;
        }
        var _loc4_: int = parseInt(param1[_loc3_]);
        var _loc5_: class_86 = _loc2_.method_2455(_loc4_);
        var _loc6_: EffectManager = class_50.getInstance().map.effects;
        if (param1[3] == "end") {
            _loc6_.method_3217(_loc4_, class_338.const_1278);
        } else {
            _loc6_.method_5565(new class_395(_loc5_));
        }
    }

    private function method_2453(param1: Array): void {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc2_: int = int(param1[4]);
        var _loc3_: int = int(param1[3]);
        var _loc4_: String = param1[5];
        if (map != null) {
            if (_loc5_ = map.method_1203().method_2455(_loc3_)) {
                _loc6_ = class_126.instance.method_2829(_loc4_);
                _loc5_.info.const_1670.value = _loc6_;
            }
        }
    }

    private function method_4917(param1: Array): void {
        var _loc3_: * = null;
        var _loc2_: int = int(param1[3]);
        if (map != null) {
            _loc3_ = map.method_5806(_loc2_, class_310) as class_310;
            if (_loc3_ != null) {
                _loc3_.const_1670.value = null;
            }
        }
    }

    private function method_4968(param1: Array): void {
        var _loc5_: * = null;
        var _loc2_: String = param1[3];
        var _loc3_: int = int(param1[4]);
        var _loc4_: * = _loc3_ == class_81.userID;
        if (map != null) {
            if ((_loc5_ = map.method_1203().method_2455(_loc3_)) != null) {
                switch (_loc2_) {
                    case class_74.const_553:
                        if (_loc4_) {
                            this.main.method_4489().writeToLog(class_88.getItem("msg_arms_harmed"));
                            break;
                        }
                        break;
                    case class_74.const_373:
                        if (_loc4_) {
                            this.main.method_4489().writeToLog(class_88.getItem("msg_arms_recovered"));
                            break;
                        }
                }
            }
        }
    }

    private function method_1657(param1: Array): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc2_: int = int(param1[3]);
        if (map != null) {
            if ((_loc4_ = map.method_1203().method_2455(_loc2_)) != null) {
                _loc5_ = class_198.method_1020(class_222.const_2465, 0);
                map.effects.method_269(new class_184(_loc4_.x, _loc4_.y, _loc4_.z, _loc5_, _loc4_));
            }
        }
    }

    private function method_5482(param1: Array): void {
        var _loc3_: * = null;
        var _loc2_: int = int(param1[3]);
        if (map != null) {
            _loc3_ = map.method_1203().method_2455(_loc2_);
            if (_loc3_ != null) {
                map.effects.method_269(new class_398(_loc3_));
            }
        }
    }

    private function method_1240(param1: Array): void {
        var _loc2_: int = int(param1[3]);
        if (map != null) {
            map.effects.method_269(new class_399(map.method_327(_loc2_), false));
        }
    }

    private function method_6259(param1: Array): void {
        class_119.getInstance().method_3891(param1);
    }

    private function method_5177(param1: Array): void {
    }

    private function method_124(param1: Array): void {
        var _loc2_: String = param1[3];
        if (map != null) {
            class_354(map.method_3454(_loc2_)).bang();
            map.method_3420(_loc2_);
        }
    }

    private function method_5834(param1: Array): void {
        var _loc3_: int = 0;
        var _loc4_: * = null;
        var _loc2_: String = param1[3];
        switch (_loc2_) {
            case class_74.const_1825:
                _loc3_ = int(param1[4]);
                if (false && class_81.var_121.var_3580 != null) {
                    if ((_loc4_ = class_81.var_121.var_3580[_loc3_] as class_190) != null) {
                        delete class_81.var_121.var_3580[_loc3_];
                        this.main.method_4489().method_1917(_loc3_);
                        break;
                    }
                    break;
                }
        }
    }

    public function method_856(param1: Array): void {
        var _loc2_: int = int(param1[3]);
        var _loc3_: int = int(param1[4]);
        var _loc4_: String = (_loc4_ = (_loc4_ = class_88.getItem("booster_found")).replace("%BOOSTERNAME%", class_126.instance.var_1638[_loc2_])).replace("%HOURS%", _loc3_);
        this.main.method_4489().writeToLog(_loc4_);
    }

    private function method_346(param1: Array): void {
        var _loc2_: String = param1[3];
        var _loc3_: class_407 = map.method_3454(_loc2_) as class_407;
        if (_loc3_) {
            _loc3_.fire();
            map.removeEntity(_loc3_);
        }
    }

    private function method_4597(param1: Array): void {
        var _loc3_: * = null;
        var _loc2_: int = 3;
        while (_loc2_ < param1.length) {
            _loc3_ = param1[_loc2_];
            class_407(map.method_3454(_loc3_)).fire();
            map.method_3420(_loc3_);
            _loc2_++;
        }
    }

    private function method_5212(param1: Array): void {
        var _loc2_: int = int(param1[3]);
        var _loc3_: int = int(param1[4]);
        var _loc4_: int = int(param1[5]);
        var _loc5_: int = int(param1[6]);
        var _loc6_: int = int(param1[7]);
        this.main.method_4489().method_5665([_loc2_, _loc3_, _loc4_]);
        this.main.method_4489().method_5807(_loc6_, _loc5_);
    }

    private function method_2581(param1: Array): void {
        var _loc2_: int = int(param1[3]);
        var _loc3_: int = int(param1[4]);
        var _loc4_: int = int(param1[5]);
        this.main.method_4489().method_2694(GuiConstants.SPACEBALL_WINDOW, class_93.const_752, _loc2_, _loc3_);
        class_366(map.method_327(_loc4_)).jump(2);
    }

    private function method_2574(param1: Array): void {
        var _loc2_: int = int(param1[3]);
        var _loc3_: int = int(param1[4]);
        this.main.method_4489().method_5807(_loc2_, _loc3_);
    }

    private function method_4025(param1: Array): void {
        var _loc2_: int = int(param1[3]);
        var _loc3_: int = int(param1[4]);
        var _loc4_: int = int(param1[5]);
        var _loc5_: int = int(param1[6]);
        this.main.method_4489().method_3927([_loc2_, _loc3_, _loc4_]);
        this.main.method_4489().method_4691(_loc5_);
    }

    private function method_372(param1: Array): void {
        var _loc2_: int = int(param1[3]);
        var _loc3_: int = int(param1[4]);
        this.main.method_4489().method_2694(GuiConstants.INVASION_WINDOW, class_93.const_2114, _loc2_, _loc3_);
    }

    private function method_516(param1: Array): void {
        var _loc2_: int = int(param1[3]);
        this.main.method_4489().method_4691(_loc2_);
    }

    private function method_3421(param1: Array): void {
        if (map != null) {
            map.method_4000().method_105(param1);
        }
    }

    private function method_291(param1: Array): void {
        class_112.getInstance().method_3891(param1);
    }

    public function method_4432(param1: int): void {
        var _loc2_: String = class_88.getItem("oksammel");
        _loc2_ = _loc2_.replace(/%!/, class_126.instance.method_6484[param1]);
        this.main.method_4489().writeToLog(_loc2_);
    }
}
}
