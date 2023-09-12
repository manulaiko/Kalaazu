package package_372 {

import package_294.class_2133;

import package_304.class_1766;

import package_376.class_2144;

public class class_2590 extends class_2225 {


    private var var_3808: class_2133;

    public function class_2590(param1: class_2133) {
        super(class_1766(param1));
        this.var_3808 = param1;
    }

    override public function method_2995(param1: class_2144): void {
        if (param1.method_4368(this)) {
            super.method_2995(param1);
            param1.method_82(this.var_3808);
        }
    }
}
}
