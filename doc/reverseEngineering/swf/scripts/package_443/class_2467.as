package package_443 {

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.model.traits.class_306;

import package_373.class_2134;

import package_69.Box;
import package_69.class_180;

public class class_2467 implements class_2461, IDisposable {


    private var var_176: class_306;

    private var var_4140: class_180;

    private var var_127: class_2134;

    public function class_2467() {
        super();
    }

    public function initialize(param1: class_306, param2: class_2134, param3: Object): void {
        this.var_176 = param1;
        this.var_127 = param2;
        this.var_127.disposeAnimation = "dispose";
        this.var_4140 = param1.owner as class_180;
        this.var_4140.name_43.add(this.method_3698);
    }

    public function decorate(): void {
        if (this.var_4140 is Box && Boolean(this.var_4140.method_4697)) {
            this.var_127.method_6420("spawnNew");
        } else {
            this.var_127.method_6420("spawn");
        }
    }

    public function disposeView(param1: Boolean = false): void {
        this.method_3293();
    }

    private function method_3698(): void {
        this.method_3293();
        this.var_127.disposeAnimation = "collect";
    }

    private function method_3293(): void {
        this.var_4140.name_43.remove(this.method_3698);
    }
}
}
