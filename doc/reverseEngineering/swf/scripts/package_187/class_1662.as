package package_187 {

import net.bigpoint.darkorbit.mvc.common.AssetNotifications;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

import package_11.class_38;

public class class_1662 extends AsyncCommand {


    public function class_1662() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        sendNotification(AssetNotifications.LOAD_ASSET, ["groupSystemShipIcons", this.onComplete, this.onError]);
    }

    private function onError(param1: *): void {
    }

    private function onComplete(param1: class_38): void {
        commandComplete();
    }
}
}
