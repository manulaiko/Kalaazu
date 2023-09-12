package package_314 {

import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

import package_11.class_262;

import package_388.class_2256;

import package_389.class_2257;

import package_391.HintSystemHintOverviewWindowMediator;

public class class_1792 extends AsyncCommand {


    public function class_1792() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: AssetsProxy = facade.retrieveProxy(AssetsProxy.NAME) as AssetsProxy;
        _loc2_.load(class_2256.const_361, this.handleXMLLoaded, this.method_799);
    }

    protected function handleXMLLoaded(param1: class_262): void {
        var _loc2_: class_2257 = facade.retrieveMediator(class_2257.NAME) as class_2257;
        _loc2_.method_649.skinsStructure = param1.method_4925();
        var _loc3_: HintSystemHintOverviewWindowMediator = facade.retrieveMediator(HintSystemHintOverviewWindowMediator.NAME) as HintSystemHintOverviewWindowMediator;
        _loc3_.method_649.skinsStructure = param1.method_4925();
        commandComplete();
    }

    protected function method_799(param1: class_262): void {
    }
}
}
