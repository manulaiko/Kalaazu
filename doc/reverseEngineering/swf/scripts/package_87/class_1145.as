package package_87 {

import net.bigpoint.darkorbit.mvc.common.model.MapManagerProxy;
import net.bigpoint.darkorbit.settings.Settings;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

public class class_1145 extends AsyncCommand {

    public static const const_2227: String = "maps.php";


    public function class_1145() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: String = "NaNxml/" + const_2227;
        var _loc3_: MapManagerProxy = facade.retrieveProxy(MapManagerProxy.NAME) as MapManagerProxy;
        _loc3_.loadConfig(_loc2_, commandComplete);
    }
}
}
