package net.bigpoint.darkorbit.mvc.battleStation.controller {

import net.bigpoint.darkorbit.map.model.traits.class_1180;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_84.class_243;

public class CloseBuildingUIBubbleCommand extends class_243 {


    public function CloseBuildingUIBubbleCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: int = param1.getBody() as int;
        var _loc3_: class_1180 = name_47.map.method_5806(_loc2_, class_1180) as class_1180;
        if (_loc3_) {
            _loc3_.method_3611(false);
        }
    }
}
}
