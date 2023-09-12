package away3d.animators {

import flash.utils.*;

import package_293.*;

import package_374.*;

import package_431.*;

public class class_2438 extends class_1749 implements class_1751 {


    private var var_3182: Boolean;

    private var var_3727: Vector.<class_2405>;

    private var var_4704: Vector.<String>;

    private var var_76: Dictionary;

    public function class_2438() {
        this.var_3727 = new Vector.<class_2405>();
        this.var_4704 = new Vector.<String>();
        this.var_76 = new Dictionary(true);
        super();
    }

    protected function method_1578(param1: Vector.<String>, param2: String = null): String {
        var _loc3_: Number = 0;
        var _loc4_: * = null;
        while (true) {
            _loc4_ = "vt" + _loc3_;
            if (param1.indexOf(_loc4_) == -1 && param2 != _loc4_) {
                break;
            }
            _loc3_++;
        }
        return _loc4_;
    }

    public function get method_3822(): Boolean {
        return this.var_3182;
    }

    public function method_4843(): void {
        this.var_3182 = false;
    }

    public function method_3534(): void {
        this.var_3182 = true;
    }

    public function get assetType(): String {
        return class_2131.const_2058;
    }

    public function get method_939(): Vector.<class_2405> {
        return this.var_3727;
    }

    public function get method_3526(): Vector.<String> {
        return this.var_4704;
    }

    public function method_294(param1: String): Boolean {
        return this.var_76[param1] != null;
    }

    public function method_1957(param1: String): class_2405 {
        return this.var_76[param1];
    }

    public function addAnimation(param1: class_2405): void {
        if (this.var_76[param1.name]) {
            throw new class_2603("root node name \'" + param1.name + "\' already exists in the set");
        }
        this.var_76[param1.name] = param1;
        this.var_3727.push(param1);
        this.var_4704.push(param1.name);
    }

    public function dispose(): void {
    }
}
}
