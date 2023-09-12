package package_225 {

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_317.DominationNotificationNames;

import package_318.class_1796;

import package_38.class_492;

public class class_1282 extends SimpleCommand {


    public function class_1282() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        sendNotification(DominationNotificationNames.INIT);
        var _loc2_: class_492 = param1.getBody() as class_492;
        var _loc3_: class_1796 = facade.retrieveProxy(class_1796.NAME) as class_1796;
        _loc3_.method_6297(_loc2_.name_107, _loc2_.name_139, _loc2_.name_27, _loc2_.var_3151, _loc2_.var_1359, _loc2_.var_2015);
    }
}
}
