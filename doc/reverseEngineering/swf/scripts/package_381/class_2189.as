package package_381 {

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.map.model.traits.class_306;
import net.bigpoint.darkorbit.map.view3D.class_1211;

import package_27.class_82;

import package_295.class_1752;

import package_75.class_1869;

public class class_2189 extends class_2160 {

    private static const URL: String = "warp_ship.zip";


    private var var_3033: class_1752;

    public function class_2189(param1: class_1211, param2: class_1869) {
        this.var_3033 = param1.method_3658.method_6501(param2.source.method_1954(class_306));
        super(param2, URL, param2.source.position);
    }

    override protected function method_1460(): void {
        class_82.playSoundEffect(class_126.const_2212);
        super.method_1460();
    }
}
}
