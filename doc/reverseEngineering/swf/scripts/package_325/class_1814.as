package package_325 {

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_38.class_924;

import package_396.TeamDeathMatchLobbywindowProxy;

public class class_1814 extends SimpleCommand {


    public function class_1814() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: class_924 = param1.getBody() as class_924;
        var _loc3_: TeamDeathMatchLobbywindowProxy = facade.retrieveProxy(TeamDeathMatchLobbywindowProxy.NAME) as TeamDeathMatchLobbywindowProxy;
        _loc3_.method_5353(_loc2_);
    }
}
}
