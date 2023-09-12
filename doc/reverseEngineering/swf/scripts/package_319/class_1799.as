package package_319 {

import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

import package_11.class_262;

import package_388.class_2256;

import package_391.HintSystemHintOverviewWindowMediator;

public class class_1799 extends AsyncCommand {


    public function class_1799() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: AssetsProxy = facade.retrieveProxy(AssetsProxy.NAME) as AssetsProxy;
        _loc2_.load(class_2256.const_3027, this.method_1617, this.method_3311);
    }

    protected function method_1617(param1: class_262): void {
        var _loc2_: XML = param1.method_4925();
        var _loc3_: HintSystemHintOverviewWindowMediator = facade.retrieveMediator(HintSystemHintOverviewWindowMediator.NAME) as HintSystemHintOverviewWindowMediator;
        _loc3_.method_649.uiStructure = _loc2_;
        commandComplete();
    }

    protected function method_3311(param1: class_262): void {
    }
}
}
