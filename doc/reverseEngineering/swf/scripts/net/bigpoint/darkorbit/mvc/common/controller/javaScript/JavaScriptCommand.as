package net.bigpoint.darkorbit.mvc.common.controller.javaScript {

import flash.external.ExternalInterface;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

public class JavaScriptCommand extends SimpleCommand {


    public function JavaScriptCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: String = param1.getType();
        var _loc3_: Array = param1.getBody() as Array;
        switch (_loc3_.length) {
            case 0:
                ExternalInterface.call(_loc2_);
                break;
            case 1:
                ExternalInterface.call(_loc2_, _loc3_[0]);
                break;
            case 2:
                ExternalInterface.call(_loc2_, _loc3_[0], _loc3_[1]);
        }
    }
}
}
