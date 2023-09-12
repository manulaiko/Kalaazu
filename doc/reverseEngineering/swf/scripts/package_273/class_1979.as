package package_273 {

import net.bigpoint.darkorbit.mvc.battlestationswindow.BattleStationNotification;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

public class class_1979 extends SimpleCommand {


    public function class_1979() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: Array = param1.getBody() as Array;
        var _loc3_: int = int(_loc2_[0]);
        var _loc4_: String = _loc2_[1];
        sendNotification(BattleStationNotification.const_1059, _loc4_);
    }
}
}
