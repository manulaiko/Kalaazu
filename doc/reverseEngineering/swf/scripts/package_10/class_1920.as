package package_10 {

import flash.utils.clearInterval;
import flash.utils.setInterval;

public class class_1920 extends class_1179 {


    private var var_2914: Number;

    private var _stepSize: Number;

    private var var_1431: uint = 0;

    public function class_1920(param1: Number = 0, param2: Number = 1000, param3: Number = 0, param4: Number = 1) {
        super(param1, param3);
        this.var_2914 = param2;
        this._stepSize = param4;
        changed.add(this.method_6146);
        this.method_6146();
    }

    private function method_6146(): void {
        if (value > minValue) {
            if (this.var_1431 == 0) {
                this.var_1431 = setInterval(this.method_4411, this.var_2914);
            }
        } else {
            clearInterval(this.var_1431);
            this.var_1431 = 0;
        }
    }

    private function method_4411(): void {
        value -= this._stepSize;
    }
}
}
