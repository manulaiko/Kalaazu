package package_183 {

public class class_1626 extends Condition {


    public function class_1626() {
        super();
    }

    override protected function method_153(param1: Vector.<String>): void {
        super.method_153(param1);
        _description = description.replace(/%count%/, _target);
        if (_target > 0) {
            var_106 = "/" + _target;
        }
        var_3277 = method_6395("bonus_box");
    }

    override public function get method_1303(): String {
        return String(_current);
    }
}
}
