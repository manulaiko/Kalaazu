package package_307 {

import flash.display.BlendMode;

public class class_2448 extends class_1775 {


    private var var_3952: Number = 1;

    public function class_2448(param1: uint = 13421772, param2: Number = 1) {
        super();
        this.color = param1;
        this.alpha = param2;
    }

    public function get alpha(): Number {
        return var_1462.diffuseMethod.method_111;
    }

    public function set alpha(param1: Number): void {
        if (param1 > 1) {
            param1 = 1;
        } else if (param1 < 0) {
            param1 = 0;
        }
        var_1462.diffuseMethod.method_111 = this.var_3952 = param1;
        var_1462.method_4194 = this.method_4490;
        var_1462.method_4125(blendMode == BlendMode.NORMAL && Boolean(this.method_4490) ? "null" : blendMode);
    }

    public function get color(): uint {
        return var_1462.diffuseMethod.method_5048;
    }

    public function set color(param1: uint): void {
        var_1462.diffuseMethod.method_5048 = param1;
    }

    override public function get method_4490(): Boolean {
        return super.method_4490 || this.var_3952 < 1;
    }
}
}
