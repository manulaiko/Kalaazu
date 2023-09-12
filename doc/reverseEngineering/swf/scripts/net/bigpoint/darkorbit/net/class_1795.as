package net.bigpoint.darkorbit.net {

import com.bigpoint.utils.class_73;

import flash.utils.Dictionary;

import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.settings.Settings;

import package_120.class_431;

import package_125.class_352;

import package_14.class_52;

import package_17.class_62;

import package_267.SectorControlProxy;

import package_36.class_1819;

import package_37.class_363;

import package_38.class_445;
import package_38.class_868;

import package_9.class_50;

public class class_1795 extends class_96 implements class_52 {

    private static var instance: class_1795;


    private var main: class_9;

    private var var_139: Dictionary;

    private var var_1611: int;

    private var var_1060: Number = 0;

    public function class_1795() {
        super();
        if (instance) {
            throw new Error("Singleton and can only access with POIAssembly.getInstance()");
        }
        this.main = var_574;
        this.method_709();
    }

    public static function getInstance(): class_1795 {
        if (instance == null) {
            instance = new class_1795();
        }
        return instance;
    }

    private function method_709(): void {
        this.var_139 = new Dictionary();
        this.var_139[class_74.const_1973] = this.method_3032;
        this.var_139[class_74.const_205] = this.method_407;
        this.var_139[class_74.const_331] = this.method_1991;
        this.var_139[class_74.const_2479] = this.method_1065;
        this.var_139[class_74.const_305] = this.method_4686;
    }

    public function method_5080(param1: Array): void {
        var _loc2_: String = param1[2];
        if (this.var_139[_loc2_] != null) {
            this.var_139[_loc2_](param1);
        }
    }

    public function method_3032(param1: String, param2: String, param3: String, param4: int, param5: Boolean, param6: Boolean, param7: String, param8: Vector.<class_73>, param9: Number = NaN): void {
        var _loc10_: * = null;
        var _loc11_: int = 0;
        if (this.map != null) {
            _loc10_ = this.map.method_2402.method_5711(param1, param2, param3, param4, param7, param5, param6, param8, param9);
            if (param2 == class_431.const_16) {
                _loc11_ = 0;
                (class_62.getInstance().retrieveProxy(SectorControlProxy.NAME) as SectorControlProxy).method_664(param1, _loc11_);
                class_363.execute(new class_868(new class_445(class_445.const_1417), "", 0, "", _loc11_, 0, 0, _loc10_.position.x, _loc10_.position.y, 0, false, false, false, false, null, null));
            }
        }
    }

    public function method_1991(param1: String): void {
        if (this.map != null) {
            this.map.method_2402.method_2368(param1);
        }
    }

    public function method_407(): void {
        if (this.map != null) {
            this.map.method_2402.ready.dispatch();
        }
    }

    private function method_1065(param1: Array): void {
        if (param1[3] == class_74.const_2598) {
            this.var_1611 = param1[4];
            class_50.method_5621(this);
        }
    }

    private function method_4686(param1: Array): void {
        if (param1[3] == class_74.const_2598) {
            this.var_1611 = param1[4];
            class_50.removeObserver(this);
        }
    }

    public function updateTimer(param1: Number): void {
        var _loc2_: * = null;
        this.var_1060 += param1;
        if (this.var_1060 > 1999) {
            if (Settings.qualityExplosion.value == Settings.QUALITY_HIGH && Settings.autoQualityReduction.value < Settings.AQ_LOW_EXPLOSION_DETAIL_LIMIT && Settings.autoQualityReduction.value < Settings.AQ_NO_EXPLOSION_LIMIT) {
                _loc2_ = class_50.getInstance().map.method_1203().method_2455(this.var_1611);
                this.map.effects.method_269(new class_1819(_loc2_, class_352.LASER));
            }
            this.var_1060 = 0;
        }
    }

    public function method_2980(): void {
        class_50.removeObserver(this);
    }

    private function get map(): class_90 {
        return class_50.getInstance().map;
    }
}
}
