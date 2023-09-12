package package_329 {

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_80.QuestProxy;

public class class_1823 extends SimpleCommand {


    public function class_1823() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: int = int(param1.getBody()[0]);
        var _loc3_: int = int(param1.getBody()[1]);
        this.method_3605.questAccomplished(_loc2_, _loc3_);
    }

    private function get method_3605(): QuestProxy {
        return facade.retrieveProxy(QuestProxy.NAME) as QuestProxy;
    }
}
}
