package package_75 {

import net.bigpoint.darkorbit.class_126;

import package_100.class_1174;

import package_29.class_85;

import package_35.class_338;
import package_35.class_348;

public class class_1865 extends class_348 {

    private static const const_104: int = 1500;


    private var var_4312: uint;

    public function class_1865(param1: class_85) {
        super(class_338.const_2567, param1, const_2856, null, class_126.const_3128);
        method_2711 = const_104;
    }

    override public function activate(): Boolean {
        super.activate();
        var _loc1_: class_1174 = source.method_1954(class_1174) as class_1174;
        if (_loc1_) {
            this.var_4312 = _loc1_.color;
            _loc1_.color = 65280;
        }
        return super.activate();
    }

    override public function deactivate(): void {
        var _loc1_: * = null;
        if (source) {
            _loc1_ = source.method_1954(class_1174) as class_1174;
            if (_loc1_) {
                _loc1_.color = this.var_4312;
            }
        }
        super.deactivate();
    }

    override public function get method_5314(): Boolean {
        return true;
    }
}
}
