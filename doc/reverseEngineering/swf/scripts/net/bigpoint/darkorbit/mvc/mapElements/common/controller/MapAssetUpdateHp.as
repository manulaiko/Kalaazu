package net.bigpoint.darkorbit.mvc.mapElements.common.controller {

import net.bigpoint.darkorbit.map.model.traits.class_308;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_84.class_243;

public class MapAssetUpdateHp extends class_243 {


    public function MapAssetUpdateHp() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: int = int(param1.getBody()[0]);
        var _loc3_: int = int(param1.getBody()[1]);
        var _loc4_: int = int(param1.getBody()[2]);
        var _loc5_: int = int(param1.getBody()[3]);
        var _loc6_: int = int(param1.getBody()[4]);
        var _loc7_: class_308;
        if (_loc7_ = map.method_5806(_loc2_, class_308) as class_308) {
            _loc7_.const_3026.value = _loc4_;
            _loc7_.hp.value = _loc3_;
            _loc7_.const_805.value = _loc6_;
            _loc7_.const_2381.value = _loc5_;
        }
    }
}
}
