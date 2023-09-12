package package_443 {

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.model.traits.class_306;
import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;

import package_373.class_2134;
import package_373.class_2456;

public class class_2462 implements class_2461, IDisposable {


    private var var_127: class_2134;

    private var var_1059: Boolean = false;

    public function class_2462() {
        super();
    }

    public function initialize(param1: class_306, param2: class_2134, param3: Object): void {
        this.var_127 = param2;
    }

    public function decorate(): void {
        class_1210.instance.method_3528.method_4821.const_3022.changed.add(this.method_3048);
        this.method_3048();
    }

    public function disposeView(param1: Boolean = false): void {
        class_1210.instance.method_3528.method_4821.const_3022.changed.remove(this.method_3048);
    }

    private function method_3048(): void {
        var _loc2_: * = null;
        var _loc1_: * = class_1210.instance.method_3528.method_4821.const_3022.value > 1.3;
        if (this.var_1059 != _loc1_) {
            this.var_1059 = _loc1_;
            for each(_loc2_ in this.var_127.method_3287) {
                _loc2_.mesh.method_3545.const_517.value = !!this.var_1059 ? 2 : 1;
            }
        }
    }
}
}
