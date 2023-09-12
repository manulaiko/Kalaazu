package package_221 {

import org.puremvc.as3.multicore.interfaces.INotification;

import package_109.class_297;

import package_139.class_1156;

import package_220.class_1270;

import package_38.class_472;
import package_38.class_508;
import package_38.class_568;
import package_38.class_571;

public class class_1296 extends class_1270 {


    public function class_1296() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: class_571 = param1.getBody() as class_571;
        var _loc3_: class_508 = _loc2_.var_2749;
        var _loc4_: class_568 = _loc2_.location;
        var _loc5_: class_472 = _loc2_.target;
        var _loc6_: class_297 = method_1772.method_5321;
        var _loc7_: class_1156;
        (_loc7_ = new class_1156()).init(_loc2_.id, _loc2_.name, _loc3_.hp, _loc3_.var_737, _loc3_.var_2217, _loc3_.var_3738, _loc3_.shield, _loc3_.name_105, _loc4_.mapId, _loc4_.x, _loc4_.y, _loc2_.level, _loc2_.active, _loc2_.cloaked, _loc2_.name_162, _loc2_.faction.faction, _loc2_.var_2971.var_2971, _loc2_.name_123.name_145, _loc5_.var_4184.var_2971, _loc2_.var_5046, _loc2_.var_3695.var_3867);
        _loc7_.var_311 = _loc2_.var_3695.var_881;
        _loc7_.var_2305 = Boolean(map.method_4929.target) && map.method_4929.target.id == _loc2_.id;
        _loc7_.name_22.var_4879 = _loc5_.name;
        _loc7_.name_22.var_111 = _loc5_.var_2749.hp;
        _loc7_.name_22.var_707 = _loc5_.var_2749.var_737;
        _loc7_.name_22.var_4409 = _loc5_.var_2749.var_2217;
        _loc7_.name_22.var_2451 = _loc5_.var_2749.var_3738;
        _loc7_.name_22.var_4678 = _loc5_.var_2749.shield;
        _loc7_.name_22.name_105 = _loc5_.var_2749.name_105;
        method_2479.method_281(_loc7_);
    }
}
}
