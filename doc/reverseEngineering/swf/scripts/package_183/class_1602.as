package package_183 {

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;

public class class_1602 extends Condition {


    private var name_2: int;

    public function class_1602() {
        super();
    }

    override protected function method_153(param1: Vector.<String>): void {
        super.method_153(param1);
        if (Boolean(name_62) && _target > 0) {
            var_106 = "/" + _target;
        } else {
            _description = class_88.getItem("q2_condition_undefined_challenge");
        }
        this.name_2 = int(param1[0]);
        var _loc2_: uint = uint(class_126.instance.method_3780[this.name_2]);
        _description = _description.replace(/%ore%/, class_126.instance.method_6484[_loc2_]);
        var_3277 = method_6395("ore_" + this.name_2 + ".png");
    }

    override public function get method_1303(): String {
        return String(_current);
    }
}
}
