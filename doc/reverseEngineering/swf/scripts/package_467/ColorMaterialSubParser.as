package package_467 {

import away3d.arcane;

import package_307.class_1772;
import package_307.class_2448;

import package_466.class_2598;

public class ColorMaterialSubParser extends class_2596 {


    private var var_2341: class_2448;

    public function ColorMaterialSubParser() {
        this.var_2341 = new class_2448();
        super();
    }

    public static function get identifier(): * {
        return class_2598.ColorMaterialSubParser;
    }

    override public function method_5169(param1: *, param2: Number = 30): void {
        super.method_5169(param1, param2);
    }

    override protected function method_196(): Boolean {
        if (super.method_196() == const_2361) {
            this.var_2341.color = _data.color;
            this.var_2341.alpha = _data.alpha;
            this.var_2341.bothSides = var_1273;
            this.var_2341.blendMode = _blendMode;
            this.var_2341.alphaPremultiplied = false;
            return const_2361;
        }
        return const_2971;
    }

    override public function get material(): class_1772 {
        return this.var_2341;
    }
}
}
