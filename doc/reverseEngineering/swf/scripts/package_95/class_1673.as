package package_95 {

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_348.class_1969;

import package_73.class_196;

public class class_1673 extends SimpleCommand {


    public function class_1673() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        facade.registerCommand(class_196.CREATE_SETTINGS_WINDOW, class_1969);
    }
}
}
