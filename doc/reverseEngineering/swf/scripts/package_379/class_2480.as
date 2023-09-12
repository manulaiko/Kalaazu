package package_379 {

import flash.utils.Dictionary;
import flash.utils.getQualifiedClassName;

import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;

import package_10.class_20;

import package_200.class_1781;

import package_307.class_1772;
import package_307.class_1776;

import package_308.class_1773;
import package_308.class_1777;

import package_369.class_2116;
import package_369.class_2118;

public class class_2480 {

    private static const const_3275: Dictionary = new Dictionary(true);


    public const const_517: class_20 = new class_20(1);

    private var var_4912: class_1781;

    private var var_891: class_2477;

    private var var_1586: Dictionary;

    private var var_634: Class;

    private var var_42: Vector.<class_1772>;

    private var var_1260: String;

    private var var_830: class_2116;

    private var _normal: class_2116;

    private var var_2344: class_2116;

    private var var_3898: class_2116;

    private var var_760: class_2116;

    private var var_397: Boolean = false;

    public function class_2480(param1: class_2477, param2: class_1781, param3: Class, param4: String) {
        this.var_1586 = new Dictionary(true);
        super();
        this.var_891 = param1;
        this.var_634 = param3;
        this.var_1260 = param4;
        this.var_42 = new Vector.<class_1772>();
        this.const_517.changed.add(this.method_164);
        this.method_4495 = param2;
    }

    public static function method_1034(param1: class_2477, param2: class_1781, param3: Class): class_2480 {
        var _loc4_: String = getQualifiedClassName(param3) + param2.uid + param1.hash;
        if (true) {
            const_3275[_loc4_] = {
                "counter": 0,
                "material": new class_2480(param1, param2, param3, _loc4_)
            };
        }
        const_3275[_loc4_].counter += 1;
        return const_3275[_loc4_].material;
    }

    public static function method_6261(param1: class_2480): void {
        var _loc2_: Object = const_3275[param1.hash];
        if (--_loc2_.counter <= 0) {
            param1.dispose();
            const_3275[param1.hash] = null;
            delete const_3275[param1.hash];
        }
    }

    public function set method_4495(param1: class_1781): void {
        if (this.var_4912) {
            this.var_4912.size.changed.remove(this.method_164);
            this.var_4912.const_2024.changed.remove(this.method_6121);
            this.var_4912.const_2205.changed.remove(this.method_6121);
            this.var_4912.const_556.changed.remove(this.method_6121);
            this.var_4912.smoothing.changed.remove(this.method_4260);
            this.var_4912.mipMapping.changed.remove(this.method_4260);
            this.var_4912 = null;
        }
        this.var_4912 = param1;
        if (this.var_4912) {
            this.var_4912.size.changed.add(this.method_164);
            this.var_4912.const_2024.changed.add(this.method_6121);
            this.var_4912.const_2205.changed.add(this.method_6121);
            this.var_4912.const_556.changed.add(this.method_6121);
            this.var_4912.smoothing.changed.add(this.method_4260);
            this.var_4912.mipMapping.changed.add(this.method_4260);
            this.method_164();
        }
    }

    public function set diffuse(param1: class_2116): void {
        class_1210.instance.method_3562.method_3008(this.var_830);
        this.var_830 = param1;
        class_1210.instance.method_3562.method_4006(this.var_830);
        this.method_4260();
    }

    public function set normal(param1: class_2116): void {
        class_1210.instance.method_3562.method_3008(this._normal);
        this._normal = param1;
        class_1210.instance.method_3562.method_4006(this._normal);
        this.method_4260();
    }

    public function set specular(param1: class_2116): void {
        class_1210.instance.method_3562.method_3008(this.var_2344);
        this.var_2344 = param1;
        class_1210.instance.method_3562.method_4006(this.var_2344);
        this.method_4260();
    }

    public function set glowMap(param1: class_2116): void {
        class_1210.instance.method_3562.method_3008(this.var_3898);
        this.var_3898 = param1;
        class_1210.instance.method_3562.method_4006(this.var_3898);
        this.method_4260();
    }

    public function set alphaMask(param1: class_2116): void {
        class_1210.instance.method_3562.method_3008(this.var_760);
        this.var_760 = param1;
        class_1210.instance.method_3562.method_4006(this.var_760);
        this.method_4260();
    }

    public function method_1034(param1: String): class_1772 {
        var _loc2_: * = null;
        if (this.var_1586[param1] == null) {
            _loc2_ = new this.var_634() as class_1772;
            this.var_1586[param1] = _loc2_;
            this.var_42.push(_loc2_);
            if (Boolean(_loc2_) && Boolean(this.var_891.var_4228)) {
                _loc2_.lightPicker = class_1210.instance.name_10.method_1066;
            }
            this.method_3403(_loc2_);
            return _loc2_;
        }
        return this.var_1586[param1] as class_1772;
    }

    private function method_164(): void {
        this.method_532();
        this.method_6121();
    }

    public function dispose(): void {
        if (this.var_397) {
            return;
        }
        this.var_397 = true;
        this.log("- dispose");
        while (this.var_42.length) {
            this.var_42.pop().dispose();
        }
        this.var_1586 = null;
        this.diffuse = null;
        this.normal = null;
        this.specular = null;
        this.glowMap = null;
        this.alphaMask = null;
        this.method_4495 = null;
    }

    private function method_6121(): void {
        if (this.var_4912.const_2024.value) {
            this.method_5574();
        } else {
            this.normal = null;
        }
        if (this.var_4912.const_2205.value) {
            this.method_237();
        } else {
            this.specular = null;
        }
        if (this.var_4912.const_556.value) {
            this.method_3527();
        } else {
            this.glowMap = null;
        }
        this.method_3979();
    }

    private function method_532(): void {
        this.method_5772();
    }

    private function method_6139(param1: class_2116): void {
        this.diffuse = param1;
        this.method_5772();
    }

    private function method_5772(): void {
        var _loc1_: String = this.method_5628(this.var_891.method_1760, this.var_4912.size.value, "diffuse");
        this.log("- diffuseMapUrl: " + _loc1_);
        this.loadTexture(_loc1_, this.method_5801);
    }

    private function method_5574(): void {
        var _loc1_: String = this.method_5628(this.var_891.method_6221, Number(this.var_4912.size.value) >> 1, "normal");
        this.log("- normalMapUrl: " + _loc1_);
        this.loadTexture(_loc1_, this.method_5575);
    }

    private function method_237(): void {
        var _loc1_: String = this.method_5628(this.var_891.method_2136, Number(this.var_4912.size.value) >> 1, "specular");
        this.log("- specularMapUrl: " + _loc1_);
        this.loadTexture(_loc1_, this.method_6291);
    }

    private function method_3527(): void {
        var _loc1_: String = this.method_5628(this.var_891.method_3301, this.var_4912.size.value, "glow", 512);
        this.log("- glowMapUrl: " + _loc1_);
        this.loadTexture(_loc1_, this.method_5960);
    }

    private function method_3979(): void {
        var _loc1_: String = this.method_5628(this.var_891.method_4979, this.var_4912.size.value, "alpha");
        this.log("- alphaMaskMapUrl: " + _loc1_);
        this.loadTexture(_loc1_, this.method_275);
    }

    private function method_5628(param1: String, param2: int, param3: String, param4: int = 512): String {
        if (Boolean(param1) && param2 > 0) {
            return param1 + "_" + param3 + "_" + Math.max(128, Math.min(param2 * Number(this.const_517.value), param4));
        }
        return null;
    }

    private function loadTexture(param1: String, param2: Function): void {
        if (param1) {
            class_1210.instance.method_3562.loadTexture(param1, class_1210.const_973).addOnce(param2);
        } else {
            param2(null);
        }
    }

    private function method_4260(): void {
        var _loc1_: int = this.var_42.length - 1;
        while (_loc1_ >= 0) {
            this.method_3403(this.var_42[_loc1_]);
            _loc1_--;
        }
    }

    private function method_3403(param1: class_1772): void {
        var _loc2_: * = null;
        if (param1 is class_1776) {
            _loc2_ = param1 as class_1776;
            _loc2_.texture = this.var_830;
            _loc2_.normalMap = this._normal;
            _loc2_.specularMap = this.var_2344;
            _loc2_.specular = !!this.var_4912.const_2205.value ? Number(this.var_891.specular) : Number(this.var_891.var_963);
            _loc2_.gloss = !!this.var_4912.const_2205.value ? Number(this.var_891.gloss) : Number(this.var_891.glossLow);
            _loc2_.blendMode = this.var_891.blendMode;
            _loc2_.alphaBlending = this.var_891.alphaBlending;
            _loc2_.bothSides = this.var_891.materialBothSides;
            _loc2_.alphaPremultiplied = !(this.var_830 is class_2118);
        } else if (param1 is class_1773) {
            class_1773(param1).texture = this.var_830;
        }
        if (param1 is class_1777) {
            class_1777(param1).glowMap = this.var_3898;
            class_1777(_loc2_).alphaMask = this.var_760;
        }
        param1.smooth = this.var_4912.smoothing.value;
        param1.mipmap = this.var_4912.mipMapping.value;
    }

    private function method_5801(param1: class_2116): void {
        this.log("+++ diffuse load complete " + this.var_891.method_522 + ", " + this.var_42.length);
        this.diffuse = param1;
    }

    private function method_5575(param1: class_2116): void {
        this.normal = param1;
    }

    private function method_6291(param1: class_2116): void {
        this.specular = param1;
    }

    private function method_5960(param1: class_2116): void {
        this.glowMap = param1;
    }

    private function method_275(param1: class_2116): void {
        this.alphaMask = param1;
    }

    private function log(param1: String): void {
    }

    public function get hash(): String {
        return this.var_1260;
    }

    public function get method_3545(): Vector.<class_1772> {
        return this.var_42;
    }

    public function get method_4495(): class_1781 {
        return this.var_4912;
    }
}
}
