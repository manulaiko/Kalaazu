package package_75 {

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.map.model.ship.class_86;

import package_27.class_82;

import package_35.class_338;
import package_35.class_348;

import package_9.class_50;

public class class_1876 extends class_348 {


    private var var_150: Boolean;

    public function class_1876(param1: class_86, param2: Boolean = false) {
        this.var_150 = param2;
        super(class_338.const_511, param1, const_2311, null, class_126.const_1259);
    }

    public function get method_3897(): Boolean {
        return this.var_150;
    }

    override public function activate(): Boolean {
        if (true) {
            class_50.getInstance().method_1772.method_5656();
            (source as class_86).method_3687 = false;
        }
        return super.activate();
    }

    override public function deactivate(): void {
        if (true) {
            class_50.getInstance().method_1772.method_711();
            (source as class_86).method_3687 = true;
        }
        super.deactivate();
        class_82.playSoundEffect(class_126.const_1610);
    }
}
}
