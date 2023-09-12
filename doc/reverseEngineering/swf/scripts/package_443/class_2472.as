package package_443 {

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.common.class_80;
import net.bigpoint.darkorbit.map.model.traits.class_306;

import package_126.class_1091;
import package_126.class_354;

import package_22.class_198;

import package_373.class_2134;
import package_373.class_2159;

public class class_2472 implements class_2461, class_80, IDisposable {


    private var var_176: class_306;

    private var var_127: class_2134;

    private var var_2696: class_2159;

    public function class_2472() {
        super();
    }

    public function initialize(param1: class_306, param2: class_2134, param3: Object): void {
        this.var_176 = param1;
        this.var_127 = param2;
    }

    public function decorate(): void {
        var _loc2_: * = null;
        var _loc1_: class_354 = this.var_176.owner as class_354;
        if (_loc1_.var_310 > 0) {
            _loc2_ = class_198.var_3786[_loc1_.var_310] as class_1091;
            this.var_2696 = new class_2159(_loc2_.resKey3D + ".zip");
            this.var_2696.ready.add(this.method_1692);
        }
    }

    public function updateObj(param1: Number): void {
        if (this.var_2696) {
            this.var_2696.updateObj(param1);
        }
    }

    public function disposeView(param1: Boolean = false): void {
        if (this.var_2696) {
            this.var_2696.ready.remove(this.method_1692);
            this.var_2696.disposeView(param1);
            this.var_2696 = null;
        }
    }

    private function method_1692(): void {
        this.var_127.addChild(this.var_2696.view);
    }
}
}
