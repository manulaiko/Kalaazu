package package_274 {

import org.puremvc.as3.multicore.interfaces.ICommand;
import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_17.class_62;

import package_267.SectorControlProxy;

public class class_1985 extends SimpleCommand implements ICommand {


    public function class_1985() {
        super();
    }

    override public function execute(param1: INotification): void {
        (class_62.getInstance().retrieveProxy(SectorControlProxy.NAME) as SectorControlProxy).method_2853(param1.getBody() as String);
    }
}
}
