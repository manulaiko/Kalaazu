package package_82 {

import org.puremvc.as3.multicore.interfaces.ICommand;
import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_255.StatsProxy;

public class class_1112 extends SimpleCommand implements ICommand {


    public function class_1112() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: * = null;
        _loc2_ = param1.getBody() as Array;
        var _loc3_: String = String(_loc2_[0]);
        var _loc4_: String = String(_loc2_[1]);
        var _loc5_: StatsProxy;
        (_loc5_ = facade.retrieveProxy(StatsProxy.NAME) as StatsProxy).method_3827(_loc3_, _loc4_);
    }
}
}
