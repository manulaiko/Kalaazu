package package_211 {

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.map.model.class_90;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_124.class_1281;

import package_267.SectorControlProxy;

import package_312.class_1785;

import package_37.class_363;

import package_38.class_445;
import package_38.class_804;
import package_38.class_868;

import package_84.class_243;

public class class_1238 extends class_243 {


    public function class_1238() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: class_804 = param1.getBody() as class_804;
        _loc2_.var_1651 = !!_loc2_.var_4581 ? class_126.instance.method_2276[_loc2_.name_75.faction] : "NONE";
        class_1281.run(_loc2_);
        var _loc3_: SectorControlProxy = facade.retrieveProxy(SectorControlProxy.NAME) as SectorControlProxy;
        var _loc4_: int = int(_loc3_.method_3110(_loc2_.var_1818));
        var _loc5_: class_1785;
        if (!(_loc5_ = map.method_327(_loc4_) as class_1785)) {
            _loc4_ = 0;
            _loc3_.method_664(_loc2_.var_1818, _loc4_);
            class_363.execute(new class_868(new class_445(class_445.const_1417), "", _loc2_.name_75.faction, "", _loc4_, 0, 0, _loc2_.var_4763[0], _loc2_.var_4763[1], 0, false, false, false, false, null));
        }
        (_loc5_ = map.method_327(_loc4_) as class_1785).name_167.value = _loc2_.name_167;
        _loc5_.name_70.value = _loc2_.name_70;
        _loc5_.name_75.value = _loc2_.name_75.faction;
        _loc5_.name_4 = _loc2_.name_4;
        _loc5_.const_2579.value = _loc2_.var_4581;
        _loc5_.enabled.value = true;
    }
}
}
