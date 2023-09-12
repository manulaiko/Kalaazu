package package_262 {

import flash.display.Bitmap;

import net.bigpoint.darkorbit.class_126;

import package_33.class_93;

import package_39.class_1052;
import package_39.class_1561;

import package_83.class_1926;

import package_9.ResourceManager;

public class class_1928 {


    private var var_2203: class_1052;

    private var var_2849: class_1561;

    public function class_1928(param1: class_93) {
        super();
        this.var_2849 = new class_1561();
        this.var_2849.var_4104 = false;
        this.var_2849.var_3145 = class_1926.const_315;
        this.var_2849.var_882 = class_1561.TEXTLAYOUT_VALUE_OF_TOTLA;
        this.var_2203 = new class_1052(0, null, this.var_2849);
        this.var_2203.method_177();
        this.var_2203.method_3166();
        this.decorate(param1);
    }

    private function decorate(param1: class_93): void {
        param1.addElement(this.var_2203);
    }

    public function method_6076(param1: int): void {
        this.var_2849.barColor = class_126.instance.method_6115[param1];
        this.method_6314(param1);
    }

    public function method_6314(param1: int): void {
        var _loc2_: Bitmap = ResourceManager.getBitmap("icons", "fraction" + param1);
        this.var_2203.method_467(_loc2_);
    }

    public function get method_651(): class_1052 {
        return this.var_2203;
    }
}
}
