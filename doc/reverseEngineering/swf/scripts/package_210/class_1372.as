package package_210 {

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_267.SectorControlProxy;

import package_38.class_691;

public class class_1372 extends SimpleCommand {


    public function class_1372() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: class_691 = param1.getBody() as class_691;
        var _loc3_: SectorControlProxy = facade.retrieveProxy(SectorControlProxy.NAME) as SectorControlProxy;
        _loc3_.method_4632(_loc2_);
    }
}
}
