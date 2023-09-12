package package_373 {

import net.bigpoint.darkorbit.map.common.class_80;

import package_10.class_305;

import package_295.class_1752;

public class class_2459 extends class_1752 implements class_80 {

    private static const const_1516: Vector.<Number> = new Vector.<Number>(3, true);


    private var var_377: class_305;

    private var var_3223: class_1752;

    public function class_2459(param1: class_305, param2: class_1752) {
        super();
        this.var_377 = param1;
        this.var_3223 = param2;
    }

    public function updateObj(param1: Number): void {
        const_1516[0] = const_1516[1] = const_1516[2] = 0;
        if (scene) {
            sceneTransform.transformVectors(const_1516, const_1516);
            this.var_3223.method_2908.transformVectors(const_1516, const_1516);
        }
        this.var_377.setTo(const_1516[0], 0, const_1516[1]);
    }
}
}
