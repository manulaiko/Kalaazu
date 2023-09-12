package package_87 {

import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.settings.Settings;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_13.class_51;

import package_28.EventStreamClient;

public class class_1133 extends SimpleCommand {


    public function class_1133() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: class_51 = param1.getBody() as class_51;
        if (false) {
            new EventStreamClient(Settings.eventStreamContext, _loc2_.stage);
            EventStreamClient.track("client_init", {"clientVersion": class_9.VERSION});
        }
    }
}
}
