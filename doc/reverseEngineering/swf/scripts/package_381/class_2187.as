package package_381 {

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.map.view3D.class_1211;

import package_27.class_82;

import package_75.class_369;

public class class_2187 extends class_2160 {

    private static const const_48: String = "abstract_ui_level_up.zip";


    public function class_2187(param1: class_1211, param2: class_369) {
        super(param2, const_48, param2.source.position);
    }

    override protected function method_1460(): void {
        super.method_1460();
        class_82.playSoundEffect(class_126.const_1621, false, false);
    }
}
}
