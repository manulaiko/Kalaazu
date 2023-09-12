package package_381 {

import net.bigpoint.darkorbit.map.view3D.class_1211;

import package_75.class_2015;
import package_75.class_355;

import package_9.class_50;

public class class_2199 extends class_2160 {

    private static const const_48: String = "collect_cargo.zip";

    private static const const_1190: String = "collect_cargo_long.zip";


    private var _effect: class_355;

    public function class_2199(param1: class_1211, param2: class_355) {
        this._effect = param2;
        var _loc3_: String = const_48;
        if (param2.method_3034 > 4) {
            _loc3_ = const_1190;
        }
        super(param2, _loc3_, param2.source.position, null, true);
    }

    override protected function method_1460(): void {
        super.method_1460();
        if (this._effect.method_3435) {
            class_50.getInstance().map.effects.method_5084(new class_2015(this._effect.source, this._effect.method_3034));
        }
    }
}
}
