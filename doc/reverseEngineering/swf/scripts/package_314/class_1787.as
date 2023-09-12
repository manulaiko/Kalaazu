package package_314 {

import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

import package_11.class_262;

import package_388.class_2256;

import package_389.class_2257;

public class class_1787 extends AsyncCommand {


    public function class_1787() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: AssetsProxy = facade.retrieveProxy(AssetsProxy.NAME) as AssetsProxy;
        _loc2_.load(class_2256.const_2297, this.method_5344, this.method_5325);
    }

    protected function method_5344(param1: class_262): void {
        var _loc2_: class_2257 = facade.retrieveMediator(class_2257.NAME) as class_2257;
        _loc2_.method_649.templatesStructure = param1.method_4925();
        commandComplete();
    }

    protected function method_5325(param1: class_262): void {
    }
}
}
