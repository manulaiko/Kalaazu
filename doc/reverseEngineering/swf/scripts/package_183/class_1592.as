package package_183 {

import flash.utils.Dictionary;

import net.bigpoint.as3toolbox.bplocale.class_88;

public class class_1592 extends Condition {


    private var var_1167: Dictionary;

    public function class_1592() {
        this.var_1167 = new Dictionary();
        super();
    }

    override protected function method_153(param1: Vector.<String>): void {
        super.method_153(param1);
        this.var_1167[15] = "_COLDWAVE_HARD";
        this.var_1167[16] = "_COLDWAVE_EASY";
        _description = _description.replace(/%TYPE%/, class_88.getItem("q2_condition_undefined" + this.var_1167[int(param1[1])]));
    }
}
}
