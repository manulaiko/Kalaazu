package package_187 {

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_108.GroupProxy;

public class class_1923 extends SimpleCommand {


    public function class_1923() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: GroupProxy = facade.retrieveProxy(GroupProxy.NAME) as GroupProxy;
        _loc2_.method_2251 = Boolean(param1.getBody());
    }
}
}
