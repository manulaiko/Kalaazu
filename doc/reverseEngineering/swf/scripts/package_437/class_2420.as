package package_437 {

import away3d.arcane;

import flash.net.URLRequest;

import package_293.class_1751;

import package_366.class_2108;

import package_368.class_2416;

public class class_2420 extends class_2416 {


    private var var_750: Boolean;

    private var var_3666: Boolean;

    private var var_2145: String;

    public function class_2420(param1: String, param2: URLRequest, param3: *, param4: class_2108, param5: Boolean = false, param6: Boolean = false) {
        var _loc8_: * = null;
        this.var_2145 = param2.url;
        var _loc7_: Vector.<class_1751>;
        if (_loc7_ = param4.root.arcane::method_780(param2.url)) {
            this.var_3666 = true;
            param5 = true;
            param3 = true;
        }
        super(param1, param2, param3, param4, param5, param6);
        if (this.var_3666) {
            for each(_loc8_ in _loc7_) {
                assets.push(_loc8_);
            }
        }
    }

    override public function method_5358(): void {
        if (!this.var_750) {
            if (!this.var_3666) {
                class_2108(method_5396).root.arcane::addAssets(this.var_2145, assets);
            }
            this.var_750 = true;
            super.method_5358();
        }
    }
}
}
