package package_231 {

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_328.JackpotBattleNotification;

import package_398.JackpotStatusProxy;

public class class_2276 extends SimpleCommand {


    public function class_2276() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        facade.removeProxy(JackpotStatusProxy.NAME);
        facade.removeCommand(JackpotBattleNotification.CLEAN_UP);
        facade.removeCommand(JackpotBattleNotification.START_UP);
    }
}
}
