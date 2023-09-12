package package_95 {

import org.puremvc.as3.multicore.interfaces.ICommand;
import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_13.class_51;

import package_16.class_56;

import package_352.ApplicationMediator;

public class class_1684 extends SimpleCommand implements ICommand {


    public function class_1684() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: class_51 = param1.getBody() as class_51;
        facade.registerMediator(new ApplicationMediator(_loc2_.main.windowContainer));
        sendNotification(class_56.INIT);
    }
}
}
