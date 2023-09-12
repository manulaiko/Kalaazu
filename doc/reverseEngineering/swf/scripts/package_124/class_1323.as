package package_124 {

import net.bigpoint.darkorbit.net.class_1795;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_267.SectorControlProxy;

import package_38.class_582;

import package_84.class_243;

public class class_1323 extends class_243 {


    public function class_1323() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: class_582 = param1.getBody() as class_582;
        class_1795.getInstance().method_1991(_loc2_.var_1818);
        var _loc3_: SectorControlProxy = facade.retrieveProxy(SectorControlProxy.NAME) as SectorControlProxy;
        var _loc4_: int = int(_loc3_.method_3110(_loc2_.var_1818));
        _loc3_.method_202(_loc2_.var_1818);
        map.method_918(_loc4_);
    }
}
}
