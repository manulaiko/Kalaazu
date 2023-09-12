package package_210 {

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_267.SectorControlProxy;

public class class_1938 extends SimpleCommand {


    public function class_1938() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        (facade.retrieveProxy(SectorControlProxy.NAME) as SectorControlProxy).method_5402 = null;
    }
}
}
