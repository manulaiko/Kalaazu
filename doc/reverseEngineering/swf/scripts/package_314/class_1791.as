package package_314 {

import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;
import net.bigpoint.darkorbit.mvc.hintSystem.model.class_2264;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

import package_11.class_262;

import package_38.class_595;

import package_392.class_2265;
import package_392.class_2266;

public class class_1791 extends AsyncCommand {


    private var var_3108: uint;

    public function class_1791() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc4_: * = null;
        var _loc2_: class_595 = param1.getBody() as class_595;
        this.var_3108 = _loc2_.window.content;
        var _loc3_: class_2265 = class_2264.method_473(this.var_3108);
        if (_loc2_.paymentLink) {
            _loc3_.content.paymentLink = _loc2_.paymentLink;
            _loc4_ = _loc3_.method_3751(class_2266.const_1451);
        } else {
            _loc4_ = _loc3_.method_3751(class_2266.const_1383);
        }
        var _loc5_: AssetsProxy;
        (_loc5_ = facade.retrieveProxy(AssetsProxy.NAME) as AssetsProxy).load(_loc4_, this.method_1617, this.method_3311);
    }

    protected function method_1617(param1: class_262): void {
        var _loc2_: class_2265 = class_2264.method_473(this.var_3108);
        var _loc3_: XML = param1.method_4925();
        _loc2_.method_462 = XML(_loc3_.window);
        var _loc4_: XMLList;
        if ((_loc4_ = _loc3_.playlist).length() == 1) {
            _loc2_.method_481 = XML(_loc4_);
        }
        commandComplete();
    }

    protected function method_3311(param1: class_262): void {
    }
}
}
