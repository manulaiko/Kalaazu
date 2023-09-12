package package_410 {

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_317.DominationNotificationNames;

import package_318.class_1796;

public class class_2681 extends SimpleCommand {


    public function class_2681() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        facade.removeProxy(class_1796.NAME);
        facade.registerCommand(DominationNotificationNames.INIT, class_2313);
    }
}
}
