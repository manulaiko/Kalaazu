package package_183 {

import net.bigpoint.darkorbit.class_126;

public class class_1613 extends Condition {

    private static const const_262: String = "0";

    private static const const_3224: String = ", ";


    public function class_1613() {
        super();
    }

    override protected function method_153(param1: Vector.<String>): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        super.method_153(param1);
        if (param1.length > 1) {
            _loc2_ = this.method_599(param1);
            _loc3_ = this.method_6407(param1);
            _description = _description.replace(/%FROM%/, _loc2_).replace(/%TO%/, _loc3_);
        }
    }

    private function method_6407(param1: Vector.<String>): String {
        var _loc3_: * = null;
        var _loc2_: class_126 = class_126.instance;
        var _loc4_: Vector.<String> = new Vector.<String>();
        while (_loc3_ = param1.pop()) {
            _loc4_.push(_loc2_.var_1524[int(_loc3_)]);
        }
        return _loc4_.join(const_3224);
    }

    private function method_599(param1: Vector.<String>): String {
        var _loc3_: * = null;
        var _loc2_: class_126 = class_126.instance;
        var _loc4_: Vector.<String> = new Vector.<String>();
        while ((_loc3_ = param1.pop()) != const_262) {
            _loc4_.push(_loc2_.var_1524[int(_loc3_)]);
        }
        return _loc4_.join(const_3224);
    }
}
}
