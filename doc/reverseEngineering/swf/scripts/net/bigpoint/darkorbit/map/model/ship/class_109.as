package net.bigpoint.darkorbit.map.model.ship {

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.gui.class_58;
import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.map.model.traits.class_287;
import net.bigpoint.darkorbit.map.model.traits.class_299;
import net.bigpoint.darkorbit.mvc.events.model.EventProxy;
import net.bigpoint.darkorbit.mvc.mapElements.assets.MapAssetNotification;

import package_100.class_270;
import package_100.class_313;

import package_109.class_376;

import package_112.class_307;

import package_113.class_310;

import package_115.class_316;

import package_129.class_373;
import package_129.class_374;
import package_129.class_377;

import package_130.class_375;

import package_131.class_380;

import package_133.class_383;

import package_17.class_62;

import package_19.class_68;
import package_19.class_70;

import package_22.class_169;
import package_22.class_198;
import package_22.class_222;

import package_29.class_85;

import package_35.class_338;

import package_36.class_184;
import package_36.class_207;

import package_38.class_163;
import package_38.class_381;

import package_44.GroupSystemNotification;

import package_69.class_181;

import package_75.class_379;

import package_9.class_50;

public class class_109 {


    private var var_4918: class_375;

    private var var_1614: class_376;

    private var var_675: class_62;

    public const const_719: class_68 = new class_70(class_86);

    public function class_109() {
        this.var_4918 = new class_375();
        this.var_1614 = new class_376();
        super();
        this.var_675 = class_62.getInstance();
    }

    private function get map(): class_90 {
        return class_50.getInstance().map;
    }

    public function method_765(param1: String, param2: int, param3: int, param4: int, param5: int, param6: String, param7: String, param8: int, param9: int, param10: int, param11: int, param12: Boolean, param13: int, param14: int, param15: Boolean, param16: int = 0, param17: int = 0): class_86 {
        var _loc19_: * = null;
        var _loc21_: int = 0;
        var _loc22_: * = null;
        var _loc23_: * = null;
        this.method_4323(param2);
        var _loc18_: class_316;
        if ((_loc18_ = class_198.var_2667[param1]) == null) {
            _loc18_ = class_198.var_2667["ship_police"];
            param6 = "! SHIP TYPE " + param1 + " NOT DEFINED !";
        }
        var _loc20_: class_380 = param16 > 0 ? new class_380(param16, param17) : null;
        if ((_loc19_ = this.var_4918.method_5001(_loc18_.name_163).method_765(param2, _loc18_, param13, _loc20_) as class_86) == null) {
            return null;
        }
        _loc19_.info.name_148.value = param6;
        _loc19_.speed.value = param5;
        _loc19_.info.name_145.value = param7;
        _loc19_.info.name_32.value = param9;
        _loc19_.info.name_155.value = param10;
        _loc19_.info.factionID.value = param8;
        _loc19_.info.name_140.value = param11;
        _loc19_.isNPC = param15;
        _loc19_.info.const_94.value = param14;
        if (param12) {
            _loc19_.method_2049(class_270);
            _loc19_.addTrait(new class_313("mapIcon_alert"));
        }
        _loc19_.position.setTo(param3, param4, 0);
        this.map.method_4903(_loc19_);
        for each(_loc21_ in _loc19_.shipPattern.effects) {
            switch (_loc21_) {
                case class_338.const_993:
                    this.map.effects.method_5565(new class_377(_loc19_));
                    break;
                case class_338.const_1531:
                    this.map.effects.method_5565(new class_373(_loc19_));
                    break;
                case class_338.const_3170:
                    this.map.effects.method_5565(new class_374(_loc19_));
                    break;
            }
        }
        if (!param15) {
            this.var_675.method_2407(GroupSystemNotification.CHANGE_SHIP_GROUP_STATE, param2);
            if ((_loc22_ = this.var_675.retrieveProxy(EventProxy.NAME) as EventProxy).method_1341(class_381.const_1843)) {
                if ((_loc23_ = _loc22_.method_1576(class_381.const_1843) as class_383).method_3098 == param8) {
                    this.map.effects.method_5565(new class_379(_loc19_));
                }
            }
        }
        if (_loc19_.method_6225()) {
            this.const_719.dispatch(_loc19_);
        }
        return _loc19_;
    }

    public function method_3416(param1: int): class_307 {
        return this.map.method_327(param1) as class_307;
    }

    public function method_1731(param1: int, param2: int, param3: int, param4: int, param5: int, param6: int, param7: int, param8: String, param9: int, param10: int, param11: int, param12: String, param13: int, param14: int, param15: String = ""): class_307 {
        var _loc16_: class_307;
        if ((_loc16_ = this.method_3416(param3)) != null) {
            if (_loc16_.shipPattern.getPatternID() == param1.toString()) {
                return _loc16_ as class_307;
            }
            this.method_4323(param3, false);
        }
        var _loc17_: class_316;
        if ((_loc17_ = class_198.var_2667[param1]) == null) {
            _loc17_ = class_198.var_2667[4];
            param8 = "! PET TYPE " + param1 + " NOT DEFINED !";
        }
        var _loc18_: class_307;
        (_loc18_ = new class_307(param3, _loc17_, param4, param9)).info.name_148.value = param8;
        _loc18_.name_127 = param2;
        _loc18_.info.name_145.value = param12;
        _loc18_.info.name_32.value = param11;
        _loc18_.info.name_155.value = param13;
        _loc18_.info.factionID.value = param10;
        _loc18_.speed.value = param7;
        var _loc19_: class_86;
        if ((_loc19_ = this.map.method_327(param4) as class_86) != null) {
            _loc19_.pet = _loc18_;
            _loc18_.name_166.value = _loc19_.name_166.value;
        }
        _loc18_.position.setTo(param5, param6, 0);
        this.map.method_4903(_loc18_);
        return _loc18_;
    }

    private function get method_20(): class_299 {
        return this.map.method_5806(class_81.userID, class_299) as class_299;
    }

    public function method_4323(param1: int, param2: Boolean = false, param3: int = -1): void {
        var _loc5_: * = null;
        var _loc4_: class_85;
        if ((_loc4_ = this.map.method_327(param1)) != null) {
            if (this.method_20 && this.method_20.target && this.method_20.target.owner.id == _loc4_.id) {
                this.method_20.target = null;
            }
            this.map.effects.method_4748(param1);
            if (param2 && Boolean(_loc4_.method_1954(class_287))) {
                if (param3 == -1) {
                    param3 = int(class_287(_loc4_.method_1954(class_287)).explosionTypeID);
                }
                if ((_loc5_ = class_198.method_1020(class_222.const_273, param3)) != null) {
                    this.map.effects.method_269(new class_184(_loc4_.x, _loc4_.y, _loc4_.z, _loc5_, _loc4_));
                    if (_loc5_.shockwaveId != -1) {
                        this.map.effects.method_269(new class_207(_loc5_.shockwaveId, _loc4_.position.x, _loc4_.position.y, true));
                    }
                }
            }
        }
        this.var_1614.remove(param1);
        this.map.method_918(param1);
        if (Boolean(_loc4_) && param1 == class_81.userID) {
            this.const_719.dispatch(null);
        }
    }

    public function cleanup(): void {
        this.const_719.dispatch(null);
        class_378.method_909();
    }

    public function method_5236(param1: int, param2: int, param3: int, param4: int, param5: int, param6: int, param7: int): class_86 {
        var _loc8_: class_86;
        if ((_loc8_ = this.method_3338() as class_86) != null) {
            if (_loc8_.id != param1) {
                this.map.method_4929.target = null;
            }
        }
        var _loc9_: class_86;
        if ((_loc9_ = this.method_2455(param1)) != null) {
            this.map.method_4929.target = _loc9_;
            _loc9_.hp.hp.value = param2;
            _loc9_.hp.const_3026.value = param3;
            _loc9_.hp.const_2381.value = param6;
            _loc9_.hp.const_805.value = param7;
            _loc9_.hp.shield.value = param4;
            _loc9_.hp.maxShield.value = param5;
        }
        return _loc9_;
    }

    public function method_3459(): void {
        var _loc2_: * = null;
        var _loc1_: class_85 = this.method_3338();
        if (_loc1_ != null) {
            if (this.method_20 && this.method_20.target && this.method_20.target.owner.id == _loc1_.id) {
                _loc2_ = _loc1_.method_1954(class_310) as class_310;
                this.var_675.sendNotification(MapAssetNotification.ABORT_LASER_ATTACK, [true, class_81.userID, true]);
                if (_loc2_) {
                    class_58.instance.writeToLog(class_88.getItem("attstop").replace(/%!/, _loc2_.name_148.value));
                }
            }
        }
    }

    public function method_2455(param1: int): class_86 {
        return !!this.map ? this.map.method_327(param1) as class_86 : null;
    }

    public function method_3338(): class_85 {
        return this.map.method_4929.target;
    }

    public function method_3414(): void {
        var _loc4_: * = null;
        var _loc1_: int = 0;
        var _loc2_: Array = class_181.method_4666([class_163.const_98, class_163.const_225, class_163.const_2375, class_163.const_763, class_163.const_2322, class_163.PROMERIUM, class_163.SEPROM, class_163.PALLADIUM]);
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_.length) {
            _loc4_ = _loc2_[_loc3_];
            _loc1_ += _loc4_.count;
            _loc3_++;
        }
        class_81.const_934.value = _loc1_;
    }

    public function get method_2403(): class_376 {
        return this.var_1614;
    }
}
}
