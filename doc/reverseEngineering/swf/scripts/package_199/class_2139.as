package package_199 {

import flash.events.Event;

import package_299.class_1757;

public class class_2139 extends Event {

    public static const const_2979: String = "matrixChanged";


    private var var_4129: class_1757;

    public function class_2139(param1: String, param2: class_1757, param3: Boolean = false, param4: Boolean = false) {
        super(param1, param3, param4);
        this.var_4129 = param2;
    }

    public function get lens(): class_1757 {
        return this.var_4129;
    }

    override public function clone(): Event {
        return new class_2139(type, this.var_4129, bubbles, cancelable);
    }
}
}
