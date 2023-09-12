package package_329 {

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_80.QuestProxy;

public class class_1830 extends SimpleCommand {


    public function class_1830() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: QuestProxy = facade.retrieveProxy(QuestProxy.NAME) as QuestProxy;
        var _loc3_: int = param1.getBody() as int;
        _loc2_.method_5874(_loc3_);
    }
}
}
