package package_381 {

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.map.view3D.class_1211;

import package_27.class_82;

import package_75.class_1863;

public class class_2177 extends class_2160 {

    private static const const_48: String = "draw_fire.zip";


    private var _effect: class_1863;

    public function class_2177(param1: class_1211, param2: class_1863) {
        this._effect = param2;
        super(param2, const_48, param2.source.position);
    }

    override protected function method_1460(): void {
        class_82.playSoundEffect(class_126.const_974, false, false, this._effect.source.position.x, this._effect.source.position.y);
        super.method_1460();
    }
}
}
