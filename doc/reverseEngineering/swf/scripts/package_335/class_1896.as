package package_335 {

import flash.events.Event;

public class class_1896 extends Event {

    public static const const_983: String = "countDownTick";

    public static const const_2754: String = "countDownFinish";


    private var var_1192: int;

    public function class_1896(param1: String, param2: int = 0) {
        super(param1, true);
        this.var_1192 = param2;
    }

    public function get name_11(): int {
        return this.var_1192;
    }

    public function get method_4778(): int {
        return Math.ceil(Number(this.var_1192) / 1000);
    }
}
}
