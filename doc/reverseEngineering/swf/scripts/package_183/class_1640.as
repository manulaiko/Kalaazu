package package_183 {

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;

public class class_1640 extends Condition {


    private var var_3230: int;

    public function class_1640() {
        super();
    }

    override protected function method_153(param1: Vector.<String>): void {
        this.var_3230 = int(param1[0]);
        var_106 = "/" + _target;
        _description = class_88.getItem("q2_condition_undefined_" + class_126.instance.method_1595[this.var_3230]);
    }

    override public function get method_1303(): String {
        return String(_current);
    }
}
}
