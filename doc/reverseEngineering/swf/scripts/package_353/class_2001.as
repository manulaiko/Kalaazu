package package_353 {

import net.bigpoint.darkorbit.settings.Profiler;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

import package_13.class_51;

import package_42.ProfileProxy;

public class class_2001 extends AsyncCommand {


    public function class_2001() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: class_51 = param1.getBody() as class_51;
        var _loc3_: ProfileProxy = facade.retrieveProxy(ProfileProxy.NAME) as ProfileProxy;
        _loc3_.method_1137(new Profiler(_loc2_.main));
        commandComplete();
    }
}
}
