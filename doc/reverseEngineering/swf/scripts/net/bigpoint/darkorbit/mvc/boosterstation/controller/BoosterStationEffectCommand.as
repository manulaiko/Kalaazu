package net.bigpoint.darkorbit.mvc.boosterstation.controller {

import net.bigpoint.darkorbit.mvc.boosterstation.view.BoosterStation;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_38.class_315;

import package_84.class_243;

public class BoosterStationEffectCommand extends class_243 {


    public function BoosterStationEffectCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: class_315 = param1.getBody() as class_315;
        var _loc3_: BoosterStation = name_47.map.method_327(_loc2_.name_128) as BoosterStation;
        if (_loc3_) {
            if (_loc2_.activated) {
                _loc3_.activate(Math.ceil(Number(_loc2_.attribute) * 1.2));
            } else {
                _loc3_.deactivate();
            }
        }
    }
}
}
