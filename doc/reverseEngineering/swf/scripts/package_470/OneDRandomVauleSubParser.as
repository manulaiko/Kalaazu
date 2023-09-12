package package_470 {

import package_438.class_2421;

import package_466.class_2598;

import package_485.class_2716;

public class OneDRandomVauleSubParser extends class_2421 {


    public function OneDRandomVauleSubParser(param1: String) {
        super(param1, const_1615);
    }

    public static function get identifier(): * {
        return class_2598.OneDRandomVauleSubParser;
    }

    override public function method_5169(param1: *, param2: Number = 30): void {
        super.method_5169(param1, param2);
        var_4689 = new class_2716(var_78, _data.min, _data.max);
    }
}
}
