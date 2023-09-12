package package_279 {

import net.bigpoint.darkorbit.map.class_87;
import net.bigpoint.darkorbit.map.common.class_1699;
import net.bigpoint.darkorbit.map.model.traits.class_308;
import net.bigpoint.darkorbit.map.model.traits.class_319;

import package_113.class_310;

import package_195.class_1203;

public class class_1702 extends class_1203 implements class_1699 {


    private var var_176: class_308;

    private var var_3549: class_2014;

    public function class_1702(param1: class_87, param2: class_308) {
        this.var_176 = param2;
        super(param1, param2.owner.position);
        if (param2.owner.method_1954(class_310) != null) {
            return;
        }
        this.var_3549 = new class_2014(param2);
        this.var_3549.visible = false;
        this.var_3549.x = -Number(this.var_3549.config.width) / 2;
        var _loc3_: class_319 = param2.owner.method_1954(class_319) as class_319;
        if (_loc3_) {
            this.var_3549.y = -Number(_loc3_.clickRadius);
        }
        addChild(this.var_3549);
    }

    override public function disposeView(param1: Boolean = false): void {
        if (this.var_3549) {
            this.var_3549.disposeView();
        }
        super.disposeView(param1);
    }

    public function get layer(): int {
        return 0;
    }
}
}
