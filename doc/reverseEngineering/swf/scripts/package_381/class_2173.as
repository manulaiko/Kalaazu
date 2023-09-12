package package_381 {

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.map.view3D.class_1211;

import package_10.class_305;

import package_27.class_82;

import package_75.class_367;

public class class_2173 extends class_2160 {

    private static const const_48: String = "spawn.zip";


    public function class_2173(param1: class_1211, param2: class_367) {
        super(param2, const_48, new class_305(param2.x, param2.y));
        class_82.playSoundEffect(class_126.const_592, false, false, param2.x, param2.y, true);
    }
}
}
