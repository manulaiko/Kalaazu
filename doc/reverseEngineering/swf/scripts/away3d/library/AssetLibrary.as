package away3d.library {

import away3d.arcane;

import flash.net.URLRequest;

import package_293.class_1751;

import package_366.class_2105;

import package_368.class_2110;
import package_368.class_2409;
import package_368.class_2412;

import package_432.class_2410;

import package_433.class_2411;

public class AssetLibrary {

    arcane static var _instances: Object = {};


    public function AssetLibrary(param1: AssetLibrarySingletonEnforcer) {
        super();
        param1 = param1;
    }

    public static function method_788(param1: String = "default"): AssetLibraryBundle {
        return AssetLibraryBundle.getInstance(param1);
    }

    public static function method_605(param1: Class): void {
        class_2412.method_605(param1);
    }

    public static function method_2343(param1: Vector.<Class>): void {
        class_2412.method_2343(param1);
    }

    public static function get method_2201(): class_2411 {
        return method_788().method_2201;
    }

    public static function set method_2201(param1: class_2411): void {
        method_788().method_2201 = param1;
    }

    public static function get method_4175(): String {
        return method_788().method_4175;
    }

    public static function set method_4175(param1: String): void {
        method_788().method_4175 = param1;
    }

    public static function method_850(param1: String = null, param2: String = null, param3: Function = null): class_2410 {
        return method_788().method_850(param1, param2, param3);
    }

    public static function load(param1: URLRequest, param2: class_2110 = null, param3: String = null, param4: class_2105 = null): class_2409 {
        return method_788().load(param1, param2, param3, param4);
    }

    public static function loadData(param1: *, param2: class_2110 = null, param3: String = null, param4: class_2105 = null): class_2409 {
        return method_788().loadData(param1, param2, param3, param4);
    }

    public static function method_2832(): void {
        method_788().method_6365();
    }

    public static function method_2945(param1: String, param2: String = null): class_1751 {
        return method_788().method_2945(param1, param2);
    }

    public static function addEventListener(param1: String, param2: Function, param3: Boolean = false, param4: int = 0, param5: Boolean = false): void {
        method_788().addEventListener(param1, param2, param3, param4, param5);
    }

    public static function removeEventListener(param1: String, param2: Function, param3: Boolean = false): void {
        method_788().removeEventListener(param1, param2, param3);
    }

    public static function hasEventListener(param1: String): Boolean {
        return method_788().hasEventListener(param1);
    }

    public static function willTrigger(param1: String): Boolean {
        return method_788().willTrigger(param1);
    }

    public static function method_4427(param1: class_1751): void {
        method_788().method_4427(param1);
    }

    public static function method_308(param1: class_1751, param2: Boolean = true): void {
        method_788().method_308(param1, param2);
    }

    public static function method_3521(param1: String, param2: String = null, param3: Boolean = true): class_1751 {
        return method_788().method_3521(param1, param2, param3);
    }

    public static function method_5663(param1: Boolean = true): void {
        method_788().method_5663(param1);
    }

    public static function method_5220(param1: String = null, param2: Boolean = true): void {
        method_788().method_5220(param1, param2);
    }
}
}

class AssetLibrarySingletonEnforcer {


    function AssetLibrarySingletonEnforcer() {
        super();
    }
}
