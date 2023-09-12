package package_468 {

import package_438.class_2421;

import package_466.class_2598;

import package_484.class_2726;

public class ThreeDCylinderValueSubParser extends class_2421 {


    public function ThreeDCylinderValueSubParser(param1: String) {
        super(param1, const_1615);
    }

    public static function get identifier(): * {
        return class_2598.ThreeDCylinderValueSubParser;
    }

    override public function method_5169(param1: *, param2: Number = 30): void {
        super.method_5169(param1, param2);
        var_4689 = new class_2726(var_78, _data.innerRadius, _data.outerRadius, _data.height, _data.centerX, _data.centerY, _data.centerZ, _data.dX, _data.dY, _data.dZ);
    }
}
}
