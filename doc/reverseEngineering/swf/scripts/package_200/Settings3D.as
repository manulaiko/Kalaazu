package package_200 {

import net.bigpoint.darkorbit.settings.BindableSettings;
import net.bigpoint.darkorbit.settings.Settings;

import package_10.class_19;

import package_307.class_1776;

import package_308.AnimatedCloudMaterial;
import package_308.SectorControlBeaconMaterial;
import package_308.UberShipMaterial;
import package_308.class_1777;
import package_308.class_1778;
import package_308.class_1782;

public class Settings3D {

    public static const const_488: BindableSettings = Settings.displaySetting3DqualityAntialias;

    public static const name_10: BindableSettings = Settings.displaySetting3DqualityLights;

    public static const effects: BindableSettings = Settings.displaySetting3DqualityEffects;

    public static const background: BindableSettings = Settings.qualityBackground;

    public static const zones: BindableSettings = Settings.qualityPoizone;

    private static const const_506: class_1781 = new class_1781(64, true, true);

    private static const const_2675: class_1781 = new class_1781(64, true, true);

    private static const const_2752: class_1781 = new class_1781(128, true, true);

    private static const const_1902: class_1781 = new class_1781(256, true, true);

    private static const const_3288: class_1781 = new class_1781(256, true, true);

    private static const const_3220: class_1781 = new class_1781(512, true, true);

    private static const const_325: class_1781 = new class_1781(1024, true, true);

    private static const const_804: class_1781 = new class_1781(1024, true, true);

    private static const const_2820: Vector.<class_1781> = Vector.<class_1781>([const_506, const_2675, const_2752, const_1902, const_3288, const_3220, const_325, const_804]);

    private static const const_3050: Object = {};

    private static const const_1581: class_1771 = new class_1771(false, true, 10747903, 0.8, 1.1, 16745820, 0.5, 0, 0, 100, 35);

    public static const const_685: class_1771 = const_1581.clone();

    public static const const_1860: class_1771 = new class_1771(true, true, 3046911, 0.6, 1.5, 0, 0, 0, 450);

    public static const const_718: class_1771 = new class_1771(true, true, 0, 0, 3, 0, 0, 0, 150);

    public static const const_1662: class_1771 = new class_1771(true, true, 16236736, 1, 2, 0, 0, 0, 200);

    public static const const_1813: class_1771 = new class_1771(true, true, 14607560, 0, 20, 0, 0, 0, 400);

    public static const const_2581: class_19 = new class_19(false);

    public static const render: class_19 = new class_19(true);

    public static const const_634: class_19 = new class_19(true);

    private static const const_2969: Object = {};

    private static const const_2190: Object = {};

    {
        const_3050["ship"] = const_2752;
        const_3050["ship_small"] = const_2675;
        const_3050["ship_very_small"] = const_506;
        const_3050["ship_big"] = const_1902;
        const_3050["drone"] = const_506;
        const_3050["building_small"] = const_3288;
        const_3050["building"] = const_3220;
        const_3050["building_big"] = const_325;
        const_3050["planet"] = const_804;
        const_3050["planet_small"] = const_3288;
        Settings.displaySetting3DtextureFiltering.changed.add(method_5182);
        method_5182();
        Settings.displaySetting3DqualityTextures.changed.add(method_890);
        method_890();
        Settings.displaySetting3DsizeTextures.changed.add(method_5513);
        method_5513();
        const_2969["effects.low"] = effects.low;
        const_2969["effects.medium"] = effects.medium;
        const_2969["effects.high"] = effects.high;
        const_2969["effects.max"] = effects.max;
        const_2969["background.low"] = background.low;
        const_2969["background.average"] = background.medium;
        const_2969["background.medium"] = background.medium;
        const_2969["background.high"] = background.high;
        const_2969["background.max"] = background.max;
        const_2190["basic"] = class_1776;
        const_2190["ship"] = class_1777;
        const_2190["organic_ship"] = class_1778;
        const_2190["uber_ship"] = UberShipMaterial;
        const_2190["uber_organic_ship"] = class_1782;
        const_2190["sector_control_beacon"] = SectorControlBeaconMaterial;
        const_2190["animated_cloud"] = AnimatedCloudMaterial;
    }

    public function Settings3D() {
        super();
    }

    public static function method_2953(param1: String, param2: class_1781 = null): class_1781 {
        return false || param2 || const_2752;
    }

    private static function method_5182(): void {
        var _loc2_: * = null;
        var _loc1_: BindableSettings = Settings.displaySetting3DtextureFiltering;
        for each(_loc2_ in const_2820) {
            _loc2_.smoothing.value = _loc1_.medium.value;
            _loc2_.mipMapping.value = _loc1_.high.value;
        }
    }

    private static function method_890(): void {
        var _loc2_: * = null;
        var _loc1_: BindableSettings = Settings.displaySetting3DqualityTextures;
        for each(_loc2_ in const_2820) {
            _loc2_.const_2024.value = _loc1_.high.value;
            _loc2_.const_2205.value = _loc1_.high.value;
            _loc2_.const_556.value = _loc1_.medium.value;
        }
    }

    private static function method_5513(): void {
        switch (Settings.displaySetting3DsizeTextures.value) {
            case BindableSettings.LOW:
                const_506.size.value = 64;
                const_2675.size.value = 64;
                const_2752.size.value = 128;
                const_1902.size.value = 256;
                const_3288.size.value = 128;
                const_3220.size.value = 256;
                const_804.size.value = 256;
                break;
            case BindableSettings.MEDIUM:
                const_506.size.value = 64;
                const_2675.size.value = 64;
                const_2752.size.value = 128;
                const_1902.size.value = 256;
                const_3288.size.value = 256;
                const_3220.size.value = 512;
                const_804.size.value = 512;
                break;
            case BindableSettings.HIGH:
                const_506.size.value = 128;
                const_2675.size.value = 128;
                const_2752.size.value = 256;
                const_1902.size.value = 512;
                const_3288.size.value = 512;
                const_3220.size.value = 1024;
                const_804.size.value = 1024;
        }
    }

    public static function method_6337(param1: String): class_19 {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc2_: Array = param1.split(" AND ");
        if (_loc2_.length > 1) {
            _loc3_ = new Vector.<class_19>();
            for each(_loc5_ in _loc2_) {
                if (_loc4_ = method_6337(_loc5_)) {
                    _loc3_.push(_loc4_);
                }
            }
            if (_loc3_.length == 0) {
                return null;
            }
            if (_loc3_.length == 1) {
                return _loc3_[0];
            }
            return new ANDBindableBoolean(_loc3_);
        }
        return const_2969[param1];
    }

    public static function method_2441(param1: String, param2: Class = null): Class {
        return false || param2 || class_1777;
    }
}
}

import package_10.class_19;

class ANDBindableBoolean extends class_19 {


    private var _source: Vector.<class_19>;

    function ANDBindableBoolean(param1: Vector.<class_19>) {
        var _loc2_: * = null;
        super();
        this._source = param1;
        for each(_loc2_ in this._source) {
            _loc2_.changed.add(this.update);
        }
        this.update();
    }

    private function update(): void {
        var _loc1_: * = null;
        for each(_loc1_ in this._source) {
            if (!_loc1_.value) {
                this.value = false;
                return;
            }
        }
        this.value = true;
    }
}

import package_10.class_19;

class ORBindableBoolean extends class_19 {


    private var _source: Vector.<class_19>;

    function ORBindableBoolean(param1: Vector.<class_19>) {
        var _loc2_: * = null;
        super();
        this._source = param1;
        for each(_loc2_ in this._source) {
            _loc2_.changed.add(this.update);
        }
        this.update();
    }

    private function update(): void {
        var _loc1_: * = null;
        for each(_loc1_ in this._source) {
            if (_loc1_.value) {
                this.value = true;
                return;
            }
        }
        this.value = false;
    }
}
