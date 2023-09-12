package package_207 {

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_83.TDMStatusNotification;

public class class_1421 extends SimpleCommand {


    public function class_1421() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        sendNotification(TDMStatusNotification.UPDATE, param1.getBody());
    }
}
}
