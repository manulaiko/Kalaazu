package package_205 {

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_258.class_1657;

import package_38.class_803;

public class class_1246 extends SimpleCommand {


    public function class_1246() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: class_803 = param1.getBody() as class_803;
        sendNotification(class_1657.UPDATE_FIGHT_PHASE_COUNTDOWN, _loc2_.var_2065);
    }
}
}
