package package_379 {

import package_200.class_1781;

import package_295.class_1752;

import package_304.class_2114;

import package_445.class_2705;

public class class_2648 extends class_2149 {


    public const const_2560: Vector.<class_2705> = new Vector.<class_2705>();

    private var var_3955: Object;

    public function class_2648(param1: class_2477, param2: Class, param3: class_1781) {
        this.var_3955 = {};
        super(param1, param2, param3);
    }

    override public function set geometry(param1: class_1752): void {
        this.const_2560.length = 0;
        this.var_3955 = {};
        super.geometry = param1;
        changed.dispatch();
    }

    public function method_1144(param1: String): class_2705 {
        return this.var_3955[param1];
    }

    override protected function method_961(param1: class_2114): void {
        if (param1.name.indexOf("engine_") != -1) {
            this.const_2560.push(class_2705.method_5906(param1));
        } else if (param1.name.indexOf("laserpoint_") != -1) {
            this.var_3955[param1.name.slice(11)] = class_2705.method_5906(param1);
        } else if (param1.name.indexOf("light_laser") == -1) {
            if (param1.name.indexOf("light_position") == -1) {
                super.method_961(param1);
            }
        }
    }

    public function get method_3194(): Object {
        return this.var_3955;
    }
}
}
