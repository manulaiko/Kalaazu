package package_124 {

import com.bigpoint.utils.class_73;

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.net.class_1795;

import package_37.class_170;

import package_38.class_442;

public class class_1281 extends class_170 {


    public function class_1281() {
        super();
    }

    public static function run(param1: class_442): void {
        var _loc4_: * = null;
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        var _loc2_: Vector.<class_73> = new Vector.<class_73>();
        var _loc3_: Number = NaN;
        if (param1.shape == class_442.CIRCLE) {
            _loc3_ = Number(param1.var_4763[2]);
            _loc2_.push(new class_73(param1.var_4763[0], param1.var_4763[1]));
        } else {
            _loc4_ = param1.var_4763;
            while (_loc4_.length >= 2) {
                _loc5_ = _loc4_.shift();
                _loc6_ = _loc4_.shift();
                _loc2_.push(new class_73(_loc5_, _loc6_));
            }
        }
        class_1795.getInstance().method_3032(param1.var_1818, class_126.getInstance().method_371(param1.var_3481.var_2008), param1.var_1651, param1.design.var_2918, param1.active, param1.name_149, class_126.getInstance().method_1265(param1.shape), _loc2_, _loc3_);
    }
}
}
