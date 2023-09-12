package package_316 {

import net.bigpoint.darkorbit.mvc.hintSystem.model.class_2260;
import net.bigpoint.darkorbit.mvc.hintSystem.model.class_2264;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

import package_28.EventStreamClient;

import package_38.class_595;

import package_388.HintSystemNotifications;

import package_392.class_2265;

import package_76.TimeMeasuring;

public class class_1793 extends AsyncCommand {


    public function class_1793() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc6_: * = null;
        super.execute(param1);
        var _loc2_: class_595 = param1.getBody() as class_595;
        var _loc3_: class_2260 = facade.retrieveProxy(class_2260.NAME) as class_2260;
        var _loc4_: uint = uint(_loc2_.window.content);
        var _loc5_: class_2265;
        (_loc5_ = class_2264.method_473(_loc4_)).name_78 = _loc2_.var_3110;
        if (_loc5_) {
            _loc5_.content.method_4859 = _loc2_.visibility;
            _loc5_.content.method_6347 = _loc2_.var_541;
            if (_loc2_.var_541) {
                _loc3_.method_4511(_loc4_, _loc5_);
            }
            TimeMeasuring.start(_loc4_.toString());
            sendNotification(HintSystemNotifications.const_3073, _loc5_);
            _loc6_ = _loc5_.method_1230;
            EventStreamClient.track("hint_displayed", {
                "hintIdentifier": _loc6_,
                "source": (!!_loc5_.name_78 ? "archive" : "server")
            });
        }
        commandComplete();
    }
}
}
