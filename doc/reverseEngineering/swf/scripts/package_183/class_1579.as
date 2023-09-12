package package_183 {

import net.bigpoint.as3toolbox.bplocale.class_88;

public class class_1579 extends Condition {


    public function class_1579() {
        super();
    }

    override protected function method_153(param1: Vector.<String>): void {
        super.method_153(param1);
        if (_target > 0) {
            _description = class_88.getItem("q2_condition_undefined_n").replace(/%count%/, _target);
        }
    }
}
}
