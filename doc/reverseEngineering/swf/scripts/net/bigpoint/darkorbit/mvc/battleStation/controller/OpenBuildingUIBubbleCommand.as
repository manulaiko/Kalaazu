package net.bigpoint.darkorbit.mvc.battleStation.controller {

import net.bigpoint.darkorbit.map.model.traits.class_1180;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_29.class_85;

import package_84.class_243;

public class OpenBuildingUIBubbleCommand extends class_243 {


    public function OpenBuildingUIBubbleCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc3_: * = null;
        var _loc2_: class_85 = name_47.map.method_327(param1.getBody() as int);
        if (_loc2_) {
            _loc3_ = _loc2_.method_1954(class_1180) as class_1180;
            if (_loc3_) {
                _loc3_.method_3611(true);
            }
        }
    }
}
}
