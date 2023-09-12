package package_214 {

import package_37.class_170;

import package_38.class_163;
import package_38.class_353;
import package_38.class_647;
import package_38.class_853;

public class class_1247 extends class_170 {


    public function class_1247() {
        super();
    }

    public static function run(param1: class_853): void {
        var _loc2_: uint = uint(param1.var_158.var_3759);
        var _loc3_: Vector.<class_353> = param1.var_1120;
        var_574.method_6154().method_3783().method_4191(_loc2_, _loc3_);
    }

    override public function method_4738(param1: Vector.<String>): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: Number = NaN;
        var _loc2_: class_853 = new class_853();
        param1 = param1.reverse();
        var _loc3_: uint = uint(param1.pop());
        _loc2_.var_158 = new class_647(_loc3_);
        var _loc7_: int = param1.length - 1;
        while (_loc7_ >= 0) {
            _loc5_ = new class_163(_loc7_);
            _loc6_ = Number(param1[_loc7_]);
            _loc4_ = new class_353(_loc5_, _loc6_);
            _loc2_.var_1120.push(_loc4_);
            _loc7_--;
        }
        run(_loc2_);
    }
}
}
