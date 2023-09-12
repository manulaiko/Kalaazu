package package_207 {

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_261.TDMStatusUiMediator;

import package_92.TDMResultWindowNotifications;

public class class_1319 extends SimpleCommand {


    public function class_1319() {
        super();
    }

    override public function execute(param1: INotification): void {
        sendNotification(TDMResultWindowNotifications.SHOW, param1.getBody());
        facade.removeMediator(TDMStatusUiMediator.NAME);
    }
}
}
